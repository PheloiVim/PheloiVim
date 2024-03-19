{
  description = "My Neovim configuration, built on top of the LazyVim";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        packages = with pkgs; [
          dotnet-sdk_8
          fish
          nodejs_21
          go
          lua
        ];
      in {
        devShell = pkgs.mkShell {
          buildInputs = packages;
          shellHook = ''
            exec fish
          '';
        };
        formatter = pkgs.alejandra;
      }
    );
}
