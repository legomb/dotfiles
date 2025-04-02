{ self, pkgs, ... }:
{

  # imports =
  #   [
  #     ./modules/vscode.nix
  #   ];

  # The default Nix build user group ID was changed from 30000 to 350. You can set the configured group ID to match the actual value with `ids.gids.nixbld = 30000;`
  # We do not recommend trying to change the group ID with macOS user management tools without a complete uninstallation and reinstallation of Nix.
  ids.gids.nixbld = 30000;

  nixpkgs.config.allowUnfree = true;
  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    coreutils
    git
    go-task
    neovim
    stow
    nixfmt-rfc-style
    # vscode-with-extensions
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

    # Taps
    taps = [
      "cirruslabs/cli"
      "felixkratz/formulae"
      "homebrew/bundle"
      "homebrew/cask-fonts"
      "homebrew/services"
      "jesseduffield/lazygit"
      "koekeishiya/formulae"
    ];

    # Brew formulas
    brews = [
      "aichat"
      "asciiquarium"
      "bat"
      "libpng"
      "freetype"
      "cmatrix"
      "cookiecutter"
      # "coreutils"
      "direnv"
      "docker"
      "icu4c@76"
      "node"
      "emscripten"
      "fzf"
      "gh"
      # "git"
      # "go-task"
      "jinja2-cli"
      "jq"
      "lsd"
      { name = "luajit"; args = [ "HEAD" ]; }
      "lynx"
      "mas"
      "micro"
      "nano"
      "neofetch"
      { name = "tree-sitter"; args = [ "HEAD" ]; }
      { name = "neovim"; link = false; }
      "nnn"
      "ollama"
      "pandoc"
      # "python@3.11"
      # "rust"
      # "stow"
      "switchaudio-osx"
      "tldr"
      "tmux"
      "tree"
      # "uv"
      "vale"
      "w3m"
      "wget"
      "yazi"
      "yq"
      "zellij"
      "zoxide"
      "zsh-history-substring-search"
      "zsh-syntax-highlighting"
      "cirruslabs/cli/tart"
      "felixkratz/formulae/borders"
      "felixkratz/formulae/sketchybar"
      "jesseduffield/lazygit/lazygit"
      "koekeishiya/formulae/skhd"
      "koekeishiya/formulae/yabai"
    ];

    # Casks (including commented out ones)
    casks = [
      "adobe-acrobat-reader"
      # "alacritty"
      "alt-tab"
      # "font-0xproto-nerd-font"
      # "font-3270-nerd-font"
      # "font-agave-nerd-font"
      # "font-anonymice-nerd-font"
      # "font-arimo-nerd-font"
      # "font-aurulent-sans-mono-nerd-font"
      # "font-bigblue-terminal-nerd-font"
      # "font-bitstream-vera-sans-mono-nerd-font"
      # "font-blex-mono-nerd-font"
      # "font-caskaydia-cove-nerd-font"
      # "font-caskaydia-mono-nerd-font"
      # "font-code-new-roman-nerd-font"
      # "font-comic-shanns-mono-nerd-font"
      # "font-commit-mono-nerd-font"
      # "font-cousine-nerd-font"
      # "font-d2coding-nerd-font"
      # "font-daddy-time-mono-nerd-font"
      # "font-dejavu-sans-mono-nerd-font"
      # "font-droid-sans-mono-nerd-font"
      # "font-envy-code-r-nerd-font"
      # "font-fantasque-sans-mono-nerd-font"
      # "font-fira-code-nerd-font"
      # "font-fira-mono-nerd-font"
      # "font-geist-mono-nerd-font"
      # "font-go-mono-nerd-font"
      # "font-gohufont-nerd-font"
      # "font-hack-nerd-font"
      # "font-hasklug-nerd-font"
      # "font-heavy-data-nerd-font"
      # "font-hurmit-nerd-font"
      # "font-im-writing-nerd-font"
      # "font-inconsolata-go-nerd-font"
      # "font-inconsolata-lgc-nerd-font"
      # "font-inconsolata-nerd-font"
      # "font-intone-mono-nerd-font"
      # "font-iosevka-nerd-font"
      # "font-iosevka-term-nerd-font"
      # "font-iosevka-term-slab-nerd-font"
      # "font-jetbrains-mono-nerd-font"
      # "font-lekton-nerd-font"
      # "font-liberation-nerd-font"
      # "font-lilex-nerd-font"
      # "font-martian-mono-nerd-font"
      "font-meslo-lg-nerd-font"
      # "font-monaspace-nerd-font"
      # "font-monocraft-nerd-font"
      # "font-monofur-nerd-font"
      # "font-monoid-nerd-font"
      # "font-mononoki-nerd-font"
      # "font-mplus-nerd-font"
      # "font-noto-nerd-font"
      # "font-open-dyslexic-nerd-font"
      # "font-overpass-nerd-font"
      # "font-profont-nerd-font"
      # "font-proggy-clean-tt-nerd-font"
      # "font-roboto-mono-nerd-font"
      # "font-sauce-code-pro-nerd-font"
      # "font-shure-tech-mono-nerd-font"
      # "font-space-mono-nerd-font"
      # "font-symbols-only-nerd-font"
      # "font-terminess-ttf-nerd-font"
      # "font-tinos-nerd-font"
      # "font-ubuntu-mono-nerd-font"
      # "font-ubuntu-nerd-font"
      # "font-victor-mono-nerd-font"
      # "kitty"
      "ghostty"
      "sf-symbols"
      "vagrant"
      "whatsapp"
      "xquartz"
    ];

    # Mac App Store apps
    masApps = {
      # "Aeon Timeline" = 1563351378;
      "Brother iPrint&Scan" = 1193539993;
      # "iA Writer" = 775737590;
      # "iMovie" = 408981434;
      # "Keynote" = 409183694;
      # "LanguageTool" = 1534275760;
      # "Magnet" = 441258766;
      # "Numbers" = 409203825;
      "Pages" = 409201541;
      "Telegram" = 747648890;
      # "Ulysses" = 1225570693;
      # "Ulysses" = 623795237;
      "WhatsApp" = 1147396723;
      "Xcode" = 497799835;
    };
  };

  # programs.vscode = {
  #   enable = true;
  #   extensions = with pkgs.vscode-extensions; [
  #     "adamvoss.vscode-languagetool"
  #     "adamvoss.vscode-languagetool-en"
  #     "adamvoss.vscode-languagetool-es"
  #     "alexkrechik.cucumberautocomplete"
  #     "alexowl.transparent-color-theme"
  #     "bbenoist.nix"
  #     "be5invis.vscode-custom-css"
  #     "benjaminbenais.copilot-theme"
  #     "bierner.markdown-mermaid"
  #     "bierner.markdown-yaml-preamble"
  #     "bpruitt-goddard.mermaid-markdown-syntax-highlighting"
  #     "brandonkirbyson.vscode-animations"
  #     "brettm12345.nixfmt-vscode"
  #     "catppuccin.catppuccin-vsc"
  #     "catppuccin.catppuccin-vsc-icons"
  #     "chrischinchilla.vscode-pandoc"
  #     "coastermcgee.word-theme"
  #     "cshum.convert-newline-list-to-array"
  #     "davidanson.vscode-markdownlint"
  #     "digoro.synonym-finder"
  #     "docsmsft.docs-markdown"
  #     "docsmsft.docs-metadata"
  #     "dracula-theme.theme-dracula"
  #     "drcika.apc-extension"
  #     "ehsanansari.sakura-garden-at-night"
  #     "endormi.2077-theme"
  #     "esbenp.prettier-vscode"
  #     "evan-buss.font-switcher"
  #     "evidence.evidence-vscode"
  #     "fnando.linter"
  #     "github.copilot"
  #     "github.copilot-chat"
  #     "github.vscode-pull-request-github"
  #     "gruntfuggly.todo-tree"
  #     "hashicorp.terraform"
  #     "hoovercj.vscode-power-mode"
  #     "howardzuo.vscode-favorites"
  #     "innoverio.vscode-dbt-power-user"
  #     "james-yu.latex-workshop"
  #     "johnguo.columnpaste"
  #     "johnpapa.read-time"
  #     "katsute.code-background"
  #     "lmcarreiro.vscode-smart-column-indenter"
  #     "manuth.markdown-converter"
  #     "marp-team.marp-vscode"
  #     "mdickin.markdown-shortcuts"
  #     "mechatroner.rainbow-csv"
  #     "mhutchie.git-graph"
  #     "moshfeu.compare-folders"
  #     "ms-azuretools.vscode-docker"
  #     "ms-python.debugpy"
  #     "ms-python.isort"
  #     "ms-python.python"
  #     "ms-python.vscode-pylance"
  #     "ms-toolsai.jupyter"
  #     "ms-toolsai.jupyter-keymap"
  #     "ms-toolsai.jupyter-renderers"
  #     "ms-toolsai.vscode-jupyter-cell-tags"
  #     "ms-toolsai.vscode-jupyter-slideshow"
  #     "ms-vscode-remote.remote-containers"
  #     "ms-vscode-remote.remote-ssh"
  #     "ms-vscode-remote.remote-ssh-edit"
  #     "ms-vscode.remote-explorer"
  #     "ms-vscode.wordcount"
  #     "naumovs.color-highlight"
  #     "npaz.vscode-dynamic-layouts"
  #     "oderwat.indent-rainbow"
  #     "perkovec.emoji"
  #     "piersdeseilligny.betterfountain"
  #     "pkief.material-icon-theme"
  #     "plotlydashsnippets.plotly-dash-snippets"
  #     "redhat.vscode-yaml"
  #     "samuelcolvin.jinjahtml"
  #     "shd101wyy.markdown-preview-enhanced"
  #     "shyykoserhiy.vscode-spotify"
  #     "stateful.runme"
  #     "svelte.svelte-vscode"
  #     "taniguchi.pandoc"
  #     "task.vscode-task"
  #     "technovangelist.ollamamodelfile"
  #     "tomoki1207.pdf"
  #     "vsc-zoctarine.markdown-fiction-writer"
  #     "wilsonsio.color-vision"
  #     "witulski.selection-word-count"
  #     "xgr-development.collapse"
  #     "yzhang.markdown-all-in-one"
  #   ];
  # };

  nix.settings = {
    keep-outputs = true;
    keep-derivations = true;

    # Necessary for using flakes on this system.
    experimental-features = "nix-command flakes";
  };

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
