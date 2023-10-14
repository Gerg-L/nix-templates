{pkgs, lib, ...}: {
  home = {
    # Set these two correctly
    username = "USER";
    homeDirectory = "/home/HOME";
    stateVersion = "23.11";
    packages = [
      # Add other packages here
      pkgs.hello
    ];
  };

  nixpkgs.config = {
  /*
    # Allow unfree packages individually by name
    allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        "hello-unfree"
      ];
    # or allow all unfree packages
    allowUnfree = true;
   */
  };

  # Allow home-manager to manage itself
  programs.home-manager.enable = true;
}
