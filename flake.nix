{
  description = "El sistema definitivo definitorio";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-inestable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mestizo-nix = {
      url = "github:TemaMestizo/MestizoNix/dev";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fondos-de-pantalla.url = "github:Anfigeno/Fondos-de-pantalla";

    mestizo256nix = {
      url = "github:TemaMestizo/Mestizo256Nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-inestable,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ inputs.firefox-addons.overlays.default ];
      };
      pkgs-unstable = import nixpkgs-inestable {
        inherit system;
        config.allowUnfree = true;
      };
      lib = pkgs.lib;
      util = import ./util.nix { inherit pkgs lib; };

      usuario = "anfitrion";
      maquinas = [
        "probas"
        "l470"
        "h81m"
      ];
      perfiles = [
        "Productividad"
        "Defecto"
        "Procrastinación"
        "Investigación"
      ];
    in
    {
      nixosConfigurations =
        maquinas
        |> map (maquina: {
          name = maquina;
          value = nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit
                inputs
                maquina
                usuario
                util
                lib
                perfiles
                pkgs-unstable
                ;
            };
            modules = [
              {
                nixpkgs.pkgs = pkgs;
                nix.settings.download-buffer-size = 524288000;
              }
              home-manager.nixosModules.home-manager
              ./maquinas/configuracionPorDefecto.nix
            ];
          };
        })
        |> builtins.listToAttrs;

      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          nixfmt
          nil
          nixd
          lua-language-server
          stylua
        ];
      };
    };
}
