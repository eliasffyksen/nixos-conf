{ pkgs, ... }:
let
  secrets = import ./secrets.nix;
in
{
  systemd.services.uomvpn = {
    description = "UoM VPN Service";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];
    script = "echo '${secrets.uomPwd}' | ${pkgs.openconnect}/bin/openconnect --protocol=gp vpnconnect-standard.manchester.ac.uk --user '${secrets.uomUser}' --passwd-on-stdin";
  };
}
