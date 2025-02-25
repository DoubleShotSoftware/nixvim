{ pkgs, ... }:
let
  version = "633a61c30801a854cf52f4492ec8702a8c4ec0e9";
  roslyn-language-server = pkgs.vimUtils.buildVimPlugin {
    inherit version;
    name = "roslyn.nvim";
    src = pkgs.fetchFromGitHub {
      owner = "seblyng";
      repo = "roslyn.nvim";
      rev = version;
      hash = "sha256-PX0r8TFF/Y22zmx+5nYpbNjwKg4nk2N5U41uYE7YnE8=";
    };
  };
in {
  extraPlugins = [ roslyn-language-server ];
  extraPackages = [ pkgs.unstable.roslyn-ls ];
  extraConfigLuaPost = builtins.readFile ../lua/roslyn-language-server.lua;
  keymaps = [ ];
}
