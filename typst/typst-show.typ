// Empat callout standar modul (lihat spec.md, "Pemformatan Callout"):
//   note "Pengetahuan Komputer"  -> ikon bawaan Quarto
//   note "Konsep Python"         -> ikon logo Python (di-override di bawah)
//   tip  "Pengetahuan VS Code"   -> ikon bawaan Quarto
//   warning "Penting!"           -> ikon bawaan Quarto
// Reimplementasi penuh callout Quarto (bukan delegasi) agar bisa menyetel
// `breakable: true` — flag ini terkubur di fungsi bawaan sehingga tak bisa
// diubah lewat delegasi. Struktur kotak disalin persis dari definisi bawaan
// Quarto (mis. index.typ) supaya tampilan callout pendek tidak berubah; satu-
// satunya beda fungsional adalah breakable false -> true, plus penyisipan ikon
// logo Python untuk judul "Konsep Python".
#let callout(
  body: none,
  title: none,
  background_color: none,
  icon_color: none,
  icon: none,
  body_background_color: none,
) = {
  let final-icon = icon
  if title != none and "Konsep Python" in repr(title) {
    final-icon = box(image("assets/python-logo.svg", height: 0.9em), baseline: 10%)
  }
  block(
    breakable: true,
    fill: background_color,
    stroke: (paint: icon_color, thickness: 0.5pt, cap: "round"),
    width: 100%,
    radius: 2pt,
    block(
      inset: 1pt,
      width: 100%,
      below: 0pt,
      block(
        fill: background_color,
        width: 100%,
        inset: 8pt,
      )[#if final-icon != none [#text(icon_color, weight: 900)[#final-icon] ]#title]
    ) +
    if (body != []) {
      block(
        inset: 1pt,
        width: 100%,
        block(fill: body_background_color, width: 100%, inset: 8pt, body),
      )
    },
  )
}

#show: doc => modul(
$if(title)$
  title: [$title$],
$endif$
$if(subtitle)$
  subtitle: [$subtitle$],
$endif$
$if(by-author)$
  authors: (
$for(by-author)$
$if(it.name.literal)$
    ( name: [$it.name.literal$] ),
$endif$
$endfor$
  ),
$endif$
$if(date)$
  date: [$date$],
$endif$
$if(lang)$
  lang: "$lang$",
$endif$
$if(region)$
  region: "$region$",
$endif$
$if(fontsize)$
  fontsize: $fontsize$,
$endif$
$if(section-numbering)$
  sectionnumbering: "$section-numbering$",
$endif$
$if(toc)$
  toc: $toc$,
$endif$
$if(toc-title)$
  toc_title: [$toc-title$],
$endif$
$if(toc-indent)$
  toc_indent: $toc-indent$,
$endif$
  toc_depth: $toc-depth$,
$if(mainfont)$
  mainfont: "$mainfont$",
$endif$
$if(sansfont)$
  sansfont: "$sansfont$",
$endif$
$if(monofont)$
  monofont: "$monofont$",
$endif$
  doc,
)
