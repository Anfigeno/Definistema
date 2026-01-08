{
  description = "El sistema definitivo definitorio";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
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
  };

  outputs =
    {
      self,
      nixpkgs,
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

      usuario = "anfitrion";
      maquinas = [
        "probas"
        "l470"
        "h81m"
      ];
    in
    {
      nixosConfigurations = builtins.listToAttrs (
        map (maquina: {
          name = maquina;
          value = nixpkgs.lib.nixosSystem {
            specialArgs = {
              inherit
                inputs
                maquina
                usuario
                ;
            };
            modules = [
              { nixpkgs.pkgs = pkgs; }
              home-manager.nixosModules.home-manager
              ./maquinas/configuracionPorDefecto.nix
            ];
          };
        }) maquinas
      );

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
