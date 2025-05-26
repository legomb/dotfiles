# dotfiles

My macOS configuration files.

> [!NOTE]  
> Nix support is in beta. If I'm happy with Nix after a while, I'll migrate everything else to Nix, and installation instructions will become simpler.

## Setting up a new MacOS machine 🚀

1. Install [Nix](https://nix.dev/install-nix):

  ```sh
  curl -L https://nixos.org/nix/install | sh
  ```

2. Clone the repo

  ```sh
  git clone --recurse-submodules https://github.com/legomb/dotfiles.git
  ```

3. Switch to the nix flake:

  ```sh
  cd config/nix/.config/nix-darwin
  nix run nix-darwin --extra-experimental-features "nix-command flakes" -- switch --flake .#macbook
  ```

  This will configure macOS settings and install basic dependencies (go-task, etc.)

4. Install Homebrew:

  ```sh
  task brew:install
  ```

5. Stow dotfiles:

  ```sh
  task stow:stow
  ```

6. Install everything using brew:

  ```sh
  task brew:bundle:install
  ```
