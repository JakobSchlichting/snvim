# snvim

My fast and effecient [NeoVim](https://neovim.io/).
The s defenetly stands for speed and not my last name.

## Requirements

- [Neovim](https://neovim.io/) 0.11+
- `git`, `gcc`, `make`, `unzip` and `tree-sitter-cli` (plugin and Treesitter parser builds)
- `ripgrep` and `fd` (Telescope search)
- Language servers for the languages you use (see below)
- LaTeX: a TeX distribution with `latexmk`, `texlab` and the `zathura` PDF viewer

## Installation on Omarchy

Install the core dependencies:

```sh
sudo pacman -S --needed neovim git gcc make unzip tree-sitter-cli ripgrep fd
```

Install the language servers from the official repos:

```sh
sudo pacman -S --needed gopls typescript-language-server yaml-language-server \
    marksman bash-language-server lua-language-server python-lsp-server \
    markdown-oxide buf dockerfile-language-server vscode-html-languageserver \
    ols texlab
```

and the ones from the AUR:

```sh
yay -S --needed cmake-language-server terraform-ls nixd helm-ls hyprls \
    ansible-language-server templ
```

The remaining servers are not packaged:

```sh
npm install -g @microsoft/compose-language-service  # docker_compose_language_service
cargo install htmx-lsp                               # htmx
```

Install LaTeX support:

```sh
sudo pacman -S --needed texlive-basic texlive-latex texlive-latexextra \
    texlive-binextra zathura zathura-pdf-mupdf
```

To jump from the PDF back to the source (Ctrl+click in zathura), add this to
`~/.config/zathura/zathurarc`:

```
set synctex true
set synctex-editor-command "nvim --headless -c \"VimtexInverseSearch %{line} '%{input}'\""
```

Then clone the config and start Neovim; lazy.nvim installs all plugins on first launch:

```sh
git clone https://github.com/JakobSchlichting/snvim.git ~/.config/nvim
nvim
```
