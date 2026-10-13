{ pkgs, ... }:
let
  autoresize = pkgs.writeShellScript "vbox-autoresize" ''
    while sleep 1; do
        out=$(${pkgs.xrandr}/bin/xrandr | ${pkgs.gawk}/bin/awk '/ connected/{print $1; exit}')
        # a mode is flagged "+" (preferred) but isn't flagged "*" (current)
        if ${pkgs.xrandr}/bin/xrandr | ${pkgs.gawk}/bin/awk '/^ +[0-9]+x[0-9]+/ && /\+/ && !/\*/ {f=1} END{exit !f}'; then
          ${pkgs.xrandr}/bin/xrandr --out "$out" --auto
        fi
    done
    '';
in {
  services.xserver = {
    enable = true;
    windowManager.e16.enable = true;
    displayManager.lightdm.enable = true;
  };
  services.displayManager.defaultSession = "none+E16";

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = "gtk";
  };

  environment.systemPackages = with pkgs; [
    sxhkd
    rofi
    picom
    feh
    pcmanfm
    pavucontrol
    dunst
    libnotify
  ];

  services.xserver.displayManager.sessionCommands = ''
    ${autoresize} &
    ${pkgs.sxhkd}/bin/sxhkd &
    ${pkgs.dunst}/bin/dunst &
  '';
}
