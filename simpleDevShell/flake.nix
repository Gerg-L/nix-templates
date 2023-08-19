{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
  outputs = {nixpkgs, ...}: {
    devShells.x86_64-linux.default = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
      pkgs.mkShell {
        packages = [
          pkgs.hello
        ];
      };
  };
}
