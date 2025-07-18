library(openxlsx)
library(ggplot2)
library(dplyr)
library(ggridges)
library(svglite)

#Step 1: Read SSFI data (NA already removed)
ssfi_ts <- read.xlsx("SSFI_TS.xlsx")$TurtleSpot
ssfi_xlq <- read.xlsx("SSFI_XLQ.xlsx")$XLQ
ssfi_oslob <- read.xlsx("SSFI_Oslob.xlsx")$Oslob
ssfi_mal <- read.xlsx("SSFI_Mal.xlsx")$Maldives

#Step 2: Combine into long-format dataframe
data_long <- data.frame(
  SSFI = c(ssfi_ts, ssfi_xlq, ssfi_oslob, ssfi_mal),
  Dataset = factor(c(
    rep("TS", length(ssfi_ts)),
    rep("XLQ", length(ssfi_xlq)),
    rep("Oslob", length(ssfi_oslob)),
    rep("Maldives", length(ssfi_mal))
  ))
)


#Step 3: Create ridge plot

data_ridge <- data.frame(
  SSFI = c(ssfi_ts, ssfi_xlq, ssfi_oslob, ssfi_mal),
  Dataset = factor(c(
    rep("TS", length(ssfi_ts)),
    rep("XLQ", length(ssfi_xlq)),
    rep("Oslob", length(ssfi_oslob)),
    rep("Maldives", length(ssfi_mal))
  ),
  levels = c("Maldives", "Oslob", "TS", "XLQ"))
)

ggplot(data_ridge, aes(x = SSFI, y = Dataset, fill = Dataset)) +
  geom_density_ridges(scale = 0.9, alpha = 0.5, rel_min_height = 0.0005) +
  labs(
    title = "Ridge Plot of SSFI Distributions",
    x = "SSFI",
    y = "Dataset"
  ) +
  theme_minimal() +
  theme(legend.position = "none")


# or histogram-like ridge plot
ggplot(data_long, aes(x = SSFI, y = Dataset, fill = Dataset)) +
  geom_density_ridges(
    stat = "binline",      
    bins = 100,             
    scale = 0.8,          
    draw_baseline = TRUE,  
    color = "black",
    alpha = 0.8
  ) +
  labs(
    title = "SSFI Ridge Plot (Histogram-like)",
    x = "SSFI",
    y = "Dataset"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

#Step 4: Calculate the means
group_stats <- data_long %>%
  group_by(Dataset) %>%
  summarise(mean_value = mean(SSFI, na.rm = TRUE))

#Step 5: Ridge plot with mean lines
ggplot(data_long, aes(x = SSFI, y = Dataset, fill = Dataset)) +
  geom_density_ridges(
    stat = "binline", bins = 100, scale = 0.95,
    draw_baseline = TRUE, alpha = 0.7, color = "black"
  ) +
  geom_vline(
    data = group_stats,
    aes(xintercept = mean_value, color = Dataset),
    linetype = "dashed", linewidth = 0.8, show.legend = FALSE
  ) +
  labs(
    title = "SSFI Ridge Plot with Mean Lines",
    x = "SSFI",
    y = "Dataset"
  ) +
  theme_minimal() +
  theme(legend.position = "none")


#Step 6: Output the figure
ggsave(
  filename = "SSFI_ridge_plot_with_means.svg",
  plot = last_plot(),
  width = 8, height = 12,
  units = "in",
  device = svglite
)

