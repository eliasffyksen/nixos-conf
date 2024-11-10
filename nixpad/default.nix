
{ config, pkgs, ... }:
{
  networking.hostName = "nixtop";

  imports = [
    ./hardware.nix
    ../common/config.nix
  ];
}

