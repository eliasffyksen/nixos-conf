{ pkgs, ... }:
let
  secrets = import ./secrets.nix;
in
{
  systemd.services.uomvpn = {
    description = "UoM VPN Service";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.openconnect pkgs.nettools pkgs.gawk ];
    script = "echo '${secrets.uomPwd}' | openconnect --protocol=gp vpnconnect-standard.manchester.ac.uk --user '${secrets.uomUser}' --passwd-on-stdin";
    serviceConfig = {
      Restart = "always";
      RestartSec = 60;
    };
  };
}
