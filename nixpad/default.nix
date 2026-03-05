
{ config, pkgs, ... }:
{
  networking.hostName = "nixpad";

  imports = [
    ./hardware.nix
    ../common/config.nix
  ];

  services.xserver.xkb.layout = "gb";
  console.keyMap = "uk";
}

