{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nix-formatter-pack = {
      url = "github:Gerschtli/nix-formatter-pack";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, nixpkgs-unstable, nixvim, nix-formatter-pack, ... }:
    let
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
    in {
      formatter = forAllSystems (system:
        nix-formatter-pack.lib.mkFormatter {
          pkgs = nixpkgs.legacyPackages.${system};
          config.tools = {
            deadnix.enable = true;
            nixpkgs-fmt.enable = true;
            statix.enable = true;
          };
        });
      nvimLicense = with nixpkgs.lib.licenses; [ asl20 vim ];
      nvimMainttainers = with nixpkgs.maintainers; [ manveru rvolosatovs ];
      packages = forAllSystems (system:
        let
          pkgs = (import nixpkgs rec {
            inherit system;
            config = {
              allowUnfree = true;
              permittedInsecurePackages = [ ];
            };
            overlays = [
              (_final: prev: {
                unstable = import nixpkgs-unstable {
                  inherit (prev) system;
                  inherit config;
                  overlays = [
                    (unstableFinal: unstablePrev: {
                      neovim = unstablePrev.neovim.overrideAttrs (old: {
                        meta = {
                          license = with nixpkgs.lib.licenses; [ asl20 vim ];
                          maintainers = with nixpkgs.maintainers; [
                            manveru
                            rvolosatovs
                          ];
                          platforms = nixpkgs.lib.platforms.unix;
                        };
                      });
                      neovim-unwrapped =
                        unstablePrev.neovim-unwrapped.overrideAttrs (old: {
                          meta = {
                            license = with nixpkgs.lib.licenses; [ asl20 vim ];
                            maintainers = with nixpkgs.maintainers; [
                              manveru
                              rvolosatovs
                            ];
                            platforms = nixpkgs.lib.platforms.unix;
                          };
                        });
                    })

                  ];
                };
              })
            ];
          });
          mkNixvim = specialArgs:
            nixvim.legacyPackages.${system}.makeNixvimWithModule {
              inherit pkgs;
              module = ./.;
              extraSpecialArgs = specialArgs // {
                inherit pkgs;
                icons = import ./utils/_icons.nix;
              };
            };
        in {
          default = mkNixvim { };
          lite = mkNixvim { withLSP = false; };
        });
    };
}
