
<!-- README.md is generated from README.Rmd. Please edit that file -->

# iapdashboardadmin

<!-- badges: start -->

<!-- badges: end -->

Contains functions for collecting trade data via the Comtrade bulk
download API.

## Installation

Install from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("lee269/iapdashboardadmin")
```

## Example workflow

``` r
library(iapdashboardadmin)

# Acquire a number of individual countries annual trade data
get_countries_years(periods = c(2010:2018),
                    reporters = c(152, 156),
                    token = "your token here",
                    dest_folder = "~/downloads",
                    unzip = FALSE)

# Process all the downloaded files and extract only the food data
ffd_trade_data <- merge_ffd(folder = "~/downloads")

# Save for posterity
saveRDS(ffd_trade_data, "~/data/ffd_data.rds")
```

## To do (perhaps)

  - better error detection all round
  - maybe eliminate zip from the process and just return data frames
  - make extract\_ffd able to return HS2 and HS6 if necessary, and/or
    FFD+ data
