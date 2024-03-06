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

3. Install git and Taskfile:

```sh
brew install git go-task
```

4. Stow dotfiles:

```sh
task stow:stow
```

5. Use tasks to install everything:

```sh
task brew:bundle:install
```
