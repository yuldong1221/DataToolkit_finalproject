# 02_table.R

library(dplyr)

data <- read.csv("output/clean_data.csv")

# Logistic regression
y <- ifelse(data$disease == "Yes", 1, 0)

logit_model <- glm(
  y ~ age + sex + biomarker,
  data = data,
  family = binomial
)

# Odds ratios
odds_ratios <- exp(coef(logit_model))

# Save results
write.csv(as.data.frame(odds_ratios), "output/odds_ratios.csv")