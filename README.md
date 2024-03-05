# dotfiles

My macOS configuration files.

## Setting up a new MacOS machine

1. Install the basics that will allow to automate the rest of the process:

```sh
xcode-select --install
sudo xcodebuild -license accept

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install git
```

~~#TODO see https://medium.com/@protiumx/bash-gnu-stow-take-a-walk-while-your-new-macbook-is-being-set-up-351a6f2f9225 for good template~~

2. Stow dotfiles:

```sh
task stow:stow
```

3. Install Homebrew:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

4. Install Taskfile:

```sh
brew install go-task
```

5. Use tasks to install everything:

```sh
task brew:bundle:install
```
