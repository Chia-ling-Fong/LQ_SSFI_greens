# 📂 Code Folder – LQ_SSFI_greens

This folder contains R scripts used for statistical analysis and visualization in the project:

**"Generating Representative Mark-Resight Data and Applying a Standardized Site Fidelity Index to Study Green Turtle Foraging Aggregations"**

---

## 📜 Script Descriptions

| File Name                        | Description                                                                 |
|----------------------------------|-----------------------------------------------------------------------------|
| `SSFI_Age_Injured_Chi_Fisher.R` | Performs Chi-square and Fisher's Exact tests on age class, injury, and SSFI group relationships |
| `SSFI_AHC.R`                    | Applies Agglomerative Hierarchical Clustering (AHC) on SSFI scores, identifies optimal cluster number using silhouette scores, and exports cluster results |
| `SSFI_comparison_RidgePlot.R`   | Generates ridge plots comparing SSFI distributions across different sites (Maldives, Oslob, TS, XLQ) with group mean overlays |

---

## ▶️ Suggested Run Order

The scripts can be run independently:

1. Use `SSFI_Age_Injured_Chi_Fisher.R` for categorical statistical testing
2. Use `SSFI_AHC.R` for clustering and dendrogram interpretation
3. Use `SSFI_comparison_RidgePlot.R` for multi-site SSFI distribution comparison

All input `.xlsx` files should be placed in the `/data/raw/` folder.

---

## 📦 Required R Packages

These scripts use the following packages:

```r
library(dplyr)
library(openxlsx)
library(ggplot2)
library(ggridges)
library(cluster)
library(dendextend)
library(svglite)
```

Make sure to install them using `install.packages()` if not already available.

---

## 📁 Input/Output

| Script                        | Input Files                         | Output Files                            |
|------------------------------|--------------------------------------|------------------------------------------|
| `SSFI_Age_Injured_Chi_Fisher`| `XLQ_greens.xlsx`                   | Console output only (test results)       |
| `SSFI_AHC`                   | `SSFI_XLQ.xlsx`                     | `SSFI_XLQ_with_clusters_k2.xlsx`, plots  |
| `SSFI_comparison_RidgePlot` | `SSFI_TS.xlsx`, `SSFI_XLQ.xlsx`, `SSFI_Oslob.xlsx`, `SSFI_Mal.xlsx` | `SSFI_ridge_plot_with_means.svg`         |

---

## 📝 Notes

- All scripts assume input files are `.xlsx` and stored locally.
- Figures are saved to the working directory; consider adjusting paths to `results/figures/`.

_Last updated: July 2025_
