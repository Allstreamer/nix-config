{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem { 
      # Pass modules down to configuration.nix
      specialArgs = {inherit inputs;};
      modules = [
        { nix.settings.experimental-features = [ "nix-command" "flakes" ]; }
        ./configuration.nix
	inputs.home-manager.nixosModules.default
      ];
    };
  };
}
