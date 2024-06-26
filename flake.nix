{
  description = "Convention de nommage TITAN";

  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: {
    devShells.x86_64-linux.default = let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
      pkgs.mkShell {
        packages = with pkgs; [typst];

        env.TYPST_FONT_PATHS = "${pkgs.libertinus}/share/fonts/opentype:${pkgs.fira-code}/share/fonts/truetype";
      };
  };
}
