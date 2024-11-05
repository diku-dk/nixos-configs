# Configuration for a machine in the PLTC
# server room lab.

{ config, pkgs, ... }:

{
  imports =
    [ 
       /etc/nixos/hardware-configuration.nix
    ];

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
          name = "infoscreen";
          user = "autossh";
        }
      ];
    };

    xserver = {
      enable = false;
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
        extraGroups = [ "wheel" ];
        openssh.authorizedKeys.keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA4FAeTJKuTHjKnr2ReiaJDbBxwdTYH6M7FWTzWv0MEXsfpny9Sf0HuDOYjVFxw0kLrdlGG+HwYT1j7ReZHhTYN0cRmYsyA12iVZl3nEvdZAB1b+O7KCnJ0dXnWGRJYJQ5GLXZWCyrVGIAPiDehjnwWVDb95RhyaDcH15SseurrOmRIlrPYA4MuAhg5YwBYOPNHP3ZOPVDHXDCh852QYl00IdztD6IlqbScem8+r36Ik9XnWESdWIbEhVPg/53u7nKjH7ksRa+uX0VBaHqZ0h30l45vjA+mXE/rCnBh28kjJ88HEvXELQfkZf+KctoM8MiHUvP3jFRqICofaEXGK1LCw=="
        ];
      };
      autossh.isNormalUser = true;
    };
  };

  environment = {
    systemPackages = with pkgs; [
      neovim
      git
      htop
      (python3.withPackages (pypkgs: with pypkgs; [
        pyyaml
	pip
	requests
      ]))
      tmux
      toilet
      mosml
      emacs
      ed
      stow
    ];

    variables = {
      EDITOR = "ed";
    };

    homeBinInPath = true;

    localBinInPath = true;
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

