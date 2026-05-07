#!/usr/bin/env python
import subprocess
from pathlib import Path

START = [
    # tt: show tree, ff: reveal file in tree
    'https://github.com/preservim/nerdtree',
    # ctrl p to select file
    'https://github.com/ctrlpvim/ctrlp.vim',
    # leader leader w
    'https://github.com/easymotion/vim-easymotion',
    # TT to show tags
    'https://github.com/majutsushi/tagbar',
    # leader c c to comment, leader c i to toggle comment
    'https://github.com/scrooloose/nerdcommenter',
    # make builtin . cmd more powerful
    'https://github.com/tpope/vim-repeat',
    # change surroundings:
    # cs"':  "Hi" -> 'Hi'
    # cst": <p>Hi</p> -> "Hi"
    # cs"<q>: "Hi" -> <q>Hi</q>
    # ds": "Hi" -> Hi
    # yss/vit
    'https://github.com/tpope/vim-surround',
    # vii to select current indent level
    'https://github.com/michaeljsmith/vim-indent-object',
    # show vertical indent lines
    'https://github.com/Yggdroot/indentLine',
    # git commands from vim: :Git, :Gdiffsplit, :Git blame
    'https://github.com/tpope/vim-fugitive',
    # show git diff signs in the gutter
    'https://github.com/airblade/vim-gitgutter',
    # async linting and fixing
    'https://github.com/dense-analysis/ale',
    # color schema
    'https://github.com/tomasr/molokai',
]


def run_cmd(cmd, cwd='.'):
    print('running cmd in {}: {}'.format(cwd, ' '.join(cmd)))
    subprocess.run(cmd, cwd=cwd)


def clone_or_update_repo(root, url):
    name = url.rsplit('/')[-1]
    path = root / name
    if path.exists():
        print(f'updating {path}: {url}')
        run_cmd(['git', 'pull', '--recurse-submodules'], cwd=path)
        run_cmd(['git', 'submodule', 'update', '--init'], cwd=path)
    else:
        print(f'cloning {path}: {url}')
        run_cmd(['git', 'clone', '--recursive', url, name], cwd=root)


def main():
    root = Path(f'pack/plugins/start')
    root.mkdir(parents=True, exist_ok=True)
    for url in START:
        clone_or_update_repo(root, url)


if __name__ == "__main__":
    main()

