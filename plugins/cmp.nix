{ pkgs, ... }: {
  opts = {
    enable = true;
    autoEnableSources = true;
    settings = {
      snippet.expand =
        "function(args) require('luasnip').lsp_expand(args.body) end";
      mapping = {
        "<C-k>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        "<C-j>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        "<Up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        "<Down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
      };
      sources = [
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        { name = "copilot"; }
        { name = "nvim_lua"; }
        { name = "treesitter"; }
        { name = "path"; }
        { name = "buffer"; }
        { name = "git"; }
      ];
      window = {
        completion = {
          border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
          scrollbar = true;
        };
        documentation = { border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ]; };
      };
    };
  };
  rootOpts = {
    plugins = {
      copilot-cmp.enable = true;
      cmp-treesitter.enable = true;
      cmp-path.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-nvim-lsp-document-symbol.enable = true;
      cmp-nvim-lsp-signature-help.enable = true;
      cmp-nvim-lua.enable = true;
      cmp_luasnip.enable = true;
      luasnip = {
        enable = pkgs.lib.mkDefault true;
        settings = { enable_autosnippets = pkgs.lib.mkDefault true; };
      };
    };
  };
}
