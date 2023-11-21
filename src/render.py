from pathlib import Path
import yaml

def read_context(context_path: str) -> dict:
    with open(context_path, 'r') as file:
        return yaml.safe_load(file)

def render_file(in_path: str, out_path: str, context_path: str) -> None:
    print(f'Rendering {in_path} to {out_path}')
    content = in_path.read_text()
    context = read_context(context_path)
    with open(in_path, 'r') as file:
        content = content.format(**context)
    Path(out_path).parent.mkdir(parents=True, exist_ok=True)
    with open(out_path, 'w') as file:
        file.write(content)

def render_dir(in_path: str, out_path: str, context_path: str) -> None:
    for child in Path(in_path).iterdir():
        if child.is_dir():
            render_dir(child, f"{out_path}/{child.name}", context_path)
        else:
            render_file(child, f"{out_path}/{child.name}", context_path)

def render(in_path: str, out_path:str , context_path: str) -> None:
    render_dir(in_path, out_path, context_path)
