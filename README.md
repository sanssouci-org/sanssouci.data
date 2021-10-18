
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

## Data for differential gene expression studies (microarrays)

### Gene expression data set

``` r
data(expr_ALL, package = "sansSouci.data")
str(expr_ALL)
#>  num [1:9038, 1:79] 3.88 7.59 4.47 3.39 7.03 ...
#>  - attr(*, "dimnames")=List of 2
#>   ..$ : chr [1:9038] "ENSG00000000003" "ENSG00000000419" "ENSG00000000457" "ENSG00000000460" ...
#>   ..$ : chr [1:79] "BCR/ABL" "NEG" "BCR/ABL" "NEG" ...
```

This data set contains gene expression values for 9038 genes in 79
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

### Gene annotation

``` r
data(hgu95av2_GO_BP, package = "sansSouci.data")
str(hgu95av2_GO_BP)
#>  num [1:9038, 1:18348] 0 0 0 0 0 0 0 0 0 0 ...
#>  - attr(*, "dimnames")=List of 2
#>   ..$ : chr [1:9038] "ENSG00000000003" "ENSG00000000419" "ENSG00000000457" "ENSG00000000460" ...
#>   ..$ : chr [1:18348] "GO:0000002" "GO:0000003" "GO:0000012" "GO:0000017" ...
```

This data set contains 18348 Gene Ontology (GO) terms from the
Biological Process (BP) ontology. Non-zero entries in column ‘c’
indicate the probes corresponding to the ‘c’-th GO term. The GO ids are
stored in the column names of the matrix.

These GO terms are those containing at least an entry whose associated
\(p\)-value of the test of differential expression in the `expr_ALL`
data set is less than 0.00001.

## Data for differential gene expression studies (RNA sequencing)

### Gene expression data set

``` r
data("RNAseq_blca", package = "sansSouci.data")
str(RNAseq_blca)
#>  num [1:20073, 1:135] 54.301 0 0.349 183.744 891.251 ...
#>  - attr(*, "dimnames")=List of 2
#>   ..$ : chr [1:20073] "A1BG" "A1CF" "A2BP1" "A2LD1" ...
#>   ..$ : chr [1:135] "II" "II" "II" "II" ...
```

This data set contains gene expression values for 20073 genes in 135
cancer samples. These samples correspond to urothelial bladder cancer
samples with two different stages:

``` r
table(colnames(RNAseq_blca))
#> 
#>  II III 
#>  65  70
```

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
