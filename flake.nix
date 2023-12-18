{
  description = "Neovim config based on LazyVim";
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
            clippy
          ];
        };
        formatter = pkgs.nixpkgs-fmt;
      }
    );
}
