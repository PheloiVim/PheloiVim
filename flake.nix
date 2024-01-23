{
  description = "Neovim config";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        packages = with pkgs; [
          stylua
          nodejs_21
          dotnet-sdk_8
          go
          rustup
        ];
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = packages;
        };
        formatter = pkgs.nixpkgs-fmt;
      }
    );
}
