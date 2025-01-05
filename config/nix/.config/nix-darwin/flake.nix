{
  description = "Flake for macOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
  };

  outputs = { self, nixpkgs, nix-darwin, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
      };
      configuration = { config, pkgs, ... }: {
        # Compatibility, please read the changelog before changing.
        # $ darwin-rebuild changelog
        system.stateVersion = 5;

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = system;
      };
    in
    {
      darwinConfigurations = {
        macbook = nix-darwin.lib.darwinSystem {
          system = system;
          modules = [ configuration ];
        };
      };
    };
}
