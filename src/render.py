from dotenv import load_dotenv
from pathlib import Path
import os
import yaml

def read_context(context_path: str) -> dict:
    with open(context_path, 'r') as file:
        return yaml.safe_load(file)

def _render_file(in_path: str, out_path: str, context_path: str) -> None:
    print(f'Rendering {in_path} to {out_path}')
    content = in_path.read_text()
    context = read_context(context_path)
    with open(in_path, 'r') as file:
        content = content.format(**context)
    Path(out_path).parent.mkdir(parents=True, exist_ok=True)
    with open(out_path, 'w') as file:
        file.write(content)

def _render_dir(in_path: str, out_path: str, context_path: str) -> None:
    for child in Path(in_path).iterdir():
        if child.is_dir():
            _render_dir(child, f"{out_path}/{child.name}", context_path)
        else:
            _render_file(child, f"{out_path}/{child.name}", context_path)

def render():
    load_dotenv()
    template_dir = Path(__file__).parent.parent.resolve() / Path(os.getenv('TEMPLATE_DIR'))
    output_dir = Path(__file__).parent.parent.resolve() / Path(os.getenv('OUTPUT_DIR'))
    context_dir = Path(__file__).parent.parent.resolve() / Path(os.getenv('CONTEXT_DIR'))
    context_path = context_dir / Path(os.getenv('THEME') + '.yaml')
    _render_dir(template_dir, output_dir, context_path)

