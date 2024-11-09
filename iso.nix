{ config, pkgs, modulesPath, ... }:
let
  secrets = import ./secrets.nix;
in
{
  imports = [
	(modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
  ];

  environment.systemPackages = with pkgs; [
  	neovim git git-crypt screen iw usbutils busybox rsync
  ];

  boot.extraModulePackages = with config.boot.kernelPackages; [
    rtl8821au
  ];

  # Networking
  networking = {
  	useDHCP = true;

  	# Wifi
  	wireless = {
	  enable = true;
	  networks = secrets.networks;
	};
  };

  environment.etc."nixos-conf".source = ./.;

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
}

