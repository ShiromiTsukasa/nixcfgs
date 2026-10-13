{ pkgs, ... }:
let
  # desktop = "plasma";
  # desktop = "e16";
  desktop = "xfce";
in {
  imports = [
    ./hardware-configuration.nix
    ../../modules/base.nix
    ../../modules/audio.nix
    ../../modules/programs/dev.nix
    ../../modules/programs/fish.nix
    ../../modules/desktops/${desktop}.nix
    ../../modules/programs/vbox-autoresize.nix
  ];

  # virtualisation.virtualbox.guest.enable = lib.mkForce false;
  networking.hostName = "astra";

  users.users.kaze.shell = pkgs.fish;

  home-manager.users.kaze.imports = [ ../../home/desktops/${desktop}.nix ];

  # DO NOT CHANGE, EVER
  system.stateVersion = "26.05";
}
