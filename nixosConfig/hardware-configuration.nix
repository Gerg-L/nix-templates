{
  fileSystems."/".label = "x";

  assertions = [
    {
      assertion = false;
      message = ''
        You have not updated your hardware-configuration.nix
        please run "nixos-generate-config --show-hardware-config > /this/dir/hardware-configuration.nix"
      '';
    }
  ];
}
