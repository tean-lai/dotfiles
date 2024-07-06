{
    description = "My Home Manager Flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {nixpkgs, home-manager, ...}: {
        defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;

        homeConfigurations = {
            "tean" = home-manager.lib.homeManagerConfiguration {
                pkgs = import nixpkgs { system = "aarch64-darwin"; };
                modules = [ ./home.nix ]; # Defined later
            };
        };
    };
}
