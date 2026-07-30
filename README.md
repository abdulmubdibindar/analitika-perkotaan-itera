# Modul Praktikum Analitika Perkotaan

Modul praktikum mata kuliah **Analitika Perkotaan (PL25-41003)** di Program
Studi Perencanaan Wilayah dan Kota, Institut Teknologi Sumatera — Semester
Ganjil Tahun Akademik 2026/2027.

Setiap modul dirancang untuk satu pertemuan praktikum (150 menit) dan mengikuti
satu kasus besar yang sama: **Kota Bandar Lampung**. Bahasa pemrogramannya
Python, dan penyusunannya memakai [Quarto](https://quarto.org).

**📖 Baca bukunya di:
<https://abdulmubdibindar.github.io/analitika-perkotaan-itera/>**

Versi PDF dapat diunduh dari tautan di dalam buku tersebut.

## Untuk Mahasiswa

### 1. Ambil berkas modul

Unduh repositori ini sebagai ZIP lewat tombol **Code → Download ZIP** di halaman
GitHub, lalu ekstrak ke direktori kerja Anda. Bila Anda sudah memakai git,
`git clone` juga boleh.

### 2. Siapkan *environment* Python

Praktikum memakai Miniconda. Dari dalam direktori modul, jalankan:

```bash
conda env create -f environment.yml
```

Lalu aktifkan setiap kali akan bekerja:

```bash
conda activate analitika-perkotaan
```

Seluruh langkah penyiapan perangkat lunak — Miniconda, Visual Studio Code, dan
pemasangan *library* — dituntun langkah demi langkah pada **Modul 1**.

### 3. Dataset

> [!IMPORTANT]
> **Dataset praktikum tidak disertakan di repositori ini.** Dosen
> membagikannya lewat kanal kelas dalam folder `dataset-ganjil-2026-2027`.
> Cara menata folder tersebut di komputer Anda dijelaskan pada **Modul 1**.

Sumber datanya adalah **PODES 2021** (BPS) untuk Kota Bandar Lampung dan Kota
Metro, serta data satuan pendidikan dari Kemendikdasmen.

## Untuk Dosen

### Merender buku

```bash
quarto render
```

Keluarannya masuk ke `docs/`, yang dilayani GitHub Pages dari branch `main`.
Dua format dihasilkan sekaligus: HTML untuk dibaca mahasiswa dan Typst/PDF untuk
dicetak.

### Repositori ini adalah cermin

Sumber kebenaran modul ada di direktori kerja dosen di OneDrive, bukan di sini.
Isi repo dialirkan satu arah dari sana oleh skrip `sinkron-modul-ke-repo.ps1`,
sehingga folder `.git` tidak pernah ikut disinkronkan OneDrive.

**Jangan menyunting berkas modul di repositori ini** — suntingannya akan
tertimpa pada sinkronisasi berikutnya. Rinciannya ada di
[AGENTS.md](./AGENTS.md).

## Isi

| Modul | Berkas |
| --- | --- |
| Kata Pengantar | `index.qmd` |
| Modul 1 | `modul-01.ipynb` |
| Modul 2 | `modul-02.ipynb` |
| Modul 3 | `modul-03.ipynb` |
| Modul 4 | `modul-04.ipynb` |
| Modul 5 | `modul-05.ipynb` |

Konfigurasi buku ada di `_quarto.yml`, tampilannya di `_brand.yml` dan
`styles.scss`, templat cetak Typst di `typst/`, serta gambar dan font di
`assets/`.

## Tim Penyusun

- Prof. Ibnu Syabri, B.Sc., M.Sc., Ph.D.
- Muhammad Abdul Mubdi Bindar, S.T., M.T.
- Ahmad Luky Ramdani, S.Komp., M.Kom.
- Valendya Rilansari, S.P.W.K., M.P.W.K.
- Chania Rahmah, S.P.W.K., M.Sc.

Terima kasih kepada **Prof. Ibnu Syabri, B.Sc., M.Sc., Ph.D.** atas penyediaan
dataset PODES 2021 untuk pembelajaran praktikum ini.

## Lisensi

Materi modul ini dilisensikan di bawah
[Creative Commons Attribution-ShareAlike 4.0 International](./LICENSE)
(CC BY-SA 4.0). Anda bebas menyalin, menyebarkan, dan mengubahnya — termasuk
untuk keperluan komersial — selama mencantumkan atribusi dan membagikan
turunannya dengan lisensi yang sama.

Potongan kode Python di dalam modul dimaksudkan sebagai bahan ajar dan bebas
Anda pakai ulang di pekerjaan sendiri tanpa kewajiban *share-alike*.
