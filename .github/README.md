# Personal dotfiles configuration

This is based on the [Bitbucket guide][] for managing dotfiles with a bare git repo.

[Bitbucket guide]: https://www.atlassian.com/git/tutorials/dotfiles

## Installation

Clone the repo using HTTPS

```
$ git clone --bare https://github.com/danielmoore/environment.git $HOME/.cfg
```

...or SSH

```
$ git clone --bare git@github.com:danielmoore/environment.git $HOME/.cfg
```

Backup files that would be overwritten.

```
$ alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
$ mkdir $HOME/.config-backup
$ config ls-tree -r --name-only master | xargs -I% mv % $HOME/.config-backup/%
```

Set up the submodules.

```
$ config submodule update --init --recursive
```

Load the config.

```
$ config checkout
$ config config --local status.showUntrackedFiles no
```

Include shared gitconfig

```
$ git config --global include.path "$HOME/.shared.gitconfig"
```

### Mac

Install Homebrew and common tools.

```
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ brew bundle
```
