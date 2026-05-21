# Slovin
N <- 154
e <- 0.15
n <- ceiling(N / (1 + N * e^2))
cat("Jumlah sampel berdasarkan rumus Slovin =", n)

#Import Data
library(readxl)
library(psych) 

data <- read_excel("C:/Users/ASUS/Downloads/DATA KUISIONER TUGAS 2.xlsx")
View(data)
# Melihat nama variabel
names(data)
# Melihat data
View(data)

# UJI VALIDITAS
# Ambil item kuesioner
item <- data[, c("P1","P2","P3","P4","P5","P6","P7","P8","P9","P10")]
# Uji validitas
corr.test(item)
# Skor total
total <- rowSums(item)
# Korelasi item-total
cor(item, total)

# UJI REABILITAS
# Uji reliabilitas Cronbach Alpha
alpha(item)$total
# Menampilkan hasil cronbach Alphanya saja
alpha(item)$total$raw_alpha