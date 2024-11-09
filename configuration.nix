
{ config, pkgs, ... }:

let
  secrets = import ./secrets.nix;
in
{
  imports =
    [
      ./hardware-configuration.nix
      ./packages.nix
      ./users.nix
      ./services.nix
    ];

  # Boot options
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.extraModulePackages = with config.boot.kernelPackages; [
	rtl8821au
  ];
  hardware.bluetooth.enable = true;

  # Machine options
  networking.hostName = "nixpad";
  time.timeZone = "Europe/London";

  # Package dependency managment
  nixpkgs.config.allowUnfree = true;
  nix.package = pkgs.nixUnstable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Networking
  networking.useDHCP = true;

  # Wifi
  networking.wireless.enable = true;
  networking.wireless.networks = secrets.networks;
  networking.wireless.interfaces = [ "wlp0s20f3" ];

  # Firewall configuration
  networking.firewall.enable = false;
  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.firewall.allowedUDPPorts = [ ];
  # networking.extraHosts = '' 2a01:4b00:e60c:fe00:eaf4:8ff:fe14:b293 dextop '';

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # SSHD
  services.sshd.enable = true;

  # Desktop environment
  services.xserver = {
    enable = true;
    layout = "us";

    displayManager = {
      defaultSession = "dwm-eff";
      lightdm.enable = true;
    };

    desktopManager.dwm-eff.enable = true;
  };

  services.picom = {
    enable = false;
    backend = "glx";
    inactiveOpacity = 0.5;
    settings = {
      corner-radius = 10.0;
      detect-rounded-corners = true;
    };
  };

  # System state version
  # (!!!NB: READ NixOS MANUAL BEFORE MESSING WITH THIS!!!)
  system.stateVersion = "20.09";
}

