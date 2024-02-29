{
  outputs = _: {
    templates = {
      devShell = {
        path = ./devShell;
        description = "";
      };
      package = {
        path = ./package;
        description = "";
      };
      nixosConfig = {
        path = ./nixosConfig;
        description = "";
      };
    };
  };
}
