{ pkgs, ... }: {
  programs.fish.plugins = [
    {
      name = "dos-prompt";
      src = pkgs.callPackage ../../pkgs/fish-dos-prompt { };
    }
  ];
}
