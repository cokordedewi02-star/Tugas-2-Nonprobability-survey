# Tugas 2 Nonprobability-survey
# ANALISIS TINGKAT KEPUASAN MAHASISWA TERHADAP SARANA DAN PRASARANA DI UNIVERSITAS MATARAM MENGGUNAKAN NON- PROBABILITY SAMPLING
## Latar Belakang Penelitian
Perguruan tinggi merupakan lembaga pendidikan yang memiliki peran penting dalam meningkatkan kualitas sumber daya manusia melalui kegiatan pembelajaran, penelitian, dan pengabdian kepada masyarakat. Dalam mendukung kegiatan tersebut, sarana dan prasarana menjadi faktor penting karena dapat menciptakan lingkungan belajar yang nyaman dan kondusif bagi mahasiswa. Sarana dan prasarana meliputi berbagai fasilitas akademik maupun non-akademik seperti ruang kuliah, laboratorium, perpustakaan, jaringan internet, area parkir, dan lingkungan kampus. Kepuasan mahasiswa merupakan salah satu indikator untuk menilai kualitas pelayanan perguruan tinggi. Tingkat kepuasan mahasiswa dipengaruhi oleh kesesuaian antara harapan mahasiswa dengan fasilitas yang diterima selama proses perkuliahan. Penelitian oleh Yanti dkk (2025) menunjukkan bahwa kualitas sarana dan prasarana memiliki hubungan yang signifikan terhadap tingkat kepuasan mahasiswa. Penelitian Santi dkk (2024) juga menyatakan bahwa fasilitas yang memadai dapat meningkatkan kenyamanan mahasiswa dalam kegiatan akademik. Selain itu, Anandhika dkk (2024) menjelaskan bahwa fasilitas pendidikan dan kualitas layanan administrasi berpengaruh terhadap kepuasan mahasiswa. Penelitian Novaldy dkk (2025) dan Febrianti dkk (2019) juga menunjukkan bahwa fasilitas pembelajaran dan media pembelajaran memiliki pengaruh terhadap tingkat kepuasan mahasiswa. Universitas Mataram sebagai salah satu perguruan tinggi negeri di Nusa Tenggara Barat terus berupaya meningkatkan kualitas pelayanan pendidikan, termasuk dalam penyediaan sarana dan prasarana kampus. Oleh karena itu, penelitian mengenai “Analisis Tingkat Kepuasan Mahasiswa terhadap Sarana dan Prasarana di Universitas Mataram Menggunakan Non-Probability Sampling” perlu dilakukan untuk mengetahui tingkat kepuasan mahasiswa terhadap fasilitas kampus yang tersedia serta sebagai bahan evaluasi bagi pihak universitas dalam meningkatkan kualitas sarana dan prasarana.
## Tujuan Penelitian
Tujuan penelitian ini yaitu untuk mengetahui tingkat kepuasan mahasiswa terhadap sarana dan prasarana di Universitas Mataram.
## Metode Penelitian
Penelitian ini menggunakan pendekatan kuantitatif dengan jenis penelitian deskriptif untuk menggambarkan kondisi sebenarnya mengenai tingkat kepuasan mahasiswa terhadap sarana dan prasarana di Universitas Mataram. Metode yang digunakan adalah metode survei melalui penyebaran kuesioner kepada responden. Populasi dalam penelitian ini adalah seluruh mahasiswa Statistika yang berjumlah 154 orang, dengan jumlah sampel sebanyak 35 responden. Teknik pengambilan sampel yang digunakan adalah non-probability sampling dengan metode convenience sampling, yaitu pengambilan sampel berdasarkan kemudahan peneliti dalam memperoleh responden yang sesuai dengan tujuan penelitian. Data yang digunakan merupakan data primer yang diperoleh langsung dari hasil pengisian kuesioner oleh responden. Instrumen penelitian terdiri atas 10 item pernyataan, yaitu P1 sampai P10, yang diukur menggunakan skala Likert 1 sampai 5, mulai dari sangat tidak setuju hingga sangat setuju. Pengolahan dan analisis data dilakukan menggunakan software R. Analisis data diawali dengan analisis deskriptif untuk melihat gambaran umum karakteristik dan tanggapan responden, kemudian dilanjutkan dengan uji validitas menggunakan korelasi item-total untuk mengetahui kelayakan item pernyataan, serta uji reliabilitas menggunakan metode Cronbach Alpha untuk mengukur tingkat konsistensi instrumen penelitian. Instrumen dinyatakan valid apabila nilai korelasi lebih besar dari r tabel dan dinyatakan reliabel apabila nilai Cronbach Alpha lebih besar dari 0,70.
## Tahapan Analisis Data
### 1. Analisis Slovin (Pengambilan Sampel)
Analisis ini bertujuan untuk menentukan jumlah sampel penelitian yang akan digunakan berdasarkan rumus Slovin, sehingga sampel yang diambil dapat mewakili populasi secara proporsional dengan tingkat kesalahan (error) yang telah ditentukan. Dalam penelitian ini, rumus Slovin digunakan untuk menghitung jumlah responden dari total populasi 154 mahasiswa dengan tingkat kesalahan 15%, sehingga diperoleh ukuran sampel yang dianggap cukup representatif untuk menggambarkan tingkat kepuasan mahasiswa terhadap sarana dan prasarana di Universitas Mataram.
```r
# Jumlah Populasi
N <- 154
# Jumlah Tingkat Kesalahan
e <- 0.15
# Rumus Slovin
n <- ceiling(N / (1 + N * e^2))
# Menampilkan hasil berdasarkan rumus slovin
cat("Jumlah sampel berdasarkan rumus Slovin =", n)
```
### 2. Import Data
Pada tahap ini data kuesioner yang telah disimpan dalam file Excel diimpor ke dalam R menggunakan fungsi `read_excel()` dari package readxl. Data yang berhasil dibaca kemudian disimpan ke dalam objek data untuk memudahkan proses pengolahan dan analisis selanjutnya. Setelah itu, fungsi `View(data)` digunakan untuk menampilkan data dalam bentuk tabel pada RStudio sehingga isi data dapat diperiksa terlebih dahulu sebelum dilakukan analisis lebih lanjut.
```r
library(readxl)
library(psych) 
data <- read_excel("C:/Users/ASUS/Downloads/DATA KUISIONER TUGAS 2.xlsx")
View(data)
```
### 3. Uji Validitas
Analisis ini digunakan untuk mengetahui sejauh mana setiap butir pertanyaan dalam kuesioner mampu mengukur secara tepat dan akurat tingkat kepuasan mahasiswa terhadap sarana dan prasarana di Universitas Mataram. fungsi `corr.test()` dari package `psych` untuk mengetahui keterkaitan setiap butir pertanyaan dalam mengukur konstruk yang sama, yaitu tingkat kepuasan mahasiswa. Setelah itu, dihitung skor total setiap responden dengan menjumlahkan seluruh nilai item menggunakan `rowSums(item)` sehingga diperoleh variabel total yang merepresentasikan tingkat kepuasan secara keseluruhan. Terakhir, dilakukan analisis korelasi antara masing-masing item dengan skor total melalui fungsi `cor(item, total)` untuk menilai validitas setiap butir pertanyaan, di mana item dengan nilai korelasi yang tinggi menunjukkan bahwa butir tersebut valid dan mampu merepresentasikan variabel kepuasan mahasiswa terhadap sarana dan prasarana secara tepat.
```r
# Ambil item kuesioner
item <- data[, c("P1","P2","P3","P4","P5","P6","P7","P8","P9","P10")]
# Uji validitas
corr.test(item)
# Skor total
total <- rowSums(item)
# Korelasi item-total
cor(item, total)
```
### 4. Uji Reliabilitas
Uji reliabilitas dalam penelitian ini bertujuan untuk mengukur tingkat konsistensi internal dari butir-butir pertanyaan kuesioner (P1–P10) dalam menilai kepuasan mahasiswa terhadap sarana dan prasarana di Universitas Mataram. Fungsi `alpha(item)$total` digunakan untuk menghitung uji reliabilitas Cronbach’s Alpha secara lengkap terhadap seluruh item kuesioner (P1–P10) menggunakan fungsi `alpha()` dari package `psych`, yang menghasilkan output berupa ringkasan keseluruhan reliabilitas instrumen seperti nilai Cronbach’s Alpha, jumlah item, serta informasi statistik pendukung lainnya yang digunakan untuk mengevaluasi konsistensi internal kuesioner. Sementara itu, fungsi `alpha(item)$total$raw_alpha` berfungsi untuk mengekstrak dan menampilkan hanya nilai Cronbach’s Alpha utama (raw_alpha) dari hasil perhitungan tersebut tanpa informasi tambahan lainnya, sehingga memudahkan peneliti dalam melihat nilai reliabilitas secara langsung untuk menilai apakah instrumen kuesioner memiliki konsistensi yang baik dalam mengukur variabel kepuasan mahasiswa terhadap sarana dan prasarana.
```r
# Uji reliabilitas Cronbach Alpha
alpha(item)$total
# Menampilkan hasil cronbach Alphanya saja
alpha(item)$total$raw_alpha
```
## Hasil dan Pembahasan
### Analisis Slovin
Tujuan penggunaan rumus Slovin dalam penelitian ini adalah untuk menentukan jumlah sampel yang representatif dari populasi mahasiswa sebanyak 154 orang dengan mempertimbangkan tingkat kesalahan (error) sebesar 15%. Perhitungan ini dilakukan agar jumlah responden yang diambil tidak terlalu besar maupun terlalu kecil, tetapi tetap mampu mewakili populasi secara akurat dalam menggambarkan tingkat kepuasan mahasiswa terhadap sarana dan prasarana di Universitas Mataram.
#### Tabel Hasil Perhitungan Slovin
| Komponen                  | Nilai |
|---------------------------|-------|
| Jumlah Populasi (N)       | 154   |
| Tingkat Kesalahan (e)     | 0.15  |
| Rumus Slovin              | n = N / (1 + N·e²) |
| Hasil Perhitungan Sampel  | 35    |
#### Gambar Output
![image alt](https://raw.githubusercontent.com/cokordedewi02-star/Tugas-2-Nonprobability-survey/5472b262c18355caf0ef4e02b4cebd5b61baa6dd/OUTPUT%20RUMUS%20SLOVIN.png)

Berdasarkan hasil perhitungan menggunakan rumus Slovin, diperoleh jumlah sampel sebesar 35 responden dari total populasi 154 mahasiswa dengan tingkat kesalahan 15%. Hal ini menunjukkan bahwa dari keseluruhan populasi, cukup diambil 35 responden sebagai sampel penelitian untuk mewakili karakteristik populasi secara keseluruhan. Dengan demikian, sampel yang diperoleh sudah memenuhi prinsip keterwakilan data sehingga dapat digunakan untuk analisis lebih lanjut dalam penelitian mengenai tingkat kepuasan mahasiswa terhadap sarana dan prasarana di Universitas Mataram.
### Uji Validitas
Uji validitas dalam penelitian ini bertujuan untuk mengetahui ketepatan setiap butir pertanyaan (P1–P10) dalam mengukur variabel kepuasan mahasiswa terhadap sarana dan prasarana di Universitas Mataram, serta memastikan bahwa setiap item relevan, mudah dipahami, dan mampu merepresentasikan konsep yang diukur sebelum digunakan dalam analisis lebih lanjut.
#### Tabel Hasil Uji Validitas
| Item | r hitung | r tabel | Keputusan |
|------|----------|---------|-----------|
| P1   | 0.5273531 | 0.334   | Valid     |
| P2   | 0.6753768 | 0.334   | Valid     |
| P3   | 0.6219837 | 0.334   | Valid     |
| P4   | 0.5563039 | 0.334   | Valid     |
| P5   | 0.5992148 | 0.334   | Valid     |
| P6   | 0.5040188 | 0.334   | Valid     |
| P7   | 0.7356221 | 0.334   | Valid     |
| P8   | 0.6960094 | 0.334   | Valid     |
| P9   | 0.8581276 | 0.334   | Valid     |
| P10  | 0.8757098 | 0.334   | Valid     |
#### Gambar Ouput 
![image alt](https://raw.githubusercontent.com/cokordedewi02-star/Tugas-2-Nonprobability-survey/90033953eccec6c4941301e57f3d7c022b4f0240/OUTPUT%20UJI%20VALIDITAS%201.png)

Berdasarkan hasil uji validitas menggunakan korelasi item–total dengan r tabel sebesar 0,334, diperoleh bahwa seluruh item pertanyaan pada kuesioner dinyatakan valid. Secara rinci, nilai r hitung untuk masing-masing item adalah P1 sebesar 0,527, P2 sebesar 0,675, P3 sebesar 0,622, P4 sebesar 0,556, P5 sebesar 0,599, P6 sebesar 0,504, P7 sebesar 0,736, P8 sebesar 0,696, P9 sebesar 0,858, dan P10 sebesar 0,876. Seluruh nilai tersebut lebih besar dibandingkan r tabel, sehingga menunjukkan bahwa setiap butir pertanyaan memiliki hubungan yang cukup kuat dengan skor total dan mampu mengukur variabel yang sama, yaitu tingkat kepuasan mahasiswa terhadap sarana dan prasarana di Universitas Mataram. Dengan demikian, dapat disimpulkan bahwa seluruh item kuesioner (P1–P10) valid dan layak digunakan dalam analisis penelitian lebih lanjut.
### Uji Reliabilitas
Uji reliabilitas bertujuan untuk mengukur sejauh mana instrumen kuesioner yang digunakan dalam penelitian memiliki konsistensi dalam menghasilkan data yang stabil dan dapat dipercaya. Dalam penelitian ini, uji reliabilitas dilakukan untuk memastikan bahwa butir-butir pertanyaan mengenai tingkat kepuasan mahasiswa terhadap sarana dan prasarana di Universitas Mataram mampu memberikan hasil yang konsisten apabila digunakan berulang kali pada kondisi yang relatif sama.
#### Tabel Output Lengkap Cronbach’s Alpha
| Komponen    | Nilai     |
|------------|------------|
| raw_alpha  | 0.8528136  |
| std.alpha  | 0.8605028  |
| G6 (smc)   | 0.8887431  |
| average_r  | 0.3815174  |
| S/N        | 6.168604   |
| ASE        | 0.03678164 |
| mean       | 3.682857   |
| sd         | 0.4786536  |
| median_r   | 0.3659243  |

---
#### Tabel Cronbach’s Alpha
| Komponen         | Nilai    |
|------------------|----------|
| Cronbach’s Alpha | 0.8528136|

Berdasarkan hasil uji reliabilitas menggunakan Cronbach’s Alpha, diperoleh nilai raw alpha sebesar 0,8528. Nilai ini menunjukkan bahwa instrumen kuesioner memiliki tingkat reliabilitas yang tinggi karena telah melebihi batas minimum yang umumnya digunakan yaitu 0,70. Hal ini berarti bahwa seluruh butir pertanyaan dalam kuesioner memiliki konsistensi internal yang baik dalam mengukur variabel yang sama, yaitu tingkat kepuasan mahasiswa terhadap sarana dan prasarana di Universitas Mataram. Dengan demikian, instrumen penelitian dapat dinyatakan reliabel dan layak digunakan untuk analisis lebih lanjut.

## Kesimpulan
