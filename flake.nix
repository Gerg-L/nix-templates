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
  };
}
