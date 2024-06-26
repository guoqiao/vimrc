#!/usr/bin/env python3
import subprocess
from pathlib import Path

START = [
    'https://github.com/airblade/vim-gitgutter',
    'https://github.com/bronson/vim-trailing-whitespace',
    'https://github.com/ctrlpvim/ctrlp.vim',
    #  'https://github.com/davidhalter/jedi-vim',
    'https://github.com/dense-analysis/ale',
    'https://github.com/easymotion/vim-easymotion',
    'https://github.com/ervandew/supertab',
    'https://github.com/hashivim/vim-terraform',
    'https://github.com/lilydjwg/colorizer',
    'https://github.com/majutsushi/tagbar',
    'https://github.com/mattn/emmet-vim',
    'https://github.com/michaeljsmith/vim-indent-object',
    'https://github.com/preservim/nerdtree',
    'https://github.com/ruanyl/vim-gh-line',
    'https://github.com/scrooloose/nerdcommenter',
    'https://github.com/tell-k/vim-autopep8',
    'https://github.com/tmhedberg/matchit',
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/tpope/vim-repeat',
    'https://github.com/tpope/vim-surround',
    'https://github.com/vim-airline/vim-airline',
    'https://github.com/vim-scripts/YankRing.vim',
    'https://github.com/Yggdroot/indentLine',
]


OPT = [
    'https://github.com/morhetz/gruvbox',
    'https://github.com/sjl/badwolf',
    'https://github.com/tomasr/molokai',
]


PACK = {
    "start": START,
    "opt": OPT,
}


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


for folder, urls in PACK.items():
    root = Path(f'pack/plugins/{folder}')
    root.mkdir(parents=True, exist_ok=True)
    for url in urls:
        clone_or_update_repo(root, url)
