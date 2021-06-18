
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
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];


  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # System state version
  # (!!!NB: READ NixOS MANUAL BEFORE MESSING WITH THIS!!!)
  system.stateVersion = "20.09";
}

