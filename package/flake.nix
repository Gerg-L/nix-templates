{
  inputs = {
    /* Declare your nixpkgs input
       here's three options, from most verbose to least verbose
    */

    # nixpkgs = {
    #   type = "github";
    #   owner = "NixOS";
    #   repo = "nixpkgs";
    #   ref = "nixos-unstable";
    # };
    # nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    /* More information on flake references:
       https://nixos.org/manual/nix/stable/command-ref/new-cli/nix3-flake.html#flake-references
    */
  };
  outputs =
    { nixpkgs, ... }:
    {
      packages.x86_64-linux =
        let
          /* Don't have a outputs scoped pkgs
             Keep pkgs inside <output>.<system> attributes as pkgs is <system> dependent
          */
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
        in
        {
          /* Use "callPackage" instead of "import" for importing packages

             More info:
             https://summer.nixos.org/blog/callpackage-a-tool-for-the-lazy/
          */
          default = pkgs.callPackage ./package.nix { };
        };
    };
}
