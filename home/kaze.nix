{ pkgs, ... }: {
  imports = [
    ./programs/git.nix
    ./programs/helix.nix
    ./programs/fish.nix
    ./programs/kitty.nix
  ];
  
  home.username = "kaze";
  home.homeDirectory = "/home/kaze";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [ ripgrep fd jq lsd duf firefox ];
}
