# Dotfiles

Requires stow (GNU Stow) version 2.4.1 or later. Nothing in this repository is assumed to work for anyone else but me, and this is more for reference than anything else.

_If anything breaks or doesn't work for you, you're on your own!_

Clone with
```sh
git clone git@github.com:TheRealGLH/dotfiles.git $HOME/dotfiles
```

To install the contents of a directory, use:
```sh
stow <dir>
```

To uninstall, use:
```sh
stow -D <dir>
```

Since these are assumed to be installed in the user's home directory, if you'd rather clone them elsewhere please use the ``-t <dir>`` option for Stow. See also, [the official GNU Stow docs](https://www.gnu.org/software/stow/manual/stow.html#Invoking-Stow).


## Individual tools

Version numbers are not kept up to date, but assume that you'd need a version that matches or is greater.

### Tmux

```sh
tmux -V
>tmux 3.5a
```

TMP is used for plugin management and will not be installed automatically. Please run
```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### FastFetch
```sh
fastfetch -v
fastfetch 2.32.1 (aarch64)
```

### Oh My Posh
```sh
oh-my-posh --version
24.11.4
```
