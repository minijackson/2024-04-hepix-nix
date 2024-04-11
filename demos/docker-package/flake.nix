{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

  outputs = {
    self,
    nixpkgs,
  }: let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in {
    packages.x86_64-linux.default = pkgs.stdenv.mkDerivation {
      pname = "production-grade-hello-hepix";
      version = "1.0.0";

      src = ./.;

      nativeBuildInputs = [
        pkgs.meson
        pkgs.ninja
        pkgs.pkg-config
      ];

      buildInputs = [
        pkgs.boost
      ];

      env = {
        BOOST_INCLUDEDIR = "${pkgs.lib.getDev pkgs.boost}/include";
        BOOST_LIBRARYDIR = "${pkgs.lib.getLib pkgs.boost}/lib";
      };

      doCheck = true;
    };

    packages.x86_64-linux.dockerImage = pkgs.dockerTools.buildLayeredImage {
      name = "production-grade-hello-hepix";
      tag = "latest";
      config.Cmd = ["${self.packages.x86_64-linux.default}/bin/production-grade-hello-hepix"];
    };
  };
}
