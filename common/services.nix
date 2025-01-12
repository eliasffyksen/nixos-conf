{ pkgs, ... }:
let
  secrets = import ./secrets.nix;
in
{
  systemd.services.uomvpn = {
    description = "UoM VPN Service";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    enable = false;
    path = [ pkgs.openconnect pkgs.nettools pkgs.gawk ];
    script = "echo '${secrets.uomPwd}' | openconnect --protocol=gp vpnconnect-standard.manchester.ac.uk --user '${secrets.uomUser}' --passwd-on-stdin";
    serviceConfig = {
      Restart = "always";
      RestartSec = 60;
    };
  };

  services = {
    openvpn.servers = {
      netcraft = {
        config = '' config /ovpn/netcraft/netcraft.ovpn '';
        autoStart = false;
      };
    };

    atd.enable = true;


    # SSHD
    sshd.enable = true;

    # Desktop environment
    displayManager.defaultSession = "dwm-eff";
    xserver = {
      enable = true;
      xkb.layout = "us";

      displayManager.lightdm.enable = true;

      desktopManager.dwm-eff = {
        enable = true;
        extraStartupCommands = "~/.screenlayout/default.sh";
      };
    };
  };
}
