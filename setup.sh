#!/usr/bin/env bash

set -ue

DIR=~/.vim

# if .vim dir exists, exit
[[ -d "${DIR}" ]] && exit 0

git clone https://github.com/guoqiao/vimrc.git $DIR
cd $DIR
make all

cd ~

if [[ ! -e ~/.gitconfig ]]; then
    ln -s ${DIR}/gitconfig ~/.gitconfig
    echo "create symlink for ~/.gitconfig, please set user info with env vars. example:"
    cat <<<EOF
    export GIT_AUTHOR_NAME="${USER}"
    export GIT_AUTHOR_EMAIL="${USER}@${HOST}"
    export GIT_COMMITTER_NAME="${USER}"
    export GIT_COMMITTER_EMAIL="${USER}@${HOST}"
    EOF
fi

if [[ ! -e ~/.tmux.conf ]]; then
    ln -s ${DIR}/tmux.conf ~/.tmux.conf
    echo "create symlink for ~/.tmux.conf"
fi

