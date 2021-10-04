#!/usr/bin/env python3
import os
import subprocess

START = [
    'https://github.com/airblade/vim-gitgutter',
    'https://github.com/bronson/vim-trailing-whitespace',
    'https://github.com/ctrlpvim/ctrlp.vim',
    'https://github.com/davidhalter/jedi-vim',
    'https://github.com/easymotion/vim-easymotion',
    'https://github.com/lilydjwg/colorizer',
    'https://github.com/ervandew/supertab',
    'https://github.com/majutsushi/tagbar',
    'https://github.com/mattn/emmet-vim',
    'https://github.com/michaeljsmith/vim-indent-object',
    'https://github.com/scrooloose/nerdcommenter',
    'https://github.com/scrooloose/nerdtree',
    'https://github.com/tell-k/vim-autopep8',
    'https://github.com/tmhedberg/matchit',
    'https://github.com/tpope/vim-fugitive',
    'https://github.com/tpope/vim-repeat',
    'https://github.com/tpope/vim-surround',
    'https://github.com/vim-airline/vim-airline',
    'https://github.com/vim-scripts/YankRing.vim',
    'https://github.com/w0rp/ale',
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


def add_repo(root, url):
    name = url.rsplit('/')[-1]
    subprocess.call([
        'git', 'submodule', 'add',
        '--name', name,
        url,
        f'{root}/{name}'
    ])


for folder, urls in PACK.items():
    root = f'pack/plugins/{folder}'
    os.makedirs(root, exist_ok=True)
    for url in urls:
        add_repo(root, url)


subprocess.call([
    "git",
    "submodule",
    "update",
    "--recursive",
    "--init",
    "--remote",
    "--checkout",
    "--force",
])
