{
  description = "Neovim config";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            stylua
            nodejs_21
            rustc
            cargo
            dotnet-sdk_8
            go
          ];
        };
        formatter = pkgs.nixpkgs-fmt;
      }
    );
}
