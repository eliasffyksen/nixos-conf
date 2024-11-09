{
  inputs = {
    stable.url = "github:NixOS/nixpkgs/nixos-23.11";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:rycee/home-manager/release-23.11";
      inputs.nixpkgs.follows = "stable";
    };
    dwm-eff = {
      url = "path:/home/elias/projects/dwm-eff";
      inputs.nixpkgs.follows = "stable";
    };
  };

  outputs = inputs: let
    system = "x86_64-linux";
    overlays = [
      (final: prev: {
        unstable = import inputs.unstable {
          inherit system;
          config.allowUnfree = true;
        };
      })
    ];
  in {
    nixosConfigurations = {
      nixpad = inputs.stable.lib.nixosSystem {
        inherit system;
        modules = [
          { nixpkgs = { inherit overlays; }; }
          inputs.home-manager.nixosModules.home-manager
          inputs.dwm-eff.nixosModules.dwm-eff
          ./configuration.nix
        ];
        specialArgs = { inherit inputs; };
      };
    };

	iso = inputs.stable.lib.nixosSystem {
	  inherit system;
	  modules = [
        ./iso.nix
	  ];
	};
  };
}
