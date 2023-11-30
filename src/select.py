from dotenv import load_dotenv
from pathlib import Path
from .prompt import prompt
import os

def _get_themes() -> list:
    load_dotenv()
    CONTEXTS_PATH = Path(__file__).parent.parent.resolve() / Path(os.getenv('CONTEXT_DIR'))
    return [p.stem for p in Path(CONTEXTS_PATH).glob("*.yaml")]

def select():
    load_dotenv()
    theme = prompt("Select theme...", _get_themes())
    os.environ["THEME"] = theme

# def prompt_theme():
#    select_theme(prompt("Select theme...", _get_themes()))
#    method = prompt("Select method...", list(METHODS.keys()))
#    apply(METHODS[method])
