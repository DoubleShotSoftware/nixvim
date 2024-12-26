{ pkgs, ... }:
let
  easy-dotnet = pkgs.vimUtils.buildVimPlugin {
    name = "easy-dotnet";
    src = pkgs.fetchFromGitHub {
      owner = "GustavEikaas";
      repo = "easy-dotnet.nvim";
      rev = "a8451f6e45289e36569bd8fb854bb11fdfa21521";
      hash = "sha256-wqmzDJifj0/Z/8fbgvz+fnyEKMvrqkgnsIkfE/hYYCQ=";
    };

  };
in {
  extraPlugins = [ easy-dotnet ];
  extraConfigLuaPost = builtins.readFile ../lua/easy-dotnet.lua;
  keymaps = [ ];
}
