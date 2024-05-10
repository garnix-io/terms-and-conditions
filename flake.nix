{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  inputs.systems.url = "github:nix-systems/default";

  outputs = { self, nixpkgs, systems }:
  let
    eachSystem = nixpkgs.lib.genAttrs (import systems);
  in
  {

    checks = eachSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        vale = pkgs.runCommand "vale-check" {} ''
          ${pkgs.vale}/bin/vale terms.md
        '';
      });
    devShells = eachSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        default = pkgs.mkShell {
          buildInputs = [
            pkgs.vale
            pkgs.ghostwriter
        ];};
      });
  };
}
