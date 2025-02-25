{ ... }: {
  imports = [
    ./dotnet-nvim.nix
    ./easy-dotnet.nix
    ./neoformat.nix
    ./tabby.nix
    ./telescope-tabs.nix
    ./roslyn-language-server.nix
    ./colorful-menu.nix
  ];
}
