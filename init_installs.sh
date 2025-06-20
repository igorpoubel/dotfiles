#!/bin/sh

echo "Installing packages..."
echo "Install FNM..."

# Install fnm
# curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell

# echo -e '\n# fnm
# FNM_PATH="$HOME/.local/share/fnm"
# if [ -d "$FNM_PATH" ]; then
#   export PATH="$HOME/.local/share/fnm:$PATH"
#   eval "`fnm env`"
# fi' >> $HOME/.zshrc

# echo -e '\neval "$(fnm env --use-on-cd --shell zsh)"' >> $HOME/.zshrc




if [[ $(uname) == "Darwin" ]]; then
    OS="MAC"
elif [[ $(uname) == "Linux" ]]; then
    OS="LINUX"
    if [[ $(cat /etc/system-release | grep "Fedora") ]]; then
        OS="$OS - FEDORA"
    elif [[ $(cat /etc/system-release | grep "Ubuntu") ]]; then
        OS="$OS - UBUNTU"
    elif [[ $(cat /etc/system-release | grep "CentOS") ]]; then
        OS="$OS - CENTOS"
    fi
fi

echo "OS: $OS"

