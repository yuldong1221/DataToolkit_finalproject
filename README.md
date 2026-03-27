# Final Project

## Overview
This project demonstrates a reproducible data analysis workflow using R. It includes data cleaning, statistical analysis, and visualization.

The project uses:
- Built-in R dataset (ToothGrowth)
- Simulated biological dataset

## Project Structure
data/ # raw data (not required for built-in datasets)  
code/ # R scripts  
output/ # generated results (tables, figures)  
report/ # final report (R Markdown)  
Makefile # automation script  
README.md # project description  

## Data
No external data files are required.  
All datasets are either built-in (ToothGrowth) or generated within the scripts.

## How to Run
To reproduce the results, run:
make

This will:
1. Clean data
2. Generate tables
3. Create figures
4. Render the final report

## Output

- Table: `output/odds_ratios.csv`
- Figure: `output/hist_biomarker.png`
- Report: `report/final_report.html`

## Notes

- The analysis includes logistic regression and basic visualization.
- All results are reproducible using the provided scripts.