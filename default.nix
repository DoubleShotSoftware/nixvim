{ pkgs, ... }:

{
  imports = [ ./custom ./config ./plugins ./utils ./options.nix ];

  config = {
    editorconfig.enable = true;
    # Use <Space> as leader key
    globals.mapleader = " ";
    extraConfigLua = builtins.readFile ./lua/utils.lua;

    # Set 'vi' and 'vim' aliases to nixvim
    viAlias = true;
    vimAlias = true;

    # Setup clipboard support
    clipboard = {
      # Use xsel as clipboard provider
      providers.xsel.enable = true;

      # Sync system clipboard
      register = "unnamedplus";
    };
    plugins = {
      zellij.enable = true;

    };
    extraPlugins = with pkgs.vimPlugins; [
      mini-icons
      vim-devicons
      nvim-web-devicons
      nvim-nonicons
      nui-nvim
    ];
  };
}
