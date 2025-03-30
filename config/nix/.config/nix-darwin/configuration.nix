{ self, pkgs, ... }:
{

  # The default Nix build user group ID was changed from 30000 to 350. You can set the configured group ID to match the actual value with `ids.gids.nixbld = 30000;`
  # We do not recommend trying to change the group ID with macOS user management tools without a complete uninstallation and reinstallation of Nix.
  ids.gids.nixbld = 30000;

  nixpkgs.config.allowUnfree = true;
  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    git
    go-task
    neovim
    stow
    nixfmt-rfc-style
  ];

  # Enable and configure Homebrew
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "none";
    };
    global = {
      brewfile = false;
    };
    # taps = [];
    # brews = [];
    # casks = [];
    # masApps = [];
    # whalebrews = [];
  };

  nix.settings = {
    keep-outputs = true;
    keep-derivations = true;

    # Necessary for using flakes on this system.
    experimental-features = "nix-command flakes";
  };

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  # system.configurationRevision = self.rev or self.dirtyRev or null;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;

  security.pam.services.sudo_local.touchIdAuth = true;

  system.defaults = {
    dock.autohide = true;
    finder.FXPreferredViewStyle = "clmv";
    finder.AppleShowAllExtensions = true;
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
  };

  # Garbage collection
  nix.gc = {
    automatic = true;
    options = "--delete-generations +5";
  };
  nix.optimise.automatic = true;
}
