{ pkgs, ... }:
let
  version = "0d298e68efa511df18a0bd4fd9a0c9bf70ebdbf2";
  roslyn-language-server = pkgs.vimUtils.buildVimPlugin {
    inherit version;
    name = "roslyn.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "seblyng";
      repo = "roslyn.nvim";
      rev = version;
      hash = "sha256-UgFY13WKxV1jhjzqZS1AHMN/dMrgt3uAkhZjAuthHMg";
    };
  };
in {
  extraPlugins = [ roslyn-language-server ];
  extraPackages = [ pkgs.unstable.roslyn-ls ];
  extraConfigLuaPost = builtins.readFile ../lua/roslyn-language-server.lua;
  keymaps = [ ];
}
