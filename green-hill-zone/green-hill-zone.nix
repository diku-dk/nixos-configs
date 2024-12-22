# Configuration for a machine in the PLTC server room lab.

{ config, pkgs, lib, modulesPath, ... }:

let universalPackages = (import ./../universal-packages.nix { pkgs = pkgs; });
in
{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "nvme" "usb_storage" "usbhid" "sd_mod" "rtsx_usb_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/ed5a06b2-7c2e-4cb0-b214-db092163286e";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/628E-C2C6";
      fsType = "vfat";
      options = [ "fmask=0077" "dmask=0077" ];
    };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  hardware.nvidia.open = false;
  hardware.graphics.enable = true;
  hardware.graphics.extraPackages = [
  ];
  environment.sessionVariables = {
    LD_LIBRARY_PATH = "/run/opengl-driver/lib";
    CUDA_PATH = "${pkgs.cudaPackages.cuda_cudart}";
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    hostName = "green-hill-zone";
    networkmanager.enable = true;
  };

  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "C.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    settings = {
      auto-optimise-store = true;
      allowed-users = [ "@wheel" ];
      trusted-users = [ "root" "athas" ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  security = {
    sudo.execWheelOnly = true;
    sudo.wheelNeedsPassword = false;
  };

  services = {
    autossh = {
      sessions = [
        { extraArguments = "-N -R 9743:localhost:22 autossh@sigkill.dk";
          monitoringPort = 0;
          name = "backdoor";
          user = "autossh";
        }
      ];
    };

    xserver = {
      enable = false;
      videoDrivers = [ "nvidia" ];
    };

    openssh = {
      enable = true;
      settings.KbdInteractiveAuthentication = false;
      settings.PasswordAuthentication = true;
      extraConfig = ''
        StreamLocalBindUnlink yes
        ClientAliveInterval 20
        ClientAliveCountMax 6
        TCPKeepAlive yes
      '';
    };

  };

  users = {
    users =  {
      athas = {
        isNormalUser = true;
        extraGroups = [ "wheel" "docker" ];
        openssh.authorizedKeys.keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA4FAeTJKuTHjKnr2ReiaJDbBxwdTYH6M7FWTzWv0MEXsfpny9Sf0HuDOYjVFxw0kLrdlGG+HwYT1j7ReZHhTYN0cRmYsyA12iVZl3nEvdZAB1b+O7KCnJ0dXnWGRJYJQ5GLXZWCyrVGIAPiDehjnwWVDb95RhyaDcH15SseurrOmRIlrPYA4MuAhg5YwBYOPNHP3ZOPVDHXDCh852QYl00IdztD6IlqbScem8+r36Ik9XnWESdWIbEhVPg/53u7nKjH7ksRa+uX0VBaHqZ0h30l45vjA+mXE/rCnBh28kjJ88HEvXELQfkZf+KctoM8MiHUvP3jFRqICofaEXGK1LCw=="
        ];
      };
      autossh.isNormalUser = true;
    };
  };

  environment = {
    systemPackages =
      universalPackages ++
      (with pkgs; [
        cudatoolkit
      ]);

    variables = {
      EDITOR = "ed";
    };

    homeBinInPath = true;

    localBinInPath = true;
  };

  # Virtualisation setup.
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  programs = {
    ssh = {
      extraConfig = ''
        Host *
          TCPKeepAlive yes
          ExitOnForwardFailure yes
          ServerAliveCountMax 6
          ServerAliveInterval 20
          StreamLocalBindUnlink yes
      '';
    };
  };
  system.stateVersion = "24.05";
}

