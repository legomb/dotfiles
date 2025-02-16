# dotfiles

My macOS configuration files.

## Setting up a new MacOS machine 🚀

1. Install Nix

```sh
curl -L https://nixos.org/nix/install | sh
```

Complete instructions can be found on the [Nix website](https://nix.dev/install-nix).

2. Clone the repo.

3. Initialize git submodules:

```sh
task git:submodules:update
```

4. Switch to the nix flake:

```sh
cd config/nix/.config/nix-darwin
nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake .#macbook
```

5. Stow dotfiles:

```sh
task stow:stow
```

6. Install everything:

```sh
task brew:bundle:install
```
