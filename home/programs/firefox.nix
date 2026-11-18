{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-esr;
    profiles.default.id = 0;
  };
}
