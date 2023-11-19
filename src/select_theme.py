from .render import render
from .sym import sym_match
from pathlib import Path

CONTEXTS_PATH = Path(__file__).parent.parent / "contexts"
OUTPUT_PATH = Path(__file__).parent.parent / "output"
HOME_PATH = Path("~").expanduser()

def get_themes(path: str = CONTEXTS_PATH) -> list:
    return [p.stem for p in Path(path).glob("*.yaml")]

def select_theme(theme: str, path: str = CONTEXTS_PATH):
    themes = get_themes(path)
    if theme not in themes:
        raise ValueError(f"Theme '{theme}' not found. Available themes: {themes}")
    render(Path(path) / f"{theme}.yaml")
    sym_match(OUTPUT_PATH, HOME_PATH)

