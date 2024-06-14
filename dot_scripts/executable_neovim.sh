#!/bin/bash

# Get the current directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PWD=$(pwd)

NVIM_DIR=$HOME/tmp/nvim

mkdir -p $NVIM_DIR

if command -v apt &> /dev/null
then
  # If this is the first run, install requirements
  if ! command -v $NVIM_DIR/nvim-linux64/bin/nvim &> /dev/null
  then
	  sudo apt update
	  # Install our neovim reqs
	  if ! command -v tmux &> /dev/null
	  then
	    sudo apt install -y tmux
	  fi
	  # Needed for FZF building
	  if ! command -v cmake &> /dev/null
	  then
	    sudo apt install -y cmake
	  fi
	  if ! command -v rg &> /dev/null
	  then
	    RIPGREP_VERSION=$(curl -s "https://api.github.com/repos/BurntSushi/ripgrep/releases/latest" | grep -Po '"tag_name": "\K[0-9.]+')
	    curl -Lo ripgrep.deb "https://github.com/BurntSushi/ripgrep/releases/download/${RIPGREP_VERSION}/ripgrep_${RIPGREP_VERSION}-1_amd64.deb"
	    sudo apt install -y ./ripgrep.deb
	    rm ripgrep.deb
	  fi
  fi
fi


if ! command -v $NVIM_DIR/nvim-linux64/bin/nvim &> /dev/null
then
  curl -L https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz -o $NVIM_DIR/nvim-linux64.tar.gz

  tar -xzvf $NVIM_DIR/nvim-linux64.tar.gz -C $NVIM_DIR
  rm -rf $NVIM_DIR/nvim-linux64.tar.gz
fi

mkdir -p $NVIM_DIR/share $NVIM_DIR/state
XDG_DATA_HOME=$NVIM_DIR/share XDG_STATE_HOME=$NVIM_DIR/state $NVIM_DIR/nvim-linux64/bin/nvim $1

