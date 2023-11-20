from .render import render
from .link import link
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
    theme_path = Path(path) / f"{theme}.yaml"
    print(f"Theme '{theme}' selected.")
    print(f"Reading context from '{theme_path}'")
    render(theme_path)
    link(OUTPUT_PATH, HOME_PATH)

def prompt_theme(path: str = CONTEXTS_PATH):
    themes = get_themes(path)
    print("Available themes:")
    for i, theme in enumerate(themes):
        print(f"{i}. {theme}")
    while True:
        try:
            theme = themes[int(input("Select theme: "))]
            break
        except (ValueError, IndexError):
            print("Invalid selection.")
    select_theme(theme, path)

