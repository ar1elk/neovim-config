#!/bin/bash

# Install linters
cd linters && npm install prettier
cp golangci-lint ~/go
cp goimports ~/go

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

