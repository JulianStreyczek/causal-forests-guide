# The Economist's Guide to Causal Forests

This repository contains the code and data accompanying the blog article [**The Economist's Guide to Causal Forests**](https://julianstreyczek.github.io/blog/2022-01-causal-forests-guide).

## Overview

The article demonstrates how to use the `grf` package in R for estimating heterogeneous treatment effects. 
The example analyzes the effect of 401(k) eligibility on household savings using data from the 1990 Survey of Income and Program Participation.

## Quick Start

### Prerequisites

Install the required R packages:

```r
install.packages("grf")
install.packages("foreign")
```

### Running the Code

1. Clone this repository:
   ```bash
   git clone https://github.com/JulianStreyczek/causal-forests-guide.git
   cd causal-forests-guide
   ```

2. Run `code/grf_application_401k.R` using R.

### What the Code does

The script performs the following analysis:
- Loads the SIPP 1991 dataset containing information on 401(k) eligibility and household finances
- Trains a causal forest with 12,000 trees to estimate conditional average treatment effects (CATEs)
- Computes the average treatment effect of 401(k) eligibility on net total financial assets
- Generates visualizations:
  - Histogram of estimated treatment effects across all observations
  - Treatment effect by age with 95% confidence intervals

## Repository Contents

```
causal-forests-guide/
├── README.md                         
├── LICENSE                           # MIT license
├── data/
│   └── sipp1991.dta                  # Survey of Income and Program Participation (1990)
├── code/
│   └── grf_application_401k.R        # R script for causal forest analysis
├── outputs/
│   ├── CATEdistribution.png          # Histogram of treatment effects
│   └── CATEbyAge.png                 # Treatment effects by age with confidence intervals
└── paper/
    └── causalforests.pdf             # PDF version of the guide
```

## Main References

This article builds on the following key papers:

- **Athey, S., & Imbens, G.** (2016). Recursive partitioning for heterogeneous causal effects. *Proceedings of the National Academy of Sciences*, 113(27), 7353-7360.

- **Wager, S., & Athey, S.** (2018). Estimation and inference of heterogeneous treatment effects using random forests. *Journal of the American Statistical Association*, 113(523), 1228-1242.

- **Athey, S., Tibshirani, J., & Wager, S.** (2019). Generalized random forests. *The Annals of Statistics*, 47(2), 1148-1178.

**Software:**
- **grf: Generalized Random Forests** - R package documentation available at https://grf-labs.github.io/grf/index.html

**Dataset source:**
- **Chernozhukov, V., & Hansen, C.** (2004). The effects of 401(k) participation on the wealth distribution: an instrumental quantile regression analysis. *Review of Economics and Statistics*, 86(3), 735-751.

## License

This project is licensed under the [MIT License](LICENSE).

