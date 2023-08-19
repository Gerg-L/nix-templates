{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
  outputs = inputs @ {nixpkgs, ...}: {
    #You must change your hostname here
    nixosConfigurations.hostname = nixpkgs.lib.nixosSystem {
      modules = [./configuration.nix];
      specialArgs = {inherit inputs;};
    };
  };
}
