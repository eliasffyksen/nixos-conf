{
  inputs = {
    stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:rycee/home-manager/release-25.05";
      inputs.nixpkgs.follows = "stable";
    };
    claude-code.url = "github:sadjow/claude-code-nix";
    dwm-eff = {
      url = "github:eliasffyksen/dwm-eff/eff/unstable";
      inputs.nixpkgs.follows = "stable";
    };
    nvim-conf = {
      url = "github:eliasffyksen/nvim-conf";
      flake = false;
    };
  };

  outputs = inputs: let
    system = "x86_64-linux";

    overlays = [ inputs.claude-code.overlays.default ];

    buildConfig = hostDir : inputs.stable.lib.nixosSystem {
      inherit system;


      modules = [
        inputs.home-manager.nixosModules.home-manager
		{
	      home-manager.extraSpecialArgs = {
            inherit (inputs) nvim-conf;
          };
		}
        inputs.dwm-eff.nixosModules.dwm-eff
        { nixpkgs = {
		  inherit overlays;

		  config = {
		  	allowUnfree = true;
			cudaSupport = false;
		  };
		}; }
       	hostDir
      ];
      specialArgs = { inherit inputs; };
    };

  in {
    nixosConfigurations = {
      nixtop = buildConfig ./nixtop;
      nixpad = buildConfig ./nixpad;
    };

    iso = inputs.stable.lib.nixosSystem {
      inherit system;
      modules = [ ./iso.nix ];
    };
  };
}
