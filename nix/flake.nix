{
  description = "My dotfiles";

  inputs = {
    # M2 MacBook Air / NixOS
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # MacBook Air 2012 / Catalina
    nixpkgs-catalina.url = "github:NixOS/nixpkgs/nixos-24.11";

    nix-darwin-catalina = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs-catalina";
    };

    home-manager-catalina = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs-catalina";
    };
  };

  outputs = {
    nixpkgs,
    nix-darwin,
    home-manager,
    nix-darwin-catalina,
    home-manager-catalina,
    ...
  }: {
    darwinConfigurations = {

      # MacBook Air M2
      macbook-air = nix-darwin.lib.darwinSystem {
        modules = [
          ./nix-darwin/configuration.nix

          home-manager.darwinModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.soma = {
              imports = [
                ./home-manager/hosts/macbook-air.nix
              ];
            };
          }
        ];
      };

      # MacBook Air 2012
      macbook-air-2012 =
        nix-darwin-catalina.lib.darwinSystem {
          system = "x86_64-darwin";

          modules = [
            ./nix-darwin/configuration-2012.nix

            home-manager-catalina.darwinModules.home-manager

            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.soma = {
                imports = [
                  ./home-manager/hosts/macbook-air-2012.nix
                ];
              };
            }
          ];
        };
    };

    # ThinkPad T480s / NixOS
    nixosConfigurations.nixos =
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./nixos/configuration.nix

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.soma = {
              imports = [
                ./home-manager/hosts/thinkpad-t480s.nix
              ];
            };
          }
        ];
      };
  };
}
