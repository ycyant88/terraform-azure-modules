import os
import json


def load_inputs(path):
    with open(path) as f:
        data = json.load(f)
    for var in data:
        var["description"] = sanitize_string(var.get("description", ""))
        var["default"] = format_default(var.get("default"))
    return sorted(data, key=lambda x: x.get("name", ""))


def load_outputs(path):
    with open(path) as f:
        data = json.load(f)
    for output in data:
        output["description"] = sanitize_string(output.get("description", ""))
    return sorted(data, key=lambda x: x.get("name", ""))


def format_default(val):
    if val in ("null", None):
        return "null"
    if val in ("{}", "[]"):
        return val
    try:
        parsed = json.loads(val)
        result = json.dumps(parsed)
    except Exception:
        result = f'"{val}"'
    return result.replace("${", "$${")


def sanitize_string(val):
    if not isinstance(val, str):
        return val
    val = json.dumps(val)[1:-1]
    val = val.replace("`", "")
    val = val.replace("\n", "\\n")
    return val


def write_file(path, content):
    with open(path, "w") as f:
        f.write(content.strip() + "\n")


def render_module_inputs(module_env, context, out_dir):
    write_file(
        os.path.join(out_dir, "backend.tf"),
        module_env.get_template("backend.tf.j2").render(**context),
    )
    write_file(
        os.path.join(out_dir, "main.tf"),
        module_env.get_template("main.tf.j2").render(**context),
    )
    write_file(
        os.path.join(out_dir, "provider.tf"),
        module_env.get_template("provider.tf.j2").render(**context),
    )
    write_file(
        os.path.join(out_dir, "terraform.tfvars"),
        module_env.get_template("terraform.tfvars.j2").render(**context),
    )
    write_file(
        os.path.join(out_dir, "variables.tf"),
        module_env.get_template("variables.tf.j2").render(**context),
    )


def render_module_outputs(module_env, context, out_dir):
    write_file(
        os.path.join(out_dir, "outputs.tf"),
        module_env.get_template("outputs.tf.j2").render(**context),
    )


def render_submodule_inputs(submodule_env, context, out_dir):
    write_file(
        os.path.join(out_dir, "main.tf"),
        submodule_env.get_template("main.tf.j2").render(**context),
    )
    write_file(
        os.path.join(out_dir, "provider.tf"),
        submodule_env.get_template("provider.tf.j2").render(**context),
    )
    write_file(
        os.path.join(out_dir, "terraform.tfvars"),
        submodule_env.get_template("terraform.tfvars.j2").render(**context),
    )
    write_file(
        os.path.join(out_dir, "variables.tf"),
        submodule_env.get_template("variables.tf.j2").render(**context),
    )


def render_submodule_outputs(submodule_env, context, out_dir):
    write_file(
        os.path.join(out_dir, "outputs.tf"),
        submodule_env.get_template("outputs.tf.j2").render(**context),
    )


def generate_modules(base_dir, module_env, namespace, provider):
    for module_name in sorted(os.listdir(base_dir)):
        module_path = os.path.join(base_dir, module_name)
        if not os.path.isdir(module_path):
            continue

        for version_name in sorted(os.listdir(module_path)):
            version_path = os.path.join(module_path, version_name)
            if not os.path.isdir(version_path):
                continue

            lock_file = os.path.join(version_path, ".module.lock")
            if os.path.isfile(lock_file):
                print(f"Skipping locked module: {module_name} {version_name}")
                continue

            locked = True

            input_json = os.path.join(version_path, "input.json")
            output_json = os.path.join(version_path, "output.json")

            if os.path.isfile(input_json):
                context = {
                    "module_name": module_name,
                    "version_name": version_name,
                    "namespace": namespace,
                    "provider": provider,
                    "inputs": load_inputs(input_json),
                }
                render_module_inputs(module_env, context, version_path)
                print(f"Generated module inputs: {module_name} {version_name}")

            if os.path.isfile(output_json):
                context = {
                    "module_name": module_name,
                    "version_name": version_name,
                    "namespace": namespace,
                    "provider": provider,
                    "outputs": load_outputs(output_json),
                }
                render_module_outputs(module_env, context, version_path)
                print(f"Generated module outputs: {module_name} {version_name}")

            if locked:
                open(lock_file, "a").close()
                print(f"Created lock file: {module_name} {version_name}")


def generate_submodules(base_dir, submodule_env, namespace, provider):
    for module_name in sorted(os.listdir(base_dir)):
        module_path = os.path.join(base_dir, module_name)
        if not os.path.isdir(module_path):
            continue

        for version_name in sorted(os.listdir(module_path)):
            version_path = os.path.join(module_path, version_name)
            if not os.path.isdir(version_path):
                continue

            submodules_dir = os.path.join(version_path, "submodules")
            if not os.path.isdir(submodules_dir):
                continue

            for submodule_name in sorted(os.listdir(submodules_dir)):
                submodule_path = os.path.join(submodules_dir, submodule_name)
                if not os.path.isdir(submodule_path):
                    continue

                lock_file = os.path.join(submodule_path, ".module.lock")
                if os.path.isfile(lock_file):
                    print(
                        f"Skipping locked module: {module_name} {version_name} {submodule_name}"
                    )
                    continue

                locked = True

                input_json = os.path.join(submodule_path, "input.json")
                output_json = os.path.join(submodule_path, "output.json")

                if os.path.isfile(input_json):
                    context = {
                        "module_name": module_name,
                        "submodule_name": submodule_name,
                        "version_name": version_name,
                        "namespace": namespace,
                        "provider": provider,
                        "inputs": load_inputs(input_json),
                    }
                    render_submodule_inputs(submodule_env, context, submodule_path)
                    print(
                        f"Generated submodule inputs: {module_name} {version_name} {submodule_name}"
                    )

                if os.path.isfile(output_json):
                    context = {
                        "module_name": module_name,
                        "submodule_name": submodule_name,
                        "version_name": version_name,
                        "namespace": namespace,
                        "provider": provider,
                        "outputs": load_outputs(output_json),
                    }
                    render_submodule_outputs(submodule_env, context, submodule_path)
                    print(
                        f"Generated submodule outputs: {module_name} {version_name} {submodule_name}"
                    )

                if locked:
                    open(lock_file, "a").close()
                    print(
                        f"Created lock file: {module_name} {version_name} {submodule_name}"
                    )
