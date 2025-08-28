{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"
  };

  outputs = { self, nixpkgs }:
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./configuration.nix ];
        };
      };
    };
}
