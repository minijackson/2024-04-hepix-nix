#import "@preview/polylux:0.3.1": *
#import "@preview/pinit:0.1.3": *

#import "./theme.typ": *

#show: cea-theme

#pdfpc.config(duration-minutes: 20)

#title-slide(
	title: [
		Packaging and system administration\
		with Nix and NixOS
	],
	author: [Rémi NICOLE],
)

#slide[
	== Inspiration

	#v(2em)
	Matthiew Croughan, and his SCaLE talks
]

#section-slide[= Convincing you]

#slide[
	== The buzzwords slide

	- Infrastructure as code
	- Reproducibility
	- Software supply chain security
	- Software Bill of Materials (SBOM)
]

#slide(figure(image("map_repo_size_fresh.svg", height: 100%)))
#slide(align(horizon, figure(image("tweet.png", height: 70%))))

#section-slide[= Concepts]

#slide[
	== Definitions

	#terms-one-by-one(
		separator: [~---~],
		mode: "transparent",
	)[/ Nix: the package manager][/ Nix: the programming language][/ Nixpkgs: the Repository][/ NixOS: the Linux Distribution]
]

#slide[
	== How it works

	#enum-one-by-one(mode: "transparent")[
		Evaluate the Nix code → Package
	][
		Fetch / Compile dependencies
	][
		Fetch / Build the package in a sandbox
	][
		Scan the output for runtime dependencies
	]

	#v(1em)

	#uncover(5)[
		Each package is installed in its own directory

		`/nix/store/{hash}-coreutils-full-9.3/`
	]
]

#section-slide[= Demos]

#section-slide(background: colors.glycine)[== Nix]
#section-slide(background: colors.archipel)[=== Reproducible dev env]
#section-slide(background: colors.archipel)[=== Reproducible packages]
#section-slide(background: colors.archipel)[=== On Debian?]
#section-slide(background: colors.archipel)[=== Reproducible Docker images]

#section-slide(background: colors.glycine)[== NixOS]
#section-slide(background: colors.archipel)[=== Declarative configuration]
#section-slide(background: colors.archipel)[=== Build Docker images and more]
#section-slide(background: colors.archipel)[=== Build VMs]
#section-slide(background: colors.archipel)[=== Rollbacks]
#section-slide(background: colors.archipel)[=== Offline machines]
#section-slide(background: colors.archipel)[
	=== NixOS tests

	Cool VM tests:

	- Test of openarena
	- Test of transmission
]

#section-slide[= Software supply chain]

#section-slide(background: colors.glycine)[== Nice projects]
#section-slide(background: colors.archipel)[=== PPC64BE-ELFv2 netboot image, all in RAM]

// vim: filetype=typst
