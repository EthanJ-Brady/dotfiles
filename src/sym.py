from pathlib import Path
import os

def sym_match(source_dir: str, link_dir: str) -> None:
    """
    Create symbolic links from source_dir to link_dir recursively.
    """

    if isinstance(source_dir, str):
        source_dir = Path(source_dir).resolve()
    if isinstance(link_dir, str):
        link_dir = Path(link_dir).resolve()

    for child in source_dir.iterdir():
        source = child
        link = link_dir / child.name
        if source.is_dir():
            link.mkdir(exist_ok=True)
            sym_match(source, link)
        else:
            if os.path.lexists(link):
                os.remove(link)
            os.symlink(source, link)
