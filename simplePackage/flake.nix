{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
  outputs = {nixpkgs, ...}: {
    packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.callPackage ./. {};
  };
}
