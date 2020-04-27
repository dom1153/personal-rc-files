https://github.com/rbenv/rbenv

Bash install instructions:
  Setup .bashrc with PATHs

  install build-essentials

  ruby doctor to check env:
    curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

  To install ruby versions:
    rbenv install 2.7.1    # (use -l to check versions)

  To solve some build issues try:
    apt-get install -y libssl-dev libreadline-dev

To set gems (per session)
  rbenv local 2.7.1
