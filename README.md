
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sanssouci.data

<!-- badges: start -->

[![R-CMD-check](https://github.com/sanssouci-org/sanssouci.data/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/sanssouci-org/sanssouci.data/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of sanssouci.data is to provide data sets for the
[sanssouci](https://github.com/pneuvial/sanssouci) package.

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
data(expr_ALL, package = "sanssouci.data")
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
of the [sanssouci](https://github.com/pneuvial/sanssouci) package.

### Gene Ontology (BP)

``` r
data(hgu95av2_GO_BP, package = "sanssouci.data")
str(hgu95av2_GO_BP)
#>  num [1:9038, 1:18348] 0 0 0 0 0 0 0 0 0 0 ...
#>  - attr(*, "dimnames")=List of 2
#>   ..$ : chr [1:9038] "ENSG00000000003" "ENSG00000000419" "ENSG00000000457" "ENSG00000000460" ...
#>   ..$ : chr [1:18348] "GO:0000002" "GO:0000003" "GO:0000012" "GO:0000017" ...
```

This data set contains all 18348 Gene Ontology (GO) terms from the
Biological Process (BP) ontology. Non-zero entries in column ‘c’
indicate the genes corresponding to the ‘c’-th GO term. The GO ids are
stored in the column names of the matrix.

### Gene Ontology (for a subset of genes)

``` r
data("expr_ALL_GO", package = "sanssouci.data")
str(expr_ALL_GO)
#>  num [1:9038, 1:144] 0 0 0 0 0 0 0 0 0 0 ...
#>  - attr(*, "dimnames")=List of 2
#>   ..$ : chr [1:9038] "ENSG00000000003" "ENSG00000000419" "ENSG00000000457" "ENSG00000000460" ...
#>   ..$ : chr [1:144] "GO:0000086" "GO:0000165" "GO:0000278" "GO:0002223" ...
```

This data set contains 144 Gene Ontology (GO) terms (not only from the
BP ontology). Non-zero entries in column ‘c’ indicate the genes
corresponding to the ‘c’-th GO term. The GO ids are stored in the column
names of the matrix.

These GO terms are those containing at least an entry whose associated
$p$-value of the test of differential expression in the `expr_ALL` data
set is less than 0.0001.

### Genome positions

``` r
data("expr_ALL_annotation", package = "sanssouci.data")
head(expr_ALL_annotation)
#>       ensembl_gene_id chromosome_name start_position end_position   band
#> 12313 ENSG00000000003               X      100627108    100639991  q22.1
#> 6389  ENSG00000000419              20       50934867     50958555 q13.13
#> 14797 ENSG00000000457               1      169849631    169894267  q24.2
#> 10005 ENSG00000000460               1      169662007    169854080  q24.2
#> 3778  ENSG00000000938               1       27612064     27635185  p35.3
#> 4936  ENSG00000000971               1      196652043    196747504  q31.3
```

This data set contains the chromosome, start and end position of each of
the genes in the `expr_ALL` data set.

## Data for differential gene expression studies (RNA sequencing)

### Gene expression data set

``` r
data("RNAseq_blca", package = "sanssouci.data")
str(RNAseq_blca)
#>  num [1:20196, 1:270] 426.7 0 0 98.8 1183.2 ...
#>  - attr(*, "dimnames")=List of 2
#>   ..$ : chr [1:20196] "A1BG" "A1CF" "A2BP1" "A2LD1" ...
#>   ..$ : chr [1:270] "II" "II" "II" "II" ...
```

This data set contains gene expression values for 20196 genes in 270
cancer samples. These samples correspond to urothelial bladder cancer
samples with two different stages:

``` r
table(colnames(RNAseq_blca))
#> 
#>  II III 
#> 130 140
```

### Gene Ontology (for a subset of genes)

``` r
data("RNAseq_blca_GO", package = "sanssouci.data")
str(RNAseq_blca_GO)
#>  num [1:20196, 1:362] 0 0 0 0 0 0 0 1 0 0 ...
#>  - attr(*, "dimnames")=List of 2
#>   ..$ : chr [1:20196] "A1BG" "A1CF" "A2BP1" "A2LD1" ...
#>   ..$ : chr [1:362] "GO:0000139" "GO:0000165" "GO:0000166" "GO:0000228" ...
```

This data set contains 362 Gene Ontology (GO) terms. Non-zero entries in
column ‘c’ indicate the genes corresponding to the ‘c’-th GO term. The
GO ids are stored in the column names of the matrix.

These GO terms are those containing at least an entry whose associated
$p$-value of the test of differential expression in the `RNAseq_blca`
data set is less than 0.0001.

## Neuroimaging data set

``` r
data("fMRI_localizer", package = "sanssouci.data")
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
of the [sanssouci](https://github.com/pneuvial/sanssouci) package.
