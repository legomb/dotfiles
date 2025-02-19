# dotfiles

My macOS configuration files.

> [!NOTE]  
> Nix support is in beta. If I'm happy with Nix after a while, I'll migrate everything else to Nix as well, and installation instructions should become simpler, as everything will be done via Nix.

## Setting up a new MacOS machine 🚀

1. Install [Nix](https://nix.dev/install-nix):

  ```sh
  curl -L https://nixos.org/nix/install | sh
  ```

2. Clone the repo

3. Switch to the nix flake:

  ```sh
  cd config/nix/.config/nix-darwin
  nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake .#macbook
  ```

  This will configure macOS settings and install basic dependencies (go-task, etc.)

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
