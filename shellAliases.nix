let
  n = "nvim";
  sudo = "sudo -E";
in {
    c = "${sudo} ${n} /etc/nixos/configuration.nix";
    h = "${n} ~/.config/home-manager/home.nix";
    hs = "home-manager switch";
    laz = "lazygit";
    ns = "${sudo} nixos-rebuild switch";
    rmf = "rm -rf";
    inherit n;
    inherit sudo;
}
