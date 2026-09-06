#!/bin/bash
# Download and generate Terraform modules from the Terraform Registry

set -e

source .env

echo "==> Running $(dirname "$(realpath "$0")")/update.sh"

function fetch_terraform_modules()
{
    local excluded=()
    response="$(curl --retry 3 --retry-delay 3 -fsSL "${tf_modules_base_url}?namespace=${tf_modules_namespace}&provider=${tf_modules_provider}&limit=999")"

    echo "  -> Fetching Terraform modules..."
    echo "${response}" | jq -r '.modules[].name' | while read -r name; do

      versions_url="${tf_modules_base_url}/${tf_modules_namespace}/${name}/${tf_modules_provider}/versions"
      versions_json="$(curl --retry 3 --retry-delay 3 -fsSL "${versions_url}")"
      versions="$(echo "${versions_json}" | jq -r '.modules[0].versions[].version' | sort -V)"

      while read -r version; do
        module_dir="${dir_output}/${name}/${version}"
        module_url="${tf_modules_base_url}/${tf_modules_namespace}/${name}/${tf_modules_provider}/${version}"
        module_json="$(curl --retry 3 --retry-delay 3 -fsSL "${module_url}")"

        echo "    -> Processing module ${name} version ${version}..."

        if [[ " ${excluded[@]} " =~ " ${name} " ]]; then
          echo "     -> Skipping ${name} (excluded)..."
          continue
        fi

        if [ -d "${module_dir}" ]; then
          echo "     -> Skipping ${name} version ${version} (already exists)..."
          continue
        fi

        mkdir -p "${module_dir}"

        echo "${module_json}" | jq -r '.root.readme // empty' > "${module_dir}/README.md"

        if echo "${module_json}" | jq '.root.inputs != null' | grep -q true; then
          echo "${module_json}" | jq '.root.inputs' > "${module_dir}/input.json"
        fi

        if echo "${module_json}" | jq '.root.outputs != null' | grep -q true; then
          echo "${module_json}" | jq '.root.outputs' > "${module_dir}/output.json"
        fi

        echo "      -> Checking for submodules..."

        if echo "${module_json}" | jq -e '.submodules?' > /dev/null; then

          echo "${module_json}" | jq -c '.submodules[]' | while read -r submodule_json; do

            submodule_name="$(echo "${submodule_json}" | jq -r '.name')"
            submodule_dir="${module_dir}/submodules/${submodule_name}"

            echo "      -> Processing submodule ${submodule_name} version ${version}..."

            if [ -d "${submodule_dir}" ]; then
              echo "       -> Skipping ${submodule_name} version ${version} (already exists)..."
              continue
            fi
            
            mkdir -p "${submodule_dir}"

            echo "${submodule_json}" | jq -r '.readme // empty' > "${submodule_dir}/README.md"

            if echo "${submodule_json}" | jq '.inputs != null' | grep -q true; then
              echo "${submodule_json}" | jq '.inputs' > "${submodule_dir}/input.json"
            fi

            if echo "${submodule_json}" | jq '.outputs != null' | grep -q true; then
              echo "${submodule_json}" | jq '.outputs' > "${submodule_dir}/output.json"
            fi

          done
        fi
      done < <(echo "${versions}")
    done
}

function generate_terraform_modules()
{
    uv --version

    echo "  -> Creating virtual environment..."
    uv venv --clear
    source "$(readlink -f .venv/bin/activate)"

    python --version

    echo "  -> Installing dependencies from $(readlink -f requirements.txt)..."
    uv pip install -r "$(readlink -f requirements.txt)"

    python3 "$(dirname "$(realpath "$0")")/main.py"
}

function format_terraform_modules()
{
    terraform --version

    echo "  -> Formating terraform..."
    find . -type f \( -name "*.tf" -o -name "*.tfvars" \) -exec terraform fmt {} \; || true
}

fetch_terraform_modules
generate_terraform_modules
format_terraform_modules

echo "Done!"

exit 0
