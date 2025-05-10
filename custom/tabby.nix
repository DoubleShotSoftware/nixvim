{ pkgs, ... }:
let
  tabby = pkgs.vimUtils.buildVimPlugin {
    name = "tabby";
    src = pkgs.fetchFromGitHub {
      owner = "nanozuki";
      repo = "tabby.nvim";
      rev = "v2.7.4";
      hash = "sha256-bfyvZkJSCLyTFbMhbjWXJLV2yITXg+Yv++p6gu8TGIU=";
    };

  };
in {
  extraPlugins = [ tabby ];
  extraConfigLuaPost = builtins.readFile ../lua/tabby.lua;
  keymaps = [
    {
      mode = "n";
      key = "<leader>Ta";
      action = ":$tabnew<CR>";
      options = { desc = "New Tab"; };
    }
    {
      mode = "n";
      key = "<leader>Tc";
      action = ":$tabnew<CR>";
      options = { desc = "Close Tab"; };
    }
    {
      mode = "n";
      key = "<leader>To";
      action = ":$tabnew<CR>";
      options = { desc = "Only Tab"; };
    }
    {
      mode = "n";
      key = "<leader>Tn";
      action = ":tabn<CR>";
      options = { desc = "> Tab"; };
    }
    {
      mode = "n";
      key = "<leader>Tn";
      action = ":tabp<CR>";
      options = { desc = "< Tab"; };
    }
    {
      mode = "n";
      key = "<leader>Tmp";
      action = ":-tabmove<CR>";
      options = { desc = "Move Tab Previous"; };
    }
    {
      mode = "n";
      key = "<leader>Tmn";
      action = ":+tabmove<CR>";
      options = { desc = "Move Tab Next"; };
    }
    {
      mode = "n";
      key = "<leader>Tmn";
      action = ":+tabmove<CR>";
      options = { desc = "Move Tab Next"; };
    }
    {
      mode = "n";
      key = "<leader>Tr";
      action = ":TabRenamePopup<CR>";
      options = { desc = "Tab Rename"; };
    }
  ];
}
