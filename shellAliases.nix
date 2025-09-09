let
  sudo = "sudo -E";
in {
    c = "${sudo} nvim /etc/nixos/configuration.nix";
    h = "nvim ~/.config/home-manager/home.nix";
    hs = "home-manager switch";
    laz = "lazygit";
    n = "nvim";
    ns = "${sudo} nixos-rebuild switch";
    sudo = sudo;
}
