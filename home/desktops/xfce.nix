{ pkgs, ... }:
let
  modoki = pkgs.fetchFromGitHub {
    owner = "soup-bowl";
    repo = "Modoki-Firefox";
    rev = "9acf66f";
    hash = "sha256-QPXnXjekF7gbEYvYtyULbalTH/Lg5Ya17gsc+ke7BNc=";
  };
in
{
  imports = [ ../programs/dos-prompt.nix ];

  programs.firefox.profiles.default.settings = {
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
  };

  home.file.".mozilla/firefox/default/chrome".source = "${modoki}/IE6/chrome";

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

  xdg.dataFile."xfce4/helpers/custom-WebBrowser.desktop".text = ''
    [Desktop Entry]
    NoDisplay=true
    Version=1.0
    Encoding=UTF-8
    Type=X-XFCE-Helper
    X-XFCE-Category=WebBrowser
    X-XFCE-Binaries=firefox-esr;
    X-XFCE-Commands=firefox-esr
    X-XFCE-CommandsWithParameters=firefox-esr "%s"
    Icon=firefox
    Name=Firefox ESR
  '';

  xdg.configFile."xfce4/helpers.rc".text = ''
    WebBrowser=firefox-esr
  '';
}
