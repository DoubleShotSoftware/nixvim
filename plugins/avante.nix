{pkgs, ... }: {
  opts = {
    enable = true;
    package = pkgs.unstable.vimPlugins.avante-nvim;
    settings = {
      provider = "ollama";
      ollama = {
        endpoint = "http://172.16.1.22:11434/";
        model = "qwen2.5-coder:14b";
      };
      diff = {
        autojump = true;
        debug = false;
        list_opener = "copen";
      };
      highlights = {
        diff = {
          current = "DiffText";
          incoming = "DiffAdd";
        };
      };
      hints = { enabled = true; };
      mappings = {
        diff = {
          both = "cb";
          next = "]x";
          none = "c0";
          ours = "co";
          prev = "[x";
          theirs = "ct";
        };
      };
      windows = {
        sidebar_header = {
          align = "center";
          rounded = true;
        };
        width = 30;
        wrap = true;
      };
    };
  };

}
