{
  description = "Custom nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {

# fix: default Nix build user group ID changed
    # error: Build user group has mismatching GID, aborting activation
    # The default Nix build user group ID was changed from 30000 to 350.
    # You are currently managing Nix build users with nix-darwin, but your
    # nixbld group has GID 30000, whereas we expected 350.
    # Possible causes include setting up a new Nix installation with an
    # existing nix-darwin configuration, setting up a new nix-darwin
    # installation with an existing Nix installation, or manually increasing
    # your `system.stateVersion` setting.
    # You can set the configured group ID to match the actual value:
    #     ids.gids.nixbld = 30000;
    # We do not recommend trying to change the group ID with macOS user
    # management tools without a complete uninstallation and reinstallation
    # of Nix. This is because the group ID is used in many places in the Nix
      ids.gids.nixbld = 30000;

            nixpkgs.config.allowUnfree = true;
      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";

      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [
          pkgs.git
          pkgs.go-task
          pkgs.neovim
          pkgs.stow
        ];

      nix.settings = {
        keep-outputs = true;
        keep-derivations = true;

        # Necessary for using flakes on this system.
        experimental-features = "nix-command flakes";
      };

      # Enable alternative shell support in nix-darwin.
      # programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      security.pam.services.sudo_local.touchIdAuth = true;

      system.defaults = {
        dock.autohide = true;
        finder.FXPreferredViewStyle = "clmv";
        NSGlobalDomain.AppleInterfaceStyle = "Dark";
      };

      # Garbage collection
      nix.gc = {
        automatic = true;
        options = "--delete-generations +5";
      };
      nix.optimise.automatic = true;
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#macbook
    darwinConfigurations."macbook" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };
  };
}
