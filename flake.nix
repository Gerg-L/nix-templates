{
  outputs = _: {
    templates = {
      devShell = {
        path = ./devShell;
        description = "As simple as devShell's get";
        welcomeText = ''
          If you haven't already install direnv!
        '';
      };
    };
    package = {
      path = ./package;
      description = "As simple as packages get";
      welcomeText = ''
        Make sure to learn about callPackage
      '';
    };
    nixosConfig = {
      path = ./nixosConfig;
      description = "A decent nixos starter config";
      welcomeText = ''
        Welcome to NixOS...
        We swear it isn't a cult!
      '';
    };
  };
}
