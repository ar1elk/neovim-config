#!/bin/bash

# Install linters
npm install -g --save-dev --save-exact prettier
echo 'export GOPATH=$(go env GOPATH)' >> ~/.zshrc
export GOPATH=$(go env GOPATH)
mkdir -p $GOPATH/bin
cd linters
cp golangci-lint $GOPATH/bin
cp goimports $GOPATH/bin
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.zshrc
export PATH=$PATH:$GOPATH/bin

# Delete old nvim configuration
rm -rf ~/.config/nvim/*
rm -rf ~/.local/share/nvim/*

# Copy nvim configuration
cd ..
cp init.lua ~/.config/nvim
cp -r plugin ~/.config/nvim
cp -r lua ~/.config/nvim
cp -r after ~/.config/nvim
cp -r local/* ~/.local/share/nvim

# Install coc node modules
cd ~/.local/share/nvim/site/pack/packer/start/coc.nvim
npm install

