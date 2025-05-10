{ pkgs, ... }:
let
  version = "f05ca76486c051a7a6597a433a183952b37f2346";
  colorful-menu = pkgs.vimUtils.buildVimPlugin {
    inherit version;
    name = "colorful-menu.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "xzbdmw";
      repo = "colorful-menu.nvim";
      rev = version;
      hash = "sha256-mB/LMP1RWP1H1uEoQcrx/HGKmW8m+uvOlQnClc18asc=";
    };
  };
in {
  extraPlugins = [ colorful-menu ];
  extraPackages = [];
  extraConfigLuaPost = builtins.readFile ../lua/colorful-menu.lua;
  keymaps = [ ];
}
