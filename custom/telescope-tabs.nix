{ pkgs, ... }:
let
  telescope-tabs = pkgs.vimUtils.buildVimPlugin {
    name = "telescope-tabs";
    src = pkgs.fetchFromGitHub {
      owner = "LukasPietzschmann";
      repo = "telescope-tabs";
      rev = "0a678eefcb71ebe5cb0876aa71dd2e2583d27fd3";
      hash = "sha256-IvxZVHPtApnzUXIQzklT2C2kAxgtAkBUq3GNxwgPdPY=";
    };

  };
in {
  extraPlugins = [ telescope-tabs ];
  keymaps = [{
    mode = "n";
    key = "<leader>ft";
    action = ":Telescope telescope-tabs list_tabs<CR>";
    options.desc = "Find Tabs";
  }];
}
