from pathlib import Path
import os
import shutil

def _match(source_dir: str, dest_dir: str, match_func: callable) -> None:
    """
    Match files from source_dir to dest_dir recursively.
    """
    if isinstance(source_dir, str):
        source_dir = Path(source_dir).resolve()
    if isinstance(dest_dir, str):
        dest_dir = Path(dest_dir).resolve()

    for child in source_dir.iterdir():
        source_path = child
        dest_path = dest_dir / child.name
        if source_path.is_dir():
            dest_path.mkdir(exist_ok=True)
            _match(source_path, dest_path, match_func)
        else:
            match_func(source_path, dest_path)

def _link_match(source_path: str, dest_path: str) -> None:
    """
    Create symbolic links from source_path to dest_path.
    """
    print(f"Creating symbolic links from {source_path} to {dest_path}")
    if os.path.lexists(dest_path):
        os.remove(dest_path)
    os.symlink(source_path, dest_path)

def _copy_match(source_path: str, dest_path: str) -> None:
    """
    Create copies from source_path to dest_path.
    """
    print(f"Creating copies from {source_path} to {dest_path}")
    if os.path.exists(dest_path):
        os.remove(dest_path)
    shutil.copyfile(source_path, dest_path)

def link(source_dir: str, link_dir: str) -> None:
    """
    Create symbolic links from source_dir to link_dir recursively.
    """
    _match(source_dir, link_dir, _link_match)

def copy(source_dir: str, copy_dir: str) -> None:
    """
    Create copies of the files from source_dir to link_dir recursively.
    """
    _match(source_dir, copy_dir, _copy_match)
            
