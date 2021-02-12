{ pkgs, ... }:
{
  systemd.services.uomvpn = {
    description = "UoM VPN Service";
    after = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      ExecStart = "/bin/sh /home/elias/bin/uomvpn.sh ${pkgs.openconnect}/bin/openconnect";
      Type = "simple";
      Restart = "always";
      RestartSec = 15;
    };
  };
}
