from pathlib import Path
import os

def link(source_dir: str, link_dir: str) -> None:
    """
    Create symbolic links from source_dir to link_dir recursively.
    """

    if isinstance(source_dir, str):
        source_dir = Path(source_dir).resolve()
    if isinstance(link_dir, str):
        link_dir = Path(link_dir).resolve()

    for child in source_dir.iterdir():
        source_path = child
        link_path = link_dir / child.name
        if source_path.is_dir():
            link_path.mkdir(exist_ok=True)
            link(source_path, link_path)
        else:
            print(f"Creating symbolic links from {source_path} to {link_path}")
            if os.path.lexists(link_path):
                os.remove(link_path)
            os.symlink(source_path, link_path)
