{
  programs.plasma = {
    enable = true;
    workspace = {
      colorScheme = "BreezeDark";
      lookAndFeel = "org.kde.breezedark.desktop";
    };
    input.keyboard.layouts = [
      { layout = "us"; }
    ];
    kscreenlocker.autoLock = true;
    shortcuts = {
      "kwin"."Window Close" = "Meta+Q";
    };
    configFile = {
      "kdeglobals"."General" = {
        TerminalApplication = "kitty";
        TerminalService = "kitty.desktop";
      };
    };
    hotkeys.commands."launch-kitty" = {
      name = "Launch kitty";
      key = "Ctrl+Alt+T";
      command = "kitty";
    };
  };
}
