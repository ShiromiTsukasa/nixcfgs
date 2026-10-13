{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        cursorline = true;
        bufferline = "multiple";
        color-modes = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        indent-guides.render= true;
        lsp.display-messages = true;
        inline-diagnostics.cursor-line = "warning";
      };
    };
    extraPackages = with pkgs; [
      nil
      nixfmt
      rust-analyzer
      clang-tools
      kotlin-language-server
      marksman
    ];

    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "nixfmt";
      }
    ];
  };
}
