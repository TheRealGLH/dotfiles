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
