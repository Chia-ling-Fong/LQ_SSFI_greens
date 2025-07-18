library(dplyr)
library(openxlsx)

# SSFI vs Age-class with Chi-Square test

# Step 1: Create age table
data <- read.xlsx("XLQ_greens.xlsx")
filtered_age_data <- data[data$`Age-class` != "Unknown", ]
table_age <- table(filtered_age_data$`SSFI.group`, filtered_age_data$`Age-class`)
table_age

# Chi square test
chisq.test(table_age)

# SSFI vs Injury-status with Chi Square test
# Step 1: Create injury table
table_injury <- table(data$`SSFI.group`, data$Injured)
table_injury

#Chi square Exact Test
chisq.test(table_injury)


# Injury vs Age-class with Fisher Exact test due to small sample size

#Step 1: create Injury vs Age-class table
filtered_age_data <- data[data$`Age-class` != "Unknown", ]
table_injury_age <- table(filtered_age_data$`Age-class`, filtered_age_data$Injured)
table_injury_age

# Fisher's Exact Test
fisher.test(table_injury_age)



