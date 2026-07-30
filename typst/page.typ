// Pengaturan halaman: A4, margin atas-bawah-luar 2 cm dan dalam 3 cm,
// nomor halaman berjarak ±1 cm dari tepi bawah kertas (footer-descent).
#set page(
  paper: "a4",
  margin: (inside: 3cm, outside: 2cm, top: 2cm, bottom: 2cm),
  numbering: $if(page-numbering)$"$page-numbering$"$else$none$endif$,
  footer-descent: 0.6cm,
)
