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
  };
}
