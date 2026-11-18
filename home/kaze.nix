{ pkgs, ... }:
let
  browser = "firefox-esr.desktop";
in
{
  imports = [
    ./programs/git.nix
    ./programs/helix.nix
    ./programs/fish.nix
    ./programs/kitty.nix
    ./programs/firefox.nix
  ];

  home.username = "kaze";
  home.homeDirectory = "/home/kaze";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    ripgrep
    fd
    jq
    lsd
    duf
  ];

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = browser;
      "x-scheme-handler/http" = browser;
      "x-scheme-handler/https" = browser;
      "x-scheme-handler/about" = browser;
      "x-scheme-handler/unknown" = browser;
    };
  };
}
