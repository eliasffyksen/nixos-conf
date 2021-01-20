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

  # Home Manager
  home-manager = {
    useGlobalPkgs = true;
    users = {
      elias = (import ./home/elias);
    };
  };
}
