# dotfiles

My macOS configuration files.

## Setting up a new MacOS machine 🚀

1. Install [Nix](https://nix.dev/install-nix):

  ```sh
  curl -L https://nixos.org/nix/install | sh
  ```

1. Clone the repo

2. Switch to the nix flake:

  ```sh
  cd config/nix/.config/nix-darwin
  nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake .#macbook
  ```

  This will install basic dependencies (go-task, etc.) as well as configure macOS settings.
4. Initialize git submodules:

```sh
task git:submodules:update
```

5. Stow dotfiles:

```sh
task stow:stow
```

6. Install everything using brew:

```sh
task brew:bundle:install
```
