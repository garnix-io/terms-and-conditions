{
  description = "A very basic flake";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  inputs.systems.url = "github:nix-systems/default";

  outputs = { self, nixpkgs, systems }:
    let
      eachSystem = nixpkgs.lib.genAttrs (import systems);
    in
    {
      packages = eachSystem
        (system:
          {
            default =
              let pkgs = nixpkgs.legacyPackages.${system};
              in pkgs.runCommand "terms.md" {}
                  ''
                    cp ${./terms.md} $out
                  '';
          });

      checks = eachSystem (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          vale = pkgs.runCommand "vale-check" { } ''
            cd ${./.}
            ${pkgs.vale}/bin/vale terms.md
            mkdir $out
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
            ];
          };
        });
    };
}
