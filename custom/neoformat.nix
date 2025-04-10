{ pkgs, ... }: {
  extraPlugins = with pkgs.vimPlugins; [ neoformat ];
  extraPackages = with pkgs.unstable; [
    topiary
    taplo # toml
  ];
  extraConfigLuaPost = builtins.readFile ../lua/neoformat.lua;
  extraPackages = with pkgs; [
    stylua
  ];
  keymaps = [{
    mode = "n";
    key = "<leader>bf";
    action = ":Neoformat<CR>";
    options = { desc = "Format the current buffer"; };
  }];
}
