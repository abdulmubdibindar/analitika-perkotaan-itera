// Template Typst khusus Modul Praktikum Analitika Perkotaan.
// Fon sesuai spec buku ajar: Playfair Display (heading), Plus Jakarta Sans (tubuh),
// JetBrains Mono (kode). Memuat halaman sampul + lembar pengesahan.

#let warna-merah-itera = rgb(192, 0, 0)

// ---------------------------------------------------------------------------
// Lembar pengesahan: replika "lembar pengesahan modul.png"
// ---------------------------------------------------------------------------
#let lembar-pengesahan(tahun: "2026") = page(numbering: none)[
  #set text(size: 11pt)
  #set par(justify: false)

  // Tabel kop
  #table(
    columns: (3.4cm, 7.4cm, 1fr),
    stroke: 0.75pt + black,
    align: (center + horizon, center + horizon, left + horizon),
    inset: 5pt,
    table.cell(rowspan: 4)[
      #image("assets/Logo_ITERA.png", width: 2.2cm)
    ],
    table.cell(rowspan: 2)[
      *INSTITUT TEKNOLOGI SUMATERA*
    ],
    [Nomor :],
    [Tanggal:],
    table.cell(rowspan: 2)[
      #text(weight: "bold")[PENGESAHAN MODUL PRAKTIKUM \ ANALITIKA PERKOTAAN]
    ],
    [Revisi :],
    [Halaman:],
  )

  #v(3.5cm)

  // Blok judul tengah
  #align(center)[
    #text(weight: "bold")[MODUL PRAKTIKUM MATA KULIAH ANALITIKA PERKOTAAN] \
    PROGRAM STUDI PERENCANAAN WILAYAH DAN KOTA \
    FAKULTAS TEKNOLOGI INFRASTRUKTUR DAN KEWILAYAHAN \
    INSTITUT TEKNOLOGI SUMATERA
  ]

  #v(2.5cm)

  // Tabel tanda tangan
  #table(
    columns: (2.8cm, 1fr, 3.2cm, 2.6cm, 2.4cm),
    stroke: 0.75pt + black,
    align: (left + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
    inset: 6pt,
    table.cell(rowspan: 2, align: left + horizon)[*PROSES*],
    table.cell(colspan: 3)[*PENANGGUNG JAWAB*],
    table.cell(rowspan: 2)[*TANGGAL*],
    [*Nama*], [*Jabatan*], [*Tanda Tangan*],
    [Disusun oleh],
    [Muhammad Abdul Mubdi Bindar, S.T., M.T.],
    [Dosen Penanggung Jawab],
    [],
    [13 Juli #tahun],
    [Diperiksa oleh],
    [Chania Rahmah, S.P.W.K., M.Sc.],
    [Gugus Kendali Mutu Prodi],
    [],
    [20 Juli #tahun],
    [Pengesahan],
    [Dr. nat. techn. Shahnaz Nabila Fuady, S.T., M.T.],
    [Koordinator Program Studi Perencanaan Wilayah dan Kota],
    [],
    [27 Juli #tahun],
  )
]

// ---------------------------------------------------------------------------
// Fungsi utama dokumen
// ---------------------------------------------------------------------------
#let modul(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  lang: "id",
  region: "ID",
  fontsize: 11pt,
  sectionnumbering: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  mainfont: "Plus Jakarta Sans",
  sansfont: "Playfair Display",
  monofont: "JetBrains Mono",
  doc,
) = {
  set document(title: title)

  set par(justify: true, leading: 0.75em) // Jarak antarbaris 1.15 kali ukuran huruf

  set text(
    font: (mainfont,),
    lang: lang,
    region: region,
    size: fontsize,
  )

  // Heading memakai sansfont (tebal), ukuran bertingkat 20/18/16/14pt,
  // jarak 1cm dari nomor, dan spasi sebelum-sesudah
  show heading: it => {
    set text(
      font: (sansfont,),
      weight: "bold",
      size: if it.level == 1 { 20pt }
        else if it.level == 2 { 18pt }
        else if it.level == 3 { 16pt }
        else { 14pt },
    )
    
    let heading-content = if it.numbering != none {
      grid(
        columns: (auto, 1fr),
        column-gutter: 0.75cm,
        counter(heading).display(it.numbering),
        it.body,
      )
    } else {
      it.body
    }

    block(
      width: 100%,
      above: 1.5em,
      below: 1em,
      sticky: true,
      heading-content
    )
  }

  // Kode memakai monofont (default: JetBrains Mono) dan matikan ligatur
  show raw: set text(font: (monofont,), features: (liga: 0, calt: 0))

  // Bersihkan kode warna ANSI (seperti escape sequence \u{1b}[31m) dari teks
  // agar tidak dirender sebagai karakter kotak kosong (glyph not found) di PDF
  show regex("\u{1b}\\[[0-9;]*m"): ""



  set heading(numbering: sectionnumbering)

  // -------------------------------------------------------------------------
  // Halaman sampul
  // -------------------------------------------------------------------------
  page(numbering: none)[
    #align(center)[
      #v(2cm)
      #image("assets/Logo_ITERA.png", width: 3.5cm)
      #v(1.5cm)
      #text(size: 14pt, tracking: 2pt)[MODUL PRAKTIKUM MATA KULIAH]
      #v(0.8cm)
      #text(font: (sansfont,), size: 30pt, weight: "bold")[#title]
      #if subtitle != none {
        v(0.4cm)
        text(size: 13pt, style: "italic")[#subtitle]
      }
      #v(1fr)
      #if authors != none and authors != () {
        for author in authors [
          #author.name \
        ]
      }
      #v(1.2cm)
      #text(size: 12pt)[
        Program Studi Perencanaan Wilayah dan Kota \
        Fakultas Teknologi Infrastruktur dan Kewilayahan \
        Institut Teknologi Sumatera \
        2026
      ]
      #v(1cm)
    ]
  ]

  // -------------------------------------------------------------------------
  // Lembar pengesahan
  // -------------------------------------------------------------------------
  lembar-pengesahan()

  // -------------------------------------------------------------------------
  // Daftar isi
  // -------------------------------------------------------------------------
  if toc {
    page(numbering: none)[
      #outline(
        title: if toc_title == none { "Daftar Isi" } else { toc_title },
        depth: toc_depth,
        indent: toc_indent,
      )
    ]
  }

  counter(page).update(1)

  {
    // Setiap bab (heading level 1) mulai di halaman baru;
    // aturan ini hanya berlaku untuk isi buku, bukan judul Daftar Isi.
    show heading.where(level: 1): it => {
      pagebreak(weak: true)
      it
    }
    doc
  }
}

#set table(
  inset: 6pt,
  stroke: none
)
