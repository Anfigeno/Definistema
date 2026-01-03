{
  description = "El sistema definitivo definitorio";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    mestizo-nix.url = "github:TemaMestizo/MestizoNix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      mestizo-nix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };

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
                pkgs
                inputs
                maquina
                usuario
                ;
            };
            modules = [
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
