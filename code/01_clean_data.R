# 01_clean_data.R

library(dplyr)

# =====================
# Module 2: ToothGrowth cleaning
# =====================

data("ToothGrowth")
test_1 <- ToothGrowth

test_1_small <- test_1 |> 
  select(len, supp, dose)

test_1_filter <- test_1 |> 
  filter(dose >= 1)

test_1_mutate <- test_1 |> 
  mutate(
    dose_group = case_when(
      dose == 0.5 ~ "low",
      dose == 1.0 ~ "mid",
      dose == 2.0 ~ "high"
    )
  )

test_1_summary <- test_1 |> 
  group_by(supp, dose) |> 
  summarise(
    n = n(),
    mean_len = mean(len),
    sd_len = sd(len),
    .groups = "drop"
  )

# =====================
# Module 3: bio dataset cleaning
# =====================

set.seed(123)

bio <- data.frame(
  id = 1:30,
  age = sample(30:80, 30, replace = TRUE),
  sex = sample(c("F", "M"), 30, replace = TRUE),
  biomarker = rlnorm(30, meanlog = 0, sdlog = 1)
)

bio$biomarker[sample(1:30, 4)] <- NA

bio$log_biomarker <- log(bio$biomarker)

bio_complete <- bio[!is.na(bio$biomarker), ]

bio_complete$sex <- factor(bio_complete$sex)

bio_complete$disease <- ifelse(
  bio_complete$biomarker > median(bio_complete$biomarker),
  1, 0
)

bio_complete$disease <- factor(
  bio_complete$disease,
  levels = c(0, 1),
  labels = c("No", "Yes")
)

# =====================
# Save cleaned data
# =====================

write.csv(bio_complete, "output/clean_data.csv", row.names = FALSE)
write.csv(test_1_summary, "output/table_toothgrowth.csv", row.names = FALSE)