## maybe read some OS specific guides, then here:

Debian [debian-install.md](debian-install.md)

## Installing ZSH

https://github.com/robbyrussell/oh-my-zsh/wiki/Installing-ZSH

Use a package manager

## Installing oh-my-zsh

https://github.com/robbyrussell/oh-my-zsh

Via curl

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

OR

Via wget

`sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"`

In case you still need to set zsh as the default shell

`chsh -s $(which zsh)`

## Installing vim

Use your package manager

## Vundle

https://github.com/VundleVim/Vundle.vim

`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

`:PluginInstall`

`vim +PluginInstall +qall`

## Add git ssh

Generate ssh key (run anywhere)

`ssh-keygen -t rsa -b 4096 -C "your_email@example.com"`

(linux) `xclip -sel clip < ~/.ssh/id_rsa.pub`

(mac) `pbcopy < ~/.ssh/id_rsa.pub`

Go to git account settings > ssh and gpgp keys > add clipboard ssh pub key

Source: `https://help.github.com/en/enterprise/2.15/user/articles/adding-a-new-ssh-key-to-your-github-account`