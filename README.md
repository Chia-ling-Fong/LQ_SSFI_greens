# LQ_SSFI_greens

This repository contains the data, analysis code, and documentation associated with the study:

**Fong, C.-L., et al. (2025).**  
**"Generating Representative Mark-Resight Data and Applying a Standardized Site Fidelity Index to Study Green Turtle Foraging Aggregations"**

This research evaluates the site fidelity of green turtles (*Chelonia mydas*) at Liuqiu Island, Taiwan, using a multiple-event mark-resight survey design and a standardized Site Fidelity Index (SSFI). The project was designed to demonstrate best practices in field survey effort, resighting probability, and the use of open-access metrics to assess residency patterns in coastal foraging aggregations.

---

## 🐢 Project Summary

- **Study site**: Two adjacent coral reef sites at Liuqiu Island, Taiwan  
- **Duration**: Two years (2021–2023), with quarterly multiple-event snorkel surveys  
- **Individuals analyzed**: 398 green turtles (photo-identified)  
- **Key methods**:
  - Standardized site fidelity index (SSFI)
  - Photo-ID based mark-resight data
  - Comparison of survey effort and tidal influence
  - Age-class categorization
  - Injury detection and classification

**Key findings include**:
- Multiple-event surveys yielded a 3.5x higher resighting rate than single-event surveys.
- Turtle sightings were higher during flood and high tides.
- Juveniles comprised 65.4% of observed individuals.
- Injuries were detected in 8.5% of turtles.
- Low-SSFI groups had a higher proportion of adult-sized turtles, suggesting ontogenetic shifts in site use.

---

## 📁 Project Structure

```
LQ_SSFI_greens/
├── code/                # Analysis scripts (.R)
├── data/
│   ├── raw/             # Unprocessed field or photo-ID data (e.g. SSFI_XLQ_greens.csv)
│   └── clean/           # Cleaned datasets for modeling and plotting
├── results/
│   ├── figures/         # [Temporarily unavailable] Final plots and result figures. Will be shared after publication.
│   └── pictures/        # Raw field images (optional)
├── doc/
│   └── paper/           # [Embargoed] Final manuscript PDF will be uploaded upon journal publication.
├── study.Rmd            # Main RMarkdown file to reproduce analysis
├── LICENSE              # CC0 1.0 Public Domain Dedication
└── README.md            # This file
```

---

## 📊 Data

The core dataset, `SSFI_XLQ_greens.csv`, contains individual-based records from the field surveys. Each row corresponds to a uniquely photo-identified green turtle with associated metadata.

Key variables include:

| Column              | Description                                   |
|---------------------|-----------------------------------------------|
| TurtleID            | Unique turtle code (e.g., TW01G0047)          |
| Date_FirstSeen      | First observation date                        |
| Date_LastSeen       | Last observation date                         |
| Num_Sightings       | Number of resightings                         |
| SSFI                | Site Fidelity Index (scaled 0 to 1)           |
| Fidelity_Category   | Low or High (based on SSFI threshold)         |
| SizeClass           | Juvenile / Subadult / Adult                   |
| InjuryStatus        | None / Healed / Partial / Fresh               |

---

## ▶️ How to Reproduce

To replicate the analysis:

1. Clone this repository
2. Open `study.Rmd` in [RStudio](https://www.rstudio.com/)
3. Run the full document, or source scripts from `/code`

Dependencies:
- R (≥ 4.2)
- tidyverse
- lubridate
- ggplot2

---

## 🔗 Citation

If you use this dataset or code, please cite:

> Fong, C.-L., et al. (2025). Generating Representative Mark-Resight Data and Applying a Standardized Site Fidelity Index to Study Green Turtle Foraging Aggregations. *[Journal Name]*.

---

## 🪪 License

All materials in this repository are dedicated to the public domain under the [CC0 1.0 Universal License](https://creativecommons.org/publicdomain/zero/1.0/).

---

## 🧵 Contact

📧 Contact author:  
Chia-Ling Fong  
chialingfong@gmail.com

---

_Last updated: July 2025_
