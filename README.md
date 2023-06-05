<div align="center">
  <img alt="neovim logo" src="https://i.imgur.com/pzjkcPP.png" />
</div>

<div align="center">
  <img alt="Neovim" src="https://img.shields.io/github/v/release/neovim/neovim?style=for-the-badge&logo=neovim&color=C9CBFF&logoColor=57A143&labelColor=302D41&include_prerelease&sort=semver" />
  <img alt="Last commit" src="https://img.shields.io/github/last-commit/yeuxacucodon/neovim-config?style=for-the-badge&logo=github&color=8bd5ca&logoColor=D9E0EE&labelColor=302D41" />
  <img alt="Stars" src="https://img.shields.io/github/stars/yeuxacucodon/neovim-config?style=for-the-badge&logo=startrek&color=c69ff5&logoColor=FFE200&labelColor=302D41" />
  <img alt="Repo size" src="https://img.shields.io/github/repo-size/yeuxacucodon/neovim-config?color=%23DDB6F2&label=SIZE&logo=onlyoffice&style=for-the-badge&logoColor=D9E0EE&labelColor=302D41" />
  <img alt="License" src="https://img.shields.io/github/license/yeuxacucodon/neovim-config?style=for-the-badge&logo=bookstack&color=ee999f&logoColor=808080&labelColor=302D41" />
</div>

## 🚀 Introduction

This repository hosts my Neovim configuration for Linux. It's a minimal configuration with Lua and easy to customize and extend the config. You can clone this repository and use it but not good. A good configuration is personal, you should make your own unique config files.

⚠️ This config is only for the **lastest Neovim stable release**. If you are having an older neovim version, you should update neovim via package manager or download the lastest version from [Neovim official repository](https://github.com/neovim/neovim).

## ✨ Detail

- Plugin management: [lazy.nvim](https://github.com/folke/lazy.nvim)
- Status line: [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- File tree explorer: [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- Syntax highlighter: [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Theme: [catppuccin](https://github.com/catppuccin/nvim)
- Fuzzy searching: [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- Faster code commenting: [mini.comment](https://github.com/echasnovski/mini.comment)
- Code, snippets, nvim commands completion: [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) & [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- Language server protocol (LSP) support: [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) & [mason.nvim](https://github.com/williamboman/mason.nvim)
- Code Formatting: [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- Faster matching pair insertion and jump: [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- Git integration: [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- Code outline, code action,...: [lspsaga.nvim](https://github.com/glepnir/lspsaga.nvim)
- And more...[plugins here](./lua/plugins/init.lua)

## ⚡️ Requirements

- Neovim
- A Nerd font
- Git
- GCC
- XClip (X11) or wl-clipboar (Wayland) for system clipboard support on Linux
- fd for telescope
- ripgrep for telescope
