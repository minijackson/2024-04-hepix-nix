#import "@preview/polylux:0.3.1": *

#let colors = (
	red: rgb("E50019"),
	blue: rgb("3E4A83"),
	lightBlue: rgb("7E9CBB"),
	gray: rgb("262626"),
	yellow: rgb("FFCD31"),

	archipel: rgb("00939d"),
	macaron: rgb("da837b"),
	opera: rgb("bd987a"),
	glycine: rgb("a72587"),
)

#let backdrop(dx: relative, dy: relative) = align(
	top + right,
	move(
		dx: dx,
		dy: dy,
		image("frame-backdrop.svg", height: 200pt)
	)
)

#let cea-theme(
	aspect-ratio: "16-9",
	body,
) = {
	set text(size: 22pt, font: "Libertinus Serif")
	show raw: set text(font: "Fira Code")

	set page(
		header: backdrop(dx: 232pt, dy: -73pt),
		header-ascent: 100%,
		paper: "presentation-" + aspect-ratio,
		margin: (x: 2em, top: 1.5em, bottom: 2.5em),
	)

	show heading.where(level: 1): set heading(numbering: "1.")
	show heading.where(level: 2): set text(fill: colors.red)
	show heading: it => block(inset: (bottom: 1em))[#it] 

	body
}

#let title-slide(title: [], author: none, subtitle: none) = {
	show heading.where(level: 1): set heading(numbering: none)

	logic.polylux-slide({
		align(top + left, image("IRFU.svg", height: 125pt))
		heading(level: 1, title)
		if author != none {
			par(author)
		}
		if subtitle != none {
			par(subtitle)
		}
	})
}

#let slide(body) = {
	set page(
		header: backdrop(dx: 170pt, dy: -153pt),
		footer: {
			set text(size: 10pt, fill: luma(100))
			box(
				height: 3em,
				grid(
					columns: (5em, 1fr, 2fr, 5em),
					align(left + horizon, image("CEA.svg")),
					align(center + horizon, "CEA/DRF/IRFU/DIS/LDISC"),
					align(center + horizon, "HEPiX Spring 2024"),
					align(center + horizon, logic.logical-slide.display() + "/" + context { logic.logical-slide.final().at(0) }),
				)
			)
		},
	)

	logic.polylux-slide(body)
}

#let section-slide(background: colors.blue, foreground: white, body) = {
	show heading: it => {
		set text(fill: foreground, size: 2.5em)
		if it.numbering != none {
			text(size: 2em, counter(heading).display(it.numbering))
			[~]
		}
		it.body
	}
	set page(
		fill: background,
		margin: 2em,
		footer: [],
		header: {
			block(
				height: 50pt,
				move(
					dx: -2em - 2pt,
					dy: 54pt,
					image("section-backdrop.svg", width: 100% + 4em + 27pt, height: 95pt)
				)
			)
		},
		header-ascent: 100%,
	)
	set text(fill: foreground)
	let content = { v(.1fr); body; v(.1fr) }
	logic.polylux-slide(align(horizon, body))
}

// vim: filetype=typst
