#!/usr/bin/env bash

set -ue

DIR=~/.vim

if [[ ! -d "${DIR}" ]]; then
    git clone https://github.com/guoqiao/vimrc.git $DIR
fi

cd $DIR
make all

cd ~

if [[ ! -e ~/.tmux.conf ]]; then
    ln -s ${DIR}/tmux.conf ~/.tmux.conf
    echo "create symlink for ~/.tmux.conf"
fi

if [[ ! -e ~/.gitconfig ]]; then
    ln -s ${DIR}/gitconfig ~/.gitconfig
    echo "create symlink for ~/.gitconfig, please set user info with env vars. example:"
fi

echo "ensure you have set these env vars for gitconfig:"
cat << EOF
export GIT_AUTHOR_NAME="${USER}"
export GIT_AUTHOR_EMAIL="${USER}@$(hostname)"
export GIT_COMMITTER_NAME="${USER}"
export GIT_COMMITTER_EMAIL="${USER}@$(hostname)"
EOF
