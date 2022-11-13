# dotfiles

### Instalações necessárias:

## ZSH (Se estiver no linux)

Ubuntu:
```
sudo apt install zsh
```

## Oh my zsh

https://ohmyz.sh/#install

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Instalar plugins

https://github.com/zsh-users/zsh-autosuggestions

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

https://github.com/zsh-users/zsh-syntax-highlighting

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## Instalar Dot Manager 

https://yadm.io/
```
sudo apt install yadm
```

Importando dotfiles
```
yadm clone --bootstrap git@github.com:igorpoubel/dotfiles.git
```
