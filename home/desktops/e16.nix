{
  services.dunst.enable = true;

  xdg.configFile."sxhkd/sxhkdrc".text = ''
    ctrl + alt + t
        kitty

    super + space
        rofi -show drun

    super + r
        xrandr --output Virtual-1 --auto
  '';
}
