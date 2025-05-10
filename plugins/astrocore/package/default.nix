{ pkgs, ... }:

let version = "1.11.0";
in pkgs.vimUtils.buildVimPlugin {
  inherit version;

  name = "astrocore";

  src = pkgs.fetchFromGitHub {
    owner = "astronvim";
    repo = "astrocore";
    rev = "v${version}";
    hash = "sha256-MXVr0tJEgkghjchC3yhJAItJYpvw0z9xaZzIk1Czepk=";
  };

  patches = [ ./init.lua.patch ./mason.lua.patch ];
}
