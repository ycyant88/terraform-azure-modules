from dotenv import dotenv_values
from jinja2 import Environment, FileSystemLoader
from generate import generate_modules, generate_submodules

env_vars = dotenv_values(".env")


module_env = Environment(
    loader=FileSystemLoader(env_vars["dir_templates_module"]),
    keep_trailing_newline=True,
)

submodule_env = Environment(
    loader=FileSystemLoader(env_vars["dir_templates_submodule"]),
    keep_trailing_newline=True,
)


generate_modules(
    env_vars["dir_output"],
    module_env,
    env_vars["tf_modules_namespace"],
    env_vars["tf_modules_provider"],
)

generate_submodules(
    env_vars["dir_output"],
    submodule_env,
    env_vars["tf_modules_namespace"],
    env_vars["tf_modules_provider"],
)
