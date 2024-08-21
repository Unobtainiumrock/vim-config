# About

My .vimrc configuration to be used across different work environments. After cloning the repo, run:

```bash
ln -s ~/vim-config/.vimrc ~/.vimrc
ln -s ~/vim-config/.vim ~/.vim
```


## Installation Guide for Vim Setup

Follow these steps to install the necessary tools and packages to ensure your `.vimrc` configuration works seamlessly on a new system.

### Basic Development Tools

Install essential development tools:

```bash
sudo apt-get install build-essential python3 python3-pip
```
## Node.js and npm

Install Node.js and npm, which are required for some Vim plugins (e.g., CoC):
```bash
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs npm
```
## Ripgrep

Install ripgrep, a fast search tool used by some Vim plugins:
```bash
sudo apt-get install ripgrep
```

## Powerline Fonts

Install Powerline fonts to ensure that vim-airline looks good:

```bash
sudo apt-get install fonts-powerline
```

## Install Go (for coc-go)

```bash
sudo apt-get install golang-go
go install golang.org/x/tools/gopls@latest
```

## Install vim-plug

Install vim-plug, the plugin manager used in the `.vimrc`:
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Install Python Language Server

Install the Python language server for coc-pyright:

```bash
pip3 install pyright
```

## Install TypeScript (coc-tsserver)

```bash
npm install -g typescript
```

## After Setup
1. Run `:PlugInstall` in Vim: This installs all the plugins specified in your `.vimrc`
2. Verify All Plugins Work: Ensure each plugin and key mapping functions correctly. If there are errors, refer back to the specific dependencies or missing packages.

## Extra

If you're like me, you'll want to disable the telemetry data and automatic updates in the CoC extensions.

### For Python

Add the following to your `~/.vim/coc-settings.json` (if the directory doesn't exist, then make it with `mkdir -p ~/.vim/`)

```bash
{
  "python.analysis.telemetry.enable": false,
  "typescript.survey.enabled": false,
  "coc.preferences.extensionUpdateCheck": "never",
  "coc.preferences.promptUpdate": false
}
```

This command will create the file and write the settings to disable telemetry for the Python language server (`coc-pyright`)



