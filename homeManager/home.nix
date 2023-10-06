{pkgs, ...}: {
  home = {
    # Set these two correctly
    username = "$USER";
    homeDirectory = "$HOME";
    stateVersion = "23.11";
    packages = [
      # Add other packages here
      pkgs.hello
    ];
  };

  programs.home-manager.enable = true;
}
