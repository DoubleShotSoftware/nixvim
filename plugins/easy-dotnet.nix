{ pkgs, ... }: {
  opts = {
    enable = true;
    package = pkgs.unstable.vimPlugins.easy-dotnet-nvim;
    settings = {

    };
  };
  rootOpts = { };
}
