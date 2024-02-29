{ ... }:
let secrets = import ../../../secrets.nix;
in {
  programs.ssh = {
    enable = true;
    matchBlocks = secrets.ssh.hosts;

    extraOptionOverrides = {
      AddKeysToAgent = "yes";
      ForwardAgent = "yes";
    };

    forwardAgent = true;
    extraConfig = ''User = ${secrets.ssh.user}'';
  };
}
