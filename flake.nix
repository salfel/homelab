{
  description = "Homelab flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, disko, ... }: 
  let 
    system = "x86_64-linux";
  in 
  {
    nixosConfigurations.homelab = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        ./hardware-configuration.nix
        disko.nixosModules.disko
      ];
    };
  };
}
