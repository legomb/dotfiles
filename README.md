# dotfiles

My macOS configuration files.

## Setting up a new MacOS machine

1. Install the basics that will allow to automate the rest of the process:

```sh
xcode-select --install
sudo xcodebuild -license accept
```

2. Install Homebrew:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

3. Install basic necessary tools:

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
