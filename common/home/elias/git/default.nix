{ ... }:
let secrets = import ../../../secrets.nix;
in {
  programs.git = {
    enable = true;

    userName = "Elias F. Fyksen";
    userEmail = secrets.git.email;
    # signing = { key = "EAD9B5F4AD7E77A5A102960EF2E270D97C651437"; signByDefault = true; };

    aliases = {
      lg = "!\"git lg1\"";
      lg1 = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
      lg2 = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(bold yellow)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all";
    };

    extraConfig = {
      pull.rebase = true;
      core.autocrlf = "input";
      init.defaultBranch = "main";
    };
  
    lfs.enable = true;
  };
}
