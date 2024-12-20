{ config, pkgs, lib, ... }:

let us = import ./users.nix;
in
{
  users = {
    defaultUserShell = pkgs.zsh;
    users = us //  { autossh = {
                       isNormalUser = true;
                       createHome = true;
                     };
                   };
    motd =
      ''
        ___  <-<-- \_/\
      _     <- <-- . . \
        __   <---_  U  |   Welcome to the PLTC Raspberry Pi!
           __   /--  ___/
                  |   /
                   ===
                 ==   =
                 =   =
                  ===
      '';
  };

  nix = {
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    allowedUsers = [ "@wheel" ];
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  security = {
    sudo.execWheelOnly = true;
    sudo.wheelNeedsPassword = false;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_rpi4;
    tmpOnTmpfs = true;
    initrd.availableKernelModules = [ "usbhid" "usb_storage" ];
    kernelParams = [
        "8250.nr_uarts=1"
        "console=ttyAMA0,115200"
        "console=tty1"
        "cma=128M"
    ];

    loader = {
      raspberryPi = {
        enable = true;
        version = 4;
      };
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  powerManagement.cpuFreqGovernor = "ondemand";

  hardware.enableRedistributableFirmware = true;

  networking = {
    hostName = "pltc-pi";
    extraHosts = "45.76.37.241 abc\n107.189.30.63 nixvps\n";
  };

  time.timeZone = "Europe/Copenhagen";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  services = {
    xserver = {
      enable = true;
      displayManager = {
        startx.enable = true;
        defaultSession = "infoscreen";
        session = [
          { manage = "desktop";
            name = "infoscreen";
            start = ''exec $HOME/.xsession'';
          }
        ];
        autoLogin = {
          enable = true;
          user = "infoscreen";
        };
        lightdm = {
          enable = true;
        };
      };
    };

    openssh = {
      enable = true;
      challengeResponseAuthentication = false;
      passwordAuthentication = false;
      extraConfig = ''
        StreamLocalBindUnlink yes
        ClientAliveInterval 20
        ClientAliveCountMax 6
        TCPKeepAlive yes
      '';
    };

    autossh = {
      sessions = [
        { extraArguments = "-N -R 9724:localhost:22 autossh@abc";
          monitoringPort = 0;
          name = "pltc-pi";
          user = "autossh";
        }
        { extraArguments = "-N -R 9725:localhost:22 autossh@nixvps";
          monitoringPort = 0;
          name = "pltc-pi-nixvps";
          user = "autossh";
        }
      ];
    };

    cron = {
      enable = true;
      systemCronJobs = [
        "0 4 * * *  zfnmxt  add-everyone >/dev/null 2>&1"
      ];
    };
  };

  environment = {
    systemPackages = with pkgs; [
      neovim
      git
      python3
      (haskellPackages.callPackage ./add-everyone/default.nix {})
      matchbox
      xdotool
      tmux
      toilet
      lxterminal
      surf
      feh
      youtube-dl
    ];

    shellAliases = { vim = "nvim"; };

    variables = {
      EDITOR = "nvim";
    };
  };

  programs = {
    tmux = {
      enable = true;
      keyMode = "vi";
      shortcut = "a";
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting = {
        enable = true;
        highlighters = [ "main" "brackets"];
      };
      ohMyZsh = {
        enable = true;
        plugins = [ "git" ];
        theme = "fishy";
      };
    };
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

  system.stateVersion = "21.05";
}
