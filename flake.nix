{
  description = "Setup packages for neovim-config";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in {
          devShell = pkgs.mkShell {
            buildInputs = [
              pkgs.stylua
            ];
          };
          formatter = pkgs.nixpkgs-fmt;
        }
      );
}
