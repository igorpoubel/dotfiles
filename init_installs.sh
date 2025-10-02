#!/bin/sh

echo "Installing packages..."

if [ "$(uname)" = "Darwin" ]; then
    OS="MAC"
elif [ "$(uname)" = "Linux" ]; then
    OS="LINUX"
    if grep -q "Fedora" /etc/*release 2>/dev/null; then
        OS="$OS - FEDORA"
    elif grep -q "Ubuntu" /etc/*release 2>/dev/null; then
        OS="$OS - UBUNTU"
    elif grep -q "CentOS" /etc/*release 2>/dev/null; then
        OS="$OS - CENTOS"
    fi
fi

echo "OS: $OS"

if [ "$OS" = "MAC" ]; then
    echo "\nInstalling Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo "\nInstalling packages with Homebrew..."
    brew install git zsh zsh-completions curl wget
elif [ "$OS" = "LINUX - FEDORA" ]; then
    echo "\nInstalling packages with DNF..."
    sudo dnf install -y git zsh curl wget unzip
elif [ "$OS" = "LINUX - UBUNTU" ]; then
    echo "\nInstalling packages with APT..."
    sudo apt update
    sudo apt install -y git zsh curl wget unzip
else
    echo "Unsupported OS. Exiting."
    exit 1
fi


ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"

if [ ! -d "$ZSH_CUSTOM" ]; then
    mkdir -p $ZSH_CUSTOM
fi


echo "\nInstalling oh-my-zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting

echo "\nSetting up dotfiles with stow..."
# Install GNU Stow if not already installed
stow .

echo "\nInstall FNM..."

# Install fnm
# curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell
curl -fsSL https://raw.githubusercontent.com/Schniz/fnm/refs/heads/master/.ci/install.sh | bash -s -- --skip-shell


echo "\nInstalling oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

