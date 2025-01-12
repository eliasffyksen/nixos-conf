{ config, pkgs, modulesPath, ... }:
let
  secrets = import ./secrets.nix;
in
{
  imports = [
	(modulesPath + "/installer/cd-dvd/installation-cd-minimal.nix")
	./common/minimal.nix
  ];

  environment.etc."nixos-conf".source = ./.;
}

