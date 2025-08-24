{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sundo";
  home.homeDirectory = "/home/sundo";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    brightnessctl
    btop
    clang_21
    cmake
    fastfetch
    gh
    gnumake
    hyprpaper
    luajit_2_1
    lua-language-server
    plemoljp-nf
    ripgrep
    rustup
    terminaltexteffects
    vim
    vivaldi
    wget
    zvm
  ];

  home.sessionPath = [ "$HOME/.local/bin" "$HOME/.zvm/bin" ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/sundo/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  programs.foot = {
    enable = true;
    settings = {
      main.font = "PlemolJP35ConsoleNF-Text:size=8";
      bell.visual = "on";
      csd.size = 0;
      colors = {
        cursor = "111111 cccccc";
        alpha = 0.1;
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
      core.editor = "vim";
      credential.helper = "store";
      safe.directory = "/etc/nixos";
    };
  };
  programs.lazygit.enable = true;
  programs.neovide = {
    enable = true;
    settings.fork = true;
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;
    settings = {
      monitor = ",preferred,auto,auto";

      "$mod" = "SUPER";
      "$terminal" = "foot";
      "$browser" = "vivaldi --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime";
      "$subbrowser" = "microsoft-edge-dev --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-wayland-ime";
      exec-once = [ "fcitx5 -d" "hyprpaper" ];
      env = [
        "XCURSOR_SIZE,24"
	"HYPRCURSOR_SIZE,24"
      ];
      general = {
        gaps_in = 5;
	gaps_out = 5;
	border_size = 2;
	"col.active_border" = "rgba(00ffffee)";
	"col.inactive_border" = "rgba(000000ee)";
	resize_on_border = false;
	allow_tearing = false;
	layout = "dwindle";
      };
      decoration = {
        rounding = 10;
	rounding_power = 2;
	active_opacity = 1;
	inactive_opacity = 1;
	blur = {
	  enabled = true;
          brightness = 0.5;
	  size = 10;
	};
      };
      animations = {
        enabled = "yes";
	bezier = [
	  "easeOutQuint,0.23,1,0.32,1"
	  "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
	  "almostLinear,0.5,0.5,0.75,1"
	  "quick,0.15,0,0.1,1"
	];
	animation = [
          "global,1,10,default"
          "border,1,5.39,easeOutQuint"
          "windows,1,4.79,easeOutQuint"
          "windowsIn,1,4.1,easeOutQuint,popin 87%"
          "windowsOut,1,1.49,linear,popin 87%"
          "fadeIn,1,1.73,almostLinear"
          "fadeOut,1,1.46,almostLinear"
          "fade,1,3.03,quick"
          "layers,1,3.81,easeOutQuint"
          "layersIn,1,4,easeOutQuint,fade"
          "layersOut,1,1.5,linear,fade"
          "fadeLayersIn,1,1.79,almostLinear"
          "fadeLayersOut,1,1.39,almostLinear"
          "workspaces,1,1.94,easeOutQuint,slide"
          "workspacesIn,1,1.21,easeOutQuint,slide"
          "workspacesOut,1,1.94,easeOutQuint,slide"
	];
      };
      bind = [
        "$mod,Q,exec,$terminal"
        "$mod,B,exec,$browser"
        "$mod,E,exec,$subbrowser"
	"$mod,C,killactive"
        "$mod,M,exit"
	"$mod,1,workspace,1"
	"$mod,2,workspace,2"
	"$mod,3,workspace,3"
	"$mod,4,workspace,4"
	"$mod,5,workspace,5"
	"$mod,6,workspace,6"
	"$mod,7,workspace,7"
	"$mod,8,workspace,8"
	"$mod,9,workspace,9"
	"$mod SHIFT,1,movetoworkspace,1"
	"$mod SHIFT,2,movetoworkspace,2"
	"$mod SHIFT,3,movetoworkspace,3"
	"$mod SHIFT,4,movetoworkspace,4"
	"$mod SHIFT,5,movetoworkspace,5"
	"$mod SHIFT,6,movetoworkspace,6"
	"$mod SHIFT,7,movetoworkspace,7"
	"$mod SHIFT,8,movetoworkspace,8"
	"$mod SHIFT,9,movetoworkspace,9"
      ];
      windowrule = [
        "suppressevent maximize, class:.*"
	"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    autocd = true;
    history = {
      ignoreAllDups = true;
      ignoreSpace = true;
      size = 100000000;
    };
    shellAliases = {
      laz = "lazygit";
      sudo = "sudo -E ";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  services.mako.enable = true;

  nixpkgs.config.allowUnfree = true;
}
