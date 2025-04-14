
<!-- README.md is generated from README.Rmd. Please edit that file -->

# creditCardTool

<!-- badges: start -->

[![R-CMD-check](https://github.com/DSCI-310-2025/creditCardTool/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/DSCI-310-2025/creditCardTool/actions/workflows/R-CMD-check.yaml)
[![pkgdown](https://github.com/DSCI-310-2025/creditCardTool/actions/workflows/pkgdown.yaml/badge.svg)](https://DSCI-310-2025.github.io/creditCardTool/)
[![License:
MIT](https://img.shields.io/badge/license-MIT-yellow.svg)](LICENSE.md)
[![R](https://img.shields.io/badge/R-%3E=4.0.0-blue)](https://cran.r-project.org/)
[![dev-version](https://img.shields.io/badge/dev%20version-0.0.0.9000-brightgreen)](https://github.com/DSCI-310-2025/creditCardTool)
<!-- badges: end -->

The `creditCardTool` package provides helper functions for analyzing
credit card default data, including data cleaning, splitting,
visualization, and summarization.

It is designed to support modular, reusable components of a typical data
science pipeline.

## Dependencies

This package depends on the following R packages:

- [`ggplot2`](https://ggplot2.tidyverse.org/): for visualizations
- [`dplyr`](https://dplyr.tidyverse.org/): for data manipulation
- [`tidyr`](https://tidyr.tidyverse.org/): for reshaping data
- [`tibble`](https://tibble.tidyverse.org/): for modern data frames
- [`janitor`](https://github.com/sfirke/janitor): for cleaning column
  names
- [`caret`](https://topepo.github.io/caret/): for confusion matrix and
  metrics
- [`class`](https://stat.ethz.ch/R-manual/R-devel/library/class/html/00Index.html):
  for the KNN model
- [`utils`](https://stat.ethz.ch/R-manual/R-devel/library/utils/html/00Index.html):
  for writing files
- [`testthat`](https://testthat.r-lib.org/): for unit testing

All dependencies are installed automatically when installing the package
with [`pak`](https://pak.r-lib.org/):

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

## Code of Conduct

Please note that the
[`creditCardTool`](https://github.com/DSCI-310-2025/creditCardTool)
project is released with a [Code of Conduct](CODE_OF_CONDUCT.md).  
By contributing to this project, you agree to abide by its terms.

## Licenses

This project is dual-licensed under the following:

- [Creative Commons Attribution 4.0 International (CC BY
  4.0)](https://creativecommons.org/licenses/by/4.0/):  
  For non-code assets (e.g., figures, documentation, text).  
  You may share and adapt the materials with appropriate credit.

- [MIT License](LICENSE.md):  
  A permissive software license for all code assets (e.g., scripts,
  functions, analysis files).  
  You can use, modify, and distribute the code with attribution.

------------------------------------------------------------------------
