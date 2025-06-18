Dari hasil eksekusi query statistik terhadap kolom decoy_noise, didapatkan:

Nilai Min = -48.34
Nilai Max = 1468.46
Nilai Average (Mean) = 201.11 

Interpretasi & Insight:

1. Nilai-nilai ekstrim yang sangat tinggi (contoh: 1468.46, 885.5, 773.87), yang secara statistik jauh di atas sebaran normal — ini menandakan potensi noise atau data sintetik.
2. Nilai negatif seperti -48.34, -15.51, -7.5, yang secara logis tidak valid sebagai nilai pengganggu karena mengindikasikan noise di bawah nol.
3. Nilai Rata-rata = 201.11 memberikan gambaran umum bahwa sebagian besar nilai decoy_noise berada di sekitar 200

Anomali ini penting untuk dipertimbangkan agar tidak bias dalam pelatihan model klasifikasi atau regresi.

