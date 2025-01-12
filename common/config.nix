
{ config, pkgs, ... }:
let
  secrets = import ./secrets.nix;
in
{
  imports = [
    ./minimal.nix
    ./packages.nix
    ./users.nix
    ./services.nix
  ];

  # Boot options
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Bluetooth
  hardware.bluetooth.enable = true;

  # System state version
  # (!!!NB: READ NixOS MANUAL BEFORE MESSING WITH THIS!!!)
  system.stateVersion = "20.09";
}

