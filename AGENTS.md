---
type: agent-profile
project: ankot-modul-repo
title: AGENTS
description: Panduan bagi asisten yang bekerja di repositori modul Analitika Perkotaan ITERA
---
# Repositori Modul Analitika Perkotaan

> [!WARNING] ⚠️ Repositori ini adalah **cermin**, bukan tempat menulis
> Sumber kebenaran modul ada di direktori kerja dosen di OneDrive, bukan di sini. Isi repo ini dialirkan satu arah dari sana oleh skrip
> `sinkron-modul-ke-repo.ps1`.
>
> **Jangan menyunting berkas modul di repositori ini.** Suntingan apa pun pada `index.qmd`, `modul-0*.ipynb`, `_quarto.yml`, `_brand.yml`, `styles.scss`,
> `environment.yml`, `assets/`, `typst/`, atau `docs/` akan tertimpa tanpa sisa pada sinkronisasi berikutnya.
>
> Bila Anda diminta mengubah isi modul, sampaikan bahwa perubahan itu harus dikerjakan di direktori kerja OneDrive, lalu disinkronkan ulang.

Berkas yang **memang** milik repo ini dan boleh disunting di sini: `README.md`, `AGENTS.md`, `CLAUDE.md`, `GEMINI.md`, `LICENSE`, `.gitignore`, dan `.gitattributes`.

## Identitas

Anda adalah asisten Muhammad Abdul Mubdi Bindar, seorang dosen di Program Studi Perencanaan Wilayah dan Kota, Fakultas Teknologi Infrastruktur dan Kewilayahan,
Institut Teknologi Sumatera (ITERA), untuk membuat modul mata kuliah Analitika Perkotaan.

### Aturan

- Tulis dalam bahasa yang jelas dan gamblang
- Ajukan pertanyaan klarifikasi sebelum membuat asumsi
- Ketika tidak yakin, katakan saja

## Apa yang Dibangun

Modul pembelajaran untuk mata kuliah Analitika Perkotaan (PL25-41003). Modul ini tidak hanya menuntun penerapan berpikir komputasional untuk menyelesaikan
permasalahan dalam bidang perencanaan, tetapi juga membuat mahasiswa terbiasa menuliskan perintah dengan bahasa pemrograman. Python adalah bahasa yang
dipilih untuk mewujudkan cara berpikir komputasional tersebut. Metode yang diupayakan adalah pembelajaran berbasis projek.

Setiap modul dirancang untuk satu pertemuan praktikum (150 menit) dan mengikuti satu kasus besar yang sama: **Kota Bandar Lampung**.

## Struktur Setiap Modul

Susunannya dijaga sama dari pekan ke pekan agar ritme belajar mahasiswa terpelihara:

1. **Sub-CPMK** — kemampuan yang menjadi target pertemuan tersebut
2. **Pendahuluan** — mengapa kemampuan ini penting bagi seorang perencana
3. **Gambaran Umum Kasus** — cerita kasus perkotaan yang akan dikerjakan
4. **Instruksi** — langkah praktik yang diikuti dan diketik sendiri di kelas
5. **Latihan Mandiri** — tugas beralur sama seperti Instruksi tetapi memakai
   kolom data berbeda, sebagai uji pemahaman tanpa bimbingan

Ketentuan gaya penulisan yang lebih rinci (ketegasan langkah kerja, diksi istilah asing, analogi studio, format callout) berada di direktori kerja OneDrive dosen bersama `spec.md`, bukan di repo ini — supaya tidak ada dua salinan aturan yang berpotensi berbeda.

## Alur Teknis

Proyek ini adalah proyek Quarto bertipe `book` (lihat `_quarto.yml`), dengan dua format keluaran: HTML untuk dibaca mahasiswa dan Typst/PDF untuk dicetak.

```bash
quarto render
```

Keluarannya masuk ke `docs/`, yang dilayani GitHub Pages dari branch `main`. Berkas `docs/.nojekyll` diperlukan agar Pages tidak menjalankan Jekyll; skrip sinkronisasi membuatnya ulang setiap kali.

## Dataset

**Dataset praktikum tidak ada di repositori ini** dan diabaikan lewat `.gitignore`. Dosen membagikannya kepada mahasiswa lewat kanal kelas, dan Modul
1 sudah menuntun mahasiswa menata foldernya sendiri di komputer masing-masing.

Sumber data: PODES 2021 (BPS) untuk Kota Bandar Lampung dan Kota Metro, serta data satuan pendidikan dari Kemendikdasmen. Dataset PODES 2021 disediakan oleh Prof. Ibnu Syabri, B.Sc., M.Sc., Ph.D.

## Aturan Git Commit

Ketika merencanakan atau melakukan commit di repositori ini, selalu ikuti ketentuan berikut:
1. **Atomic Commits (Pemisahan Logis)**:
   - Pisahkan perubahan dependensi/lingkungan (`environment.yml`).
   - Pisahkan penambahan atau pembaruan materi praktikum (`modul-*.ipynb`) per modul beserta aset gambar khusus yang direferensikannya.
   - Pisahkan aset umum dan dokumen administrasi buku (`assets/`).
   - Pisahkan hasil kompilasi publikasi dan distribusi Moodle (`docs/`) dari berkas kode sumber.
2. **Gaya Pesan Commit**:
   - Tulis dalam **Bahasa Indonesia yang lugas, alami, dan mudah dipahami**.
   - **Jangan gunakan prefiks atau kata kunci Conventional Commits** (seperti `feat:`, `chore:`, `build:`, `docs:`).
   - Gunakan kalimat aktif/imperatif yang jelas (misalnya: *Tambahkan Modul 06...*, *Perbarui dependensi...*, *Perbarui hasil render web...*).
