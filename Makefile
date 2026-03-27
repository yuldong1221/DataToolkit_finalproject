# Makefile

all: report/final_report.html

# Step 1: clean data
output/clean_data.csv: code/01_clean_data.R
	Rscript code/01_clean_data.R

# Step 2: tables
output/odds_ratios.csv: code/02_table.R output/clean_data.csv
	Rscript code/02_table.R

# Step 3: figures
output/hist_biomarker.png: code/03_figure.R output/clean_data.csv
	Rscript code/03_figure.R

# Step 4: report
report/final_report.html: report/final_report.Rmd output/odds_ratios.csv output/hist_biomarker.png
	Rscript -e "rmarkdown::render('report/final_report.Rmd')"