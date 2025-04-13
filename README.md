
<!-- README.md is generated from README.Rmd. Please edit that file -->

# creditCardTool

<!-- badges: start -->

[![R-CMD-check](https://github.com/DSCI-310-2025/creditCardTool/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/DSCI-310-2025/creditCardTool/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The `creditCardTool` package provides helper functions for analyzing
credit card default data, including data cleaning, splitting,
visualization, and summarization.

It is designed to support modular, reusable components of a typical data
science pipeline.

## Installation

You can install the development version of creditCardTool from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("DSCI-310-2025/creditCardTool")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(creditCardTool)

# Basic example
split <- split_data(data.frame(x = 1:100), train_size = 0.8)
plot <- make_target_plot(data.frame(default_payment_next_month = c(0, 1, 0, 1)))
```

## Functions

- `split_data()` — Splits a dataset into training and test sets
- `make_target_plot()` — Visualizes the distribution of default payments
- `make_scatter_facet_plot()` — Plots numeric features against default
  status
- `clean_column_names()` — Standardizes column names to snake_case
- `compute_avg_amounts()` — Computes average billing/payment values per
  row

------------------------------------------------------------------------
