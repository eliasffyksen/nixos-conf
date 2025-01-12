{ ... }:
let secrets = import ../../../secrets.nix;
in {
  programs.ssh = {
    enable = true;
    matchBlocks = secrets.ssh.hosts;
  };
}
