{ ... }: {
  opts = {
    enable = true;
    autoEnableSources = true;
    settings = {
      snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";
      mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-d>" = "cmp.mapping.scroll_docs(-4)";
        "<C-e>" = "cmp.mapping.close()";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-g>" = "cmp.open_docs()";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";

      };
      sources = [
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        { name = "nvim_lua"; }
        { name = "treesitter"; }
        { name = "path"; }
        { name = "buffer"; }
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
      cmp-treesitter.enable = true;
      cmp-path.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-nvim-lsp-document-symbol.enable = true;
      cmp-nvim-lsp-signature-help.enable = true;
      cmp-nvim-lua.enable = true;
      cmp-nvim-ultisnips.enable = true;
      cmp_luasnip.enable = true;
    };
  };
}
