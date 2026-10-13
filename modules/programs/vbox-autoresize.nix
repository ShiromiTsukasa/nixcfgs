{ pkgs, ... }:
let
  xrandr = "${pkgs.xrandr}/bin/xrandr";
  awk = "${pkgs.gawk}/bin/awk";
  autoresize = pkgs.writeShellScript "vbox-autoresize" ''
    while sleep 1; do
      out=$(${xrandr} | ${awk} '/ connected/{print $1; exit}')
      # a preferred mode ("+") that isn't the current one ("*")
      if ${xrandr} | ${awk} '/^ +[0-9]+x[0-9]+/ && /\+/ && !/\*/ {f=1} END{exit !f}'; then
        ${xrandr} --output "$out" --auto
      fi
    done
  '';
in {
  environment.etc."xdg/autostart/vbox-autoresize.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=VirtualBox auto-resize
    Exec=${autoresize}
    NoDisplay=true
  '';
}
