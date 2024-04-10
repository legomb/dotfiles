# dotfiles

My macOS configuration files.

## Setting up a new MacOS machine 🚀

1. Install Homebrew:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

1. Install requirements:

```sh
brew install git stow go-task
```

3. Clone the repo.


4. Initialize submodules:

```sh
task git:submodules:update
```

5. Stow dotfiles:

```sh
task stow:stow
```

6. Install everything:

```sh
task brew:bundle:install
```
