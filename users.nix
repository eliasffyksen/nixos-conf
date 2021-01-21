{ pkgs, ... }:

{
  # User configuration
  users.users = {
    elias = {
      isNormalUser = true;
      extraGroups = [ "wheel" "audio" "docker" ];
      createHome = true;
      home = "/home/elias";
      shell = pkgs.fish;
    };
  };

  # Tmp downloads folder
  fileSystems."/home/elias/Downloads" = {
    fsType = "tmpfs";
  };

  # Home Manager
  home-manager = {
    useGlobalPkgs = true;
    users = {
      elias = (import ./home/elias);
    };
  };
}
