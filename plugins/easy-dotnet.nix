{ pkgs, ... }: {
  opts = {
    enable = true;
    package = pkgs.unstable.vimPlugins.easy-dotnet-nvim;
    settings = { };
    luaConfig.post = # lua
      ''
              if vim.bo.filetype == "cs" or vim.bo.filetype == "csharp" then
              vim.keymap.set("n", "<leader>pe", "<cmd>DotnetUI<CR>", { buffer = true, desc = "Show Easy Dotnet UI" })
              vim.keymap.set("n", "<leader>pb", "<cmd>Dotnet build quickfix<CR>", { buffer = true, desc = "Run dotnet build with quick fix" })
              vim.keymap.set("n", "<leader>pr", "<cmd>Dotnet restore<CR>", { buffer = true, desc = "Run dotnet restore" })
              vim.keymap.set("n", "<leader>pc", "<cmd>Dotnet clean<CR>", { buffer = true, desc = "Run dotnet clean" })
              vim.keymap.set("n", "<leader>pf", "<cmd>split | terminal dotnet format<CR>", { buffer = true, desc = "Run dotnet format in terminal" })
        end 
      '';
  };
  rootOpts = { };
}
