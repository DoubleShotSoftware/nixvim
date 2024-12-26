{
  colorschemes = {
    catppuccin = {
      enable = true;
      settings = {
        transparent_background = true;
        disable_underline = false;
        flavour = "mocha";
        integrations = {
          cmp = true;
          gitsigns = true;
          mini = {
            enabled = true;
            indentscope_color = "";
          };
          notify = true;
          neotree = true;
          treesitter = true;
        };
        styles = {
          booleans = [ "bold" "italic" ];
          conditionals = [ "bold" ];
        };
        term_colors = true;

      };
    };
  };

}
