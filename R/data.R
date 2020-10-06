NULL
#' Gene expression profiles of 79 Acute Lymphoblastic Leukemia samples
#'
#' A dataset containing microarray-based gene expression measurements from a cancer study on Acute Lymphoblastic Leukemia.
#'
#' @format A numeric matrix with 12625 rows (genes) and 79 columns (cancer samples).
#' The samples are classified into two subgoups:
#'  - 37 samples harbor a specific mutation called "BCR/ABL"
#'  - 42 patients do not have the mutation; they are called "NEG" for 'negative'
#'  The column names provide the mutational status ("BCR/ABL" or "NEG").
#'  The row names are gene names (more precisely, probe set ids, which may be mapped to genes)
#'
#' @source \url{https://bioconductor.org/packages/ALL/}
#' @references Sabina Chiaretti, Xiaochun Li, Robert Gentleman, Antonella Vitale, Marco Vignetti, Franco Mandelli, Jerome Ritz, and Robin Foa Gene expression profile of adult T-cell acute lymphocytic leukemia identifies distinct subsets of patients with different response to therapy and survival. Blood, 1 April 2004, Vol. 103, No. 7.
"expr_ALL"
