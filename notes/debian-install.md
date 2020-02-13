## Consider the following tweaks:

0. Read [installs.md](installs.md)

1. Setting status bar options via tweaks

2. Give yourself sudo (for convience)

```
su
sudo adduser {username} sudo
[reboot pc]
```

3. Install some apt stuff

`sudo apt get install vim curl git zsh -y`

4. Installing snap

```
sudo apt update
sudo apt install snapd
snap install hello-world
[logout, login]
hello world
```

Some snaps

```
snap install code --classic
snap install spotify
```

5. Remove the bloat apps, install appfolder management extension

`https://extensions.gnome.org/extension/1217/appfolders-manager/`

6. Themes and more preferences
Flat-remix gnome and gtk themes (download and move to ~/.themes directory)
https://drasite.com/flat-remix-gnome
https://drasite.com/flat-remix-gtk

Flat-remix icons (download and move to ~/.icons directory)
https://drasite.com/flat-remix

7. Other preferences (changes with time)

Default terminal config

`sudo update-alternatives --config x-terminal-emulator`

Non-default applications:

- nemo (fm)
- tilix (terminal)
- plank (dock) [ctrl+click to config]

8. dconf-editor

Nemo/cinnamon default terminal
```
org/cinnamon/desktop/applications/terminal/exec
value -> tilix.wrapper
```