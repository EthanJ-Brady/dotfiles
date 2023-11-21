from .prompt import prompt
from .render import render
from .link import link, copy
from pathlib import Path

CONTEXTS_PATH = Path(__file__).parent.parent / "contexts"
OUTPUT_PATH = Path(__file__).parent.parent / "output"
HOME_PATH = Path("~").expanduser()

METHODS = {
    "link": link,
    "copy": copy
}

def get_themes() -> list:
    return [p.stem for p in Path(CONTEXTS_PATH).glob("*.yaml")]

def get_theme_path(theme: str) -> str:
    return Path(CONTEXTS_PATH) / f"{theme}.yaml"

def select_theme(theme: str):
    theme_path = get_theme_path(theme)
    render(theme_path)

def apply(method: callable):
    method(OUTPUT_PATH, HOME_PATH)

def prompt_theme():
    select_theme(prompt("Select theme...", get_themes()))
    method = prompt("Select method...", list(METHODS.keys()))
    apply(METHODS[method])
