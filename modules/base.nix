{ pkgs, ... }:
let
  privateConfig = ../../private/base.nix;
in
{
  imports = if builtins.pathExists privateConfig then [ privateConfig ] else [ ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  nix.settings.auto-optimise-store = true;
  nixpkgs.config.allowUnfree = true;

  boot.loader.limine = {
    enable = true;
    maxGenerations = 20;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  time.timeZone = "UTC";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.kaze = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
    ];
    initialPassword = "changeme";
  };

  environment.systemPackages = with pkgs; [
    git
    curl
    htop
    btop
  ];
}
