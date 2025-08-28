{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    oldwezterm.url = "nixpkgs/5ad9903c16126a7d949101687af0aa589b1d7d3d";
  };

  outputs = { self, nixpkgs, oldwezterm, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./configuration.nix

            ({ pkgs, ... }: {
              nixpkgs.overlays = [
                (final: prev: {
                  wezterm = oldwezterm.legacyPackages.${final.system}.wezterm;
                })
              ];
            })
          ];
        };
      };
    };
}
