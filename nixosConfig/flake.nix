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
    {nixpkgs, ...}:
    {
      nixosConfigurations = {
        /* Create a host
           the name here should be the same as networking.hostName
        */
        hostname = nixpkgs.lib.nixosSystem {
          modules =
            [
              # Add your existing configuration entry point here
              ./configuration.nix
            ];
          # You probably want to pass inputs to your modules
          # https://blog.nobbz.dev/2022-12-12-getting-inputs-to-modules-in-a-flake/
        };
      };
    };
}
