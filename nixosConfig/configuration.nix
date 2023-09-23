{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    # inputs.self.nixosModules.example

    # Or modules from other flakes (such as nixos-hardware):
    # inputs.hardware.nixosModules.common-cpu-amd
    # inputs.hardware.nixosModules.common-ssd

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    # Import your hardware configuration
    ./hardware-configuration.nix
  ];

  ## Misc
  # Set your time zone.
  time.timeZone = "America/New_York";

  ## Users
  users.users = {
    # Replace with your username
    your-username = {
      # You can set an initial password for your user.
      # If you do, you can skip setting a root password by passing '--no-root-passwd' to nixos-install.
      # Be sure to change it (using passwd) after rebooting!
      initialPassword = "nixos";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # Add your SSH public key(s) here, if you plan on using SSH to connect to this user
      ];
      # Be sure to add any other groups you need (such as audio, docker, etc)
      extraGroups = ["wheel" "networkmanager"];
    };
  };

  ## SSH
  services.openssh = {
    enable = true;
    settings = {
      # Allow only key based ssh access
      PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  ## nixpkgs
  nixpkgs = {
    #The system to build this configuration for
    hostPlatform = "x86_64-linux";
    config.allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) [
        # Add unfree packages you would like to allow here.
        # for example:
        "hello-unfree"
      ];
  };

  ## Networking
  networking = {
    # Set this systems hostname
    hostName = "hostname";
    # NetworkManager is the easiest there is multiple other options
    networkmanager.enable = true;
    useDHCP = false;
  };

  ## Sound
  # This is badly named and is only for ALSA
  sound.enable = lib.mkForce false;
  # We don't need pulseaudio because pipewire has a emulated version
  hardware.pulseaudio.enable = lib.mkForce false;
  security.rtkit.enable = true;
  # Enable and configure pipewire
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    # Optional jack support
    #jack.enable = true;
  };

  hardware = {
    # Your system will likely be un-bootable without this
    enableRedistributableFirmware = true;
    # Uncomment one of these depending on your CPU
    #cpu.intel.updateMicrocode = true;
    #cpu.amd.updateMicrocode = true;
  };

  ## Boot
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  ## Nix settings
  nix = {
    # Pin nixpkgs in the flake registry and $NIX_PATH to your system flakes nixpkgs
    nixPath = ["nixpkgs=flake:nixpkgs"];
    registry.nixpkgs.flake = inputs.nixpkgs;

    settings = {
      # Ignore global registry
      flake-registry = "";

      # Enable flakes and the "nix" command
      experimental-features = [
        "flakes"
        "nix-command"
      ];

      # Reduce disk usage
      auto-optimise-store = true;
    };
  };

  ## Environment
  environment = {
    # Backup the currently active configuration in /etc/current-config
    etc."current-config".source = inputs.self.outPath;
    # Remove all default packges
    defaultPackages = lib.mkForce [];
    # Add packages system-wide
    systemPackages = [
      #make sure you have a editor!
      pkgs.nano
    ];
    variables = {
      # Change to your preferred editor
      EDITOR = "nano";
      VISUAL = "nano";
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
