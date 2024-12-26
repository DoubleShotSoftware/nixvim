{ pkgs, ... }:
let
  dotnet-nvim = pkgs.vimUtils.buildVimPlugin {
    name = "dotnet.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "MoaidHathot";
      repo = "dotnet.nvim";
      rev = "f5c52f9f52a3d8ca8dff6916c2228fb41a075274";
      hash = "sha256-QonW4orbtdMcoxqvB/FU7Cw5ABPExEMZwMLHIZWAWPs=";
    };

  };
in {
  extraPlugins = [ dotnet-nvim ];
  extraConfigLuaPost = builtins.readFile ../lua/dotnet-nvim.lua;
  keymaps = [ ];
}
