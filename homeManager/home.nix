{pkgs, ...}: {
  home = {
    username = "$USER";
    homeDirectory = "$HOME";
    stateVersion = "23.11";
    packages = [
      pkgs.hello
    ];
  };

  programs.home-manager.enable = true;
}
