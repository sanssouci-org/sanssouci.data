
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sansSouci.data

<!-- badges: start -->

[![R build
status](https://github.com/pneuvial/sanssouci.data/workflows/R-CMD-check/badge.svg)](https://github.com/pneuvial/sanssouci.data/actions)
<!-- badges: end -->

The goal of sansSouci.data is to provide data sets for the
[sansSouci](https://github.com/pneuvial/sanssouci) package.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("pneuvial/sanssouci.data")
```

## Gene expression data set

``` r
data(expr_ALL, package = "sansSouci.data")
str(expr_ALL)
#>  num [1:12625, 1:79] 7.6 5.05 3.9 5.9 5.93 ...
#>  - attr(*, "dimnames")=List of 2
#>   ..$ : chr [1:12625] "1000_at" "1001_at" "1002_f_at" "1003_s_at" ...
#>   ..$ : chr [1:79] "BCR/ABL" "NEG" "BCR/ABL" "NEG" ...
```

This data set contains gene expression values for 12625 genes in 79
cancer samples. These samples correspond to two types of Acute
Lymphoblastic Leukemia (ALL):

``` r
table(colnames(expr_ALL))
#> 
#> BCR/ABL     NEG 
#>      37      42
```

This data set is used in the vignette [Permutation-based post hoc
inference for differential gene expression
studies](https://pneuvial.github.io/sanssouci/articles/post-hoc_differential-expression.html)
of the [sansSouci](https://github.com/pneuvial/sanssouci) package.

## Neuroimaging data set

``` r
data("fMRI_localizer", package = "sansSouci.data")
str(fMRI_localizer)
#>  num [1:48900, 1:30] -0.0261 0.3612 0.6768 0.0249 1.0796 ...
#>  - attr(*, "dimnames")=List of 2
#>   ..$ : NULL
#>   ..$ : chr [1:30] "left" "left" "left" "left" ...
```

This data set contains Functional Magnetic Resonance Imaging (fMRI)
measurements corresponding to two motor tasks from the Localizer data
set: “left click” and “right click”:

``` r
table(colnames(fMRI_localizer))
#> 
#>  left right 
#>    15    15
```

This data set is used in the vignette [Permutation-based post hoc
inference for fMRI
studies](https://pneuvial.github.io/sanssouci/articles/post-hoc_fMRI.html)
of the [sansSouci](https://github.com/pneuvial/sanssouci) package.
