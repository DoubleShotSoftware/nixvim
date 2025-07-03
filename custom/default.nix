{ ... }: {
  imports = [
    ./dotnet-nvim.nix
    ./neoformat.nix
    ./tabby.nix
    ./telescope-tabs.nix
    ./roslyn-language-server.nix
    ./colorful-menu.nix
    ./movement-mode.nix
  ];
}
