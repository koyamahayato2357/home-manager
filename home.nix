{ config, pkgs, ... }:

let
  username = "sundo";
  homeDirectory = "/home/${username}";
in

{
  home.username = username;
  home.homeDirectory = homeDirectory;

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    asciinema_3
    brightnessctl
    btop
    cmake
    fastfetch
    gh
    gnumake
    hyprpaper
    llvmPackages_21.bintools-unwrapped
    llvmPackages_21.clangUseLLVM
    llvmPackages_21.clang-tools
    llvmPackages_21.llvm
    luajit_2_1
    lua-language-server
    microsoft-edge
    nixd
    nodejs_latest
    ollama
    plemoljp-nf
    qemu
    ripgrep
    rustup
    terminaltexteffects
    vim
    vim-startuptime
    vivaldi
    wget
    yt-dlp
    zvm
  ];

  home.sessionPath = [ "$HOME/.local/bin" "$HOME/.zvm/bin" ];

  home.file = {
    ".config/hypr/hyprpaper.conf".source = dots/hyprpaper.conf;
    ".config/quickshell/shell.qml".source = dots/shell.qml;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.bat.enable = true;
  programs.cmus.enable = true;
  programs.foot = {
    enable = true;
    settings = {
      main.font = "PlemolJP35ConsoleNF-Text:size=8";
      bell.visual = "on";
      csd.size = 0;
      colors = {
        cursor = "111111 cccccc";
        alpha = 1;
	foreground = "f8f8f8";
        background = "171717";
        regular0 = "171717";
        regular1 = "d81765";
        regular2 = "97d01a";
        regular3 = "ffa800";
        regular4 = "16b1fb";
        regular5 = "ff2491";
        regular6 = "0fdcb6";
        regular7 = "ebebeb";
        bright0 = "979797";
        bright1 = "ff0000";
        bright2 = "76b639";
        bright3 = "e1a126";
        bright4 = "289cd5";
        bright5 = "ff2491";
        bright6 = "0a9b81";
        bright7 = "f8f8f8";
        "16" = "fab387";
        "17" = "f5e0dc";
        selection-foreground = "cdd6f4";
        selection-background = "414356";
        search-box-no-match = "11111b f38ba8";
        search-box-match = "cdd6f4 313244";
        jump-labels = "11111b fab387";
        urls = "89b4fa";
      };
    };
  };
  programs.git = {
    enable = true;
    userName = "koyamahayato2357";
    userEmail = "sundongxiaoshan202@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "nvim";
      credential.helper = "store";
      safe.directory = "/etc/nixos";
      pull.rebase = false;
    };
  };
  programs.lazygit.enable = true;
  programs.neovide = {
    enable = true;
    settings.fork = true;
  };
  programs.nushell = {
    enable = true;
    environmentVariables = {
      config.edit_mode = "vi";
      EDITOR = "nvim";
    };
    shellAliases = import ./shellAliases.nix;
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zsh = {
    autocd = true;
    autosuggestion.enable = true;
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    history = {
      ignoreAllDups = true;
      ignoreSpace = true;
      size = 100000000;
    };
    shellAliases = import ./shellAliases.nix;
    initContent = "bindkey -v";
  };

  programs.home-manager.enable = true;

  services.mako.enable = true;

  nixpkgs.config.allowUnfree = true;
}
