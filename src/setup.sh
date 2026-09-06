#!/bin/bash
# Install dependencies and tools for the project

set -e

echo "==> Running $(dirname "$(realpath "$0")")/install.sh"

function cleanup()
{
    echo "  -> Cleaning up temporary files..."
    rm -rfv /tmp/terraform.zip
    rm -rfv /tmp/terraform
}

function install_apt()
{
    $(which sudo) apt update
    $(which sudo) apt install -y curl git gzip tar make
}

function install_terraform()
{
    local terraform_version="1.14.9"
    arch="$(case "$(uname -m)" in x86_64) echo amd64 ;; aarch64) echo arm64 ;; esac)"
    terraform_download_url="https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_${arch}.zip"

    echo "  -> Downloading terraform..."
    curl -fsSL "${terraform_download_url}" -o /tmp/terraform.zip

    echo "  -> Unzipping terraform..."
    unzip /tmp/terraform.zip terraform -d /tmp
    sudo cp /tmp/terraform /usr/local/bin/terraform
    sudo chmod +x /usr/local/bin/terraform
}

function install_uv()
{
    local uv_download_url="https://astral.sh/uv/install.sh"
    local python_version="3.10"
    uv_install_path="${HOME}/.local/bin"

    echo "  -> Downloading uv..."
    curl -fsSL "${uv_download_url}" | sh
    export PATH="${PATH}:${uv_install_path}"

    echo "  -> Installing Python ${python_version}..."
    uv python install "${python_version}" --default
}

install_apt
install_terraform
install_uv
