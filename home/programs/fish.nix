{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    shellAbbrs = {
      g = "git";
      gs = "git status";
    };
    shellAliases = {
      ls = "ls --color=auto";
    };
    interactiveShellInit = ''
      set -g fish_greeting
    '';
  };
}
