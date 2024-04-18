#import "@preview/polylux:0.3.1": *
#import "@preview/pinit:0.1.3": *
#import "@preview/tiaoma:0.2.0": qrcode

#import "./theme.typ": *

#show: cea-theme

#pdfpc.config(duration-minutes: 20)

#title-slide(
	title: [
		Packaging and system administration\
		with Nix and NixOS
	],
	author: [Rémi NICOLE],
	subtitle: [CEA/DRF/IRFU/DIS/LDISC],
)

#slide[
	== Inspiration

	#v(2em)
	Matthiew Croughan, and his SCaLE talks
]

#let slides = "https://github.com/minijackson/2024-04-hepix-nix"

#slide[
	== Demos?

	They are here:#footnote(link(slides))

	You need to install Nix on your machine to run them.

	#qrcode(slides, options: (scale: 3.0))
]

#let install-flakes = "https://wiki.nixos.org/wiki/Flakes#Other_Distros,_without_Home-Manager"

#slide[
	== Note on experimental features

	They simplify my life,
	they are _not_ needed.

	If you want to test the demos,
	enable the `flakes` experimental feature#footnote(link(install-flakes))

	#qrcode(install-flakes, options: (scale: 3.0))
]

#section-slide[= Convincing you]

#slide[
	== The buzzwords slide

	- Infrastructure as code (part of it)
	- Reproducibility
	- Software supply chain security (SLSA)
	- Software Bill of Materials (SBOM)
]

#slide(figure(image("map_repo_size_fresh.svg", height: 100%)))
#slide(align(horizon, figure(image("tweet.png", height: 70%))))
#slide(align(horizon, figure(image("standards.png", height: 40%), caption: [xkcd \#97 --- Standards])))

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

#slide[
	== Nix

	- Reproducible dev env // 1 min
	- Reproducible packages // 2 min
	- On Debian // 1 min
	- Reproducible Docker images // 2 min
]

// -> 6 min

#slide[
	== NixOS

	- Declarative configuration // 1 min
	- Rollbacks // 1 min
	- Build VMs // 2 min
	- Build Docker images and more // 1 min
	- Offline machines // 2 min
]

#slide[
	== NixOS tests

	Cool VM tests:

	- Test of OpenArena
	- BitTorrent test
] // 3 min

// -> 10 min

#section-slide[= Software supply chain]

#slide[
	== Advantages of Nix/NixOS

	- Know all your dependencies
	- Know all your _build_ dependencies
	- Know metadata of all your dependencies
		- Licenses
		- Source provenance
	- SLSA level 4 "for free"
	- Fetch the source and patches of all your dependencies
	- Reproducible (science!)
	- Cache everything
	- Mix and match old / new software
]

#slide[
	== Nice projects

	- nixos-hardware#footnote[https://github.com/NixOS/nixos-hardware]
	- EPNix: EPICS + Nix#footnote[https://github.com/epics-extensions/EPNix/]
	- PPC64BE-ELFv2 network boot images, all in RAM
	- robotnix: Building Android images#footnote[https://github.com/danielfullmer/robotnix]
	- nix-darwin#footnote[https://github.com/LnL7/nix-darwin]
]

#slide[
	== More reading

	- Nix The Planet - SCaLE 21x --- Matthew Croughan#footnote[https://www.youtube.com/watch?v=6Le0IbPRzOE]
	- What Nix Can Do (Docker Can't) - SCaLE 20x --- Matthew Croughan#footnote[https://www.youtube.com/watch?v=6Le0IbPRzOE]
	- Nix is a better Docker image builder than Docker's image builder --- Xe Iaso#footnote[https://xeiaso.net/talks/2024/nix-docker-build/]
	- SLSA demo --- Tomberek#footnote[https://www.youtube.com/watch?v=dT0DGVbD-5M&t=985s]
	- Own your CI with Nix --- Théophane Hufschmitt#footnote[https://fosdem.org/2024/schedule/event/fosdem-2024-2282-own-your-ci-with-nix/]
]

// vim: filetype=typst
