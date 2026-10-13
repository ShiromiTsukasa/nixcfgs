{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    desktopManager.xfce.enable = true;
    displayManager.lightdm.enable = true;
  };
  services.displayManager.defaultSession = "xfce";

  environment.systemPackages = with pkgs; [
    chicago95
    xfce4-whiskermenu-plugin
  ];

  fonts.packages = [ pkgs.chicago95 ];
}
