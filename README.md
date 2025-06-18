# Data Scientist Take-Home Test

This repository contains the completed tasks for a Data Scientist take-home assignment consisting of three main sections:

## 📁 File Structure

```
├── analysis.sql             # SQL queries for RFM segmentation & repeat purchase analysis (Bagian A)
├── A_findings.md            # Findings of anomalies from decoy_noise (Bagian A)
├── B_modeling.ipynb         # Python notebook for model training and prediction (Bagian B)
├── predicted_results.csv    # Model prediction results (Bagian B)
├── shap_top10.png           # SHAP feature importance visualization (Bagian B)
├── decision_slide.pdf       # Decision summary based on one applicant's score (Bagian B)
├── validation.R             # R script for HL test, calibration curve, cutoff score (Bagian C)
├── calibration_curve.png    # Output plot from R showing calibration curve (Bagian C)
├── C_summary.md             # Summary of cutoff score decision (Bagian C)
```

## ▶️ How to Run This Project

### A. SQL Analytics
- Open `analysis.sql` in a SQLite editor (e.g. SQLiteStudio).
- Import `e_commerce_transactions.csv` as a table.
- Execute all queries in the script to calculate RFM, segment customers, and analyze repeat purchases.

### B. Python Modeling
1. Open `B_modeling.ipynb` in Jupyter/Colab.
2. Run all cells to:
   - Perform EDA & drop leakage columns.
   - Train Logistic Regression and Gradient Boosting models.
   - Generate SHAP plot (`shap_top10.png`) and score predictions (`predicted_results.csv`).
   - Final decision stored in `decision_slide.pdf`.

### C. R Analytics
1. Open `validation.R` in RStudio.
2. Run the script to:
   - Perform Hosmer-Lemeshow test.
   - Generate calibration curve (`calibration_curve.png`).
   - Determine cutoff score (`C_summary.md`).

## ✅ Notes
- Ensure all required R and Python packages are installed before running.
- Files are structured to match submission instructions.

---

© 2025 — Data Scientist Take-Home by [Your Name]