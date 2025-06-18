install.packages("glmtoolbox")
install.packages("pROC")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("readr")
install.packages("Rfast")



library(glmtoolbox)
library(pROC)
library(ggplot2)
library(dplyr)
library(readr)

df <- read_csv("/Users/admin/Downloads/predicted_results.csv")  
head(df)

str(df)

# Buat model dummy agar hltest tidak error
model <- glm(actual_default ~ prob_default, data = df, family = binomial)

#Hosmer-Lemeshow Test (hltest)
hl_result <- hltest(model = model, y = df$actual_default, yhat = df$prob_default, g = 10)
print(hl_result)



#Calibration Curve (dengan ggplot2)
# Binning 10 kelompok probabilitas
df$bin <- ntile(df$prob_default, 10)

# Hitung rata-rata prediksi dan aktual tiap bin
calib <- df %>%
  group_by(bin) %>%
  summarise(
    mean_pred = mean(prob_default),
    mean_actual = mean(actual_default)
  )

# Plot
ggplot(calib, aes(x = mean_pred, y = mean_actual)) +
  geom_line(color = "blue") +
  geom_point(size = 2) +
  geom_abline(slope = 1, intercept = 0, linetype = "dashed", color = "red") +
  labs(title = "Calibration Curve",
       x = "Predicted Probability",
       y = "Observed Default Rate") +
  theme_minimal()

# Simpan PNG
ggsave("calibration_curve.png", width = 6, height = 4)



#Cut-off Skor untuk Default ≤ 5%
# Tambahkan scorecard jika belum
scorecard <- 300 + (df$prob_default * 550)

# Tambahkan kolom skor ke data
df$score <- scorecard

# Buat urutan skor dari tinggi → rendah dan cek default rate kumulatif
cutoff_analysis <- df %>%
  arrange(desc(score)) %>%
  mutate(cum_default = cumsum(actual_default) / row_number()) %>%
  filter(cum_default <= 0.05)

# Cut-off tertinggi dengan default ≤ 5%
cutoff_score <- min(cutoff_analysis$score)
print(cutoff_score)

