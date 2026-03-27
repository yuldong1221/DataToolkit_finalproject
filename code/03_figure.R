# 03_figure.R

library(ggplot2)

data <- read.csv("output/clean_data.csv")

# Histogram
png("output/hist_biomarker.png")
ggplot(data, aes(x = biomarker)) +
  geom_histogram(binwidth = 0.5) +
  labs(title = "Biomarker Distribution")
dev.off()

# Boxplot
png("output/boxplot_biomarker.png")
ggplot(data, aes(x = disease, y = biomarker)) +
  geom_boxplot()
dev.off()

# Scatter
png("output/scatter_age_biomarker.png")
ggplot(data, aes(x = age, y = biomarker)) +
  geom_point()
dev.off()