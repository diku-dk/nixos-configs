# Rebuild:
#
#   sudo nixos-rebuild switch --flake '.#green-hill-zone'
#
# Update:
#
#   nix flake update
{
  description = "green-hlil-zone";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
  };

  outputs = {
    self,
      nixpkgs,
      ...
  } @ inputs: {
    nixosConfigurations.green-hill-zone = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [ ./green-hill-zone.nix ];
    };
  };
}
