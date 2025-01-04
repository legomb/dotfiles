# dotfiles

My macOS configuration files.

## Setting up a new MacOS machine 🚀

1. Install Homebrew:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

1. Install Nix

```sh
curl -L https://nixos.org/nix/install | sh
```

Complete instructions can be found on the [Nix website](https://nix.dev/install-nix).

2. Install nix stuff:

```

```

3. Install requirements:

```sh
brew install git stow go-task
```

4. Clone the repo.


5. Initialize submodules:

```sh
task git:submodules:update
```

6. Stow dotfiles:

```sh
task stow:stow
```

7. Install everything:

```sh
task brew:bundle:install
```
