{
  outputs = _: {
    templates = {
      simpleDevShell = {
        path = ./simpleDevShell;
        description = "As simple as devShell's get";
        welcomeText = ''
          If you haven't already install direnv!
        '';
      };
    };
    singlePackage = {
      path = ./simplePackage;
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
    homeManager = {
      path = ./homeManager;
      description = "meh";
      welcomeText = ''
        homeManager bad, or maybe I'm just salty
      '';
    };
  };
}
