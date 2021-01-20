
{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];


  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixpad"; # Define your hostname.

  time.timeZone = "Europe/London";

  networking.useDHCP = false;
  # networking.interfaces.enp0s31f6.useDHCP = true;
  # networking.interfaces.ens12u1u4.useDHCP = true;
  networking.interfaces.wlp0s20f3.useDHCP = true;
  networking.networkmanager.enable = true;

  # Wifi
  #
  # networking.wireless.enable = true;
  # networking.wireless.networks = {
  #   Glide0198626-5G = {
  #     psk = "";
  #   };
  # };

  fonts.fonts = with pkgs;
  [ font-awesome source-code-pro ];

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  home-manager = {
    useGlobalPkgs = true;
    users.elias = (import ./home/elias);
  };
  users.users.elias = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" ];
    createHome = true;
    home = "/home/elias";
    shell = pkgs.fish;
  };

  # List packages installed in system profile. To search, run:
  nixpkgs.config.allowUnfree = true;
  nix.package = pkgs.nixUnstable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  environment.systemPackages = with pkgs; [
    wget curl gnupg git ncdu gotop htop tree killall

    clang lldb
    gnumake gcc gdb
    ghc cabal-install

    ranger termite firefox spotify discord pavucontrol
    i3status gimp
    mako libnotify
  ];
  programs.sway.enable = true;
  programs.fish.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ ];
  networking.firewall.allowedUDPPorts = [ ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}

