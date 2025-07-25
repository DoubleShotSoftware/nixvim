{ ... }: {
  opts = {
    enable = true;
    settings = {
      panel = {
        enabled = true;
        auto_refresh = false;
        keymap = {
          jump_prev = "[[";
          jump_next = "]]";
          accept = "<CR>";
          refresh = "gr";
          open = "<M-CR>";
        };
        layout = {
          position = "bottom";
          ratio = 0.4;
        };
      };
      suggestion = {
        enabled = true;
        auto_trigger = true;
        debounce = 75;
        keymap = {
          accept = "<M-l>";
          accept_word = false;
          accept_line = "<M-L>";
          next = "<M-]>";
          prev = "<M-[>";
          dismiss = "<C-]>";
        };
      };
      filetypes = {
        yaml = false;
        markdown = false;
        help = false;
        gitcommit = false;
        gitrebase = false;
        hgcommit = false;
        svn = false;
        cvs = false;
        "." = false;
      };
    };
  };
  rootOpts = { extraConfigLuaPost = builtins.readFile ../lua/copilot.lua; };
}
