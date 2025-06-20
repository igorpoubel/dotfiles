#!/bin/sh

echo "Installing packages..."
echo "Install FNM..."

# Install fnm
curl -fsSL https://fnm.vercel.app/install | bash -s -- --skip-shell

echo -e '\n# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi' >> $HOME/.zshrc

echo -e '\neval "$(fnm env --use-on-cd --shell zsh)"' >> $HOME/.zshrc

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo "Installing oh-my-zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting



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

