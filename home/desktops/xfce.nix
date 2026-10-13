{
  imports = [ ../programs/dos-prompt.nix ];

  xfconf.settings = {
    xsettings = {
      "Net/ThemeName" = "Chicago95";
      "Net/IconThemeName" = "Chicago95";
      # "Gtk/CursorThemeName" = "Chicago95 Standard Cursors";
    };
    xfwm4 = {
      "general/theme" = "Chicago95";
    };
  };

  xdg.configFile."xfce4/terminal/terminalrc".text = ''
    [Configuration]
    FontUseSystem=FALSE
    FontName=Less Perfect DOS VGA 12
    FontAllowBold=FALSE
    MiscCursorShape=TERMINAL_CURSOR_SHAPE_UNDERLINE
    MiscCursorBlinks=TRUE
  '';
}
