Saya mendeteksi dua bentuk anomali pada kolom decoy_noise:



1. Nilai-nilai ekstrim yang sangat tinggi (contoh: 995.56, 885.5, 773.87), yang secara statistik jauh di atas sebaran normal — ini menandakan potensi noise atau data sintetik.
2. Nilai negatif seperti -43.33, -15.51, -7.5, yang secara logis tidak valid sebagai nilai pengganggu karena mengindikasikan noise di bawah nol.

Anomali ini penting untuk dipertimbangkan agar tidak bias dalam pelatihan model klasifikasi atau regresi.

