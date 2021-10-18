NULL
#' Gene expression profiles of 79 Acute Lymphoblastic Leukemia samples
#'
#' A dataset containing microarray-based gene expression measurements from a cancer study on Acute Lymphoblastic Leukemia.
#'
#' @format A numeric matrix with 9038 rows (genes) and 79 columns (cancer samples).
#' The samples are classified into two subgoups:
#'  \enumerate{
#'  \item{37 samples harbor a specific mutation called "BCR/ABL"}
#'  \item{42 patients do not have the mutation; they are called "NEG" for 'negative'}
#'  }
#'  The column names provide the mutational status ("BCR/ABL" or "NEG").
#'  The row names are gene names (more precisely, probe set ids, which may be mapped to genes)
#'
#' @source \url{https://bioconductor.org/packages/ALL/}
#' @references Sabina Chiaretti, Xiaochun Li, Robert Gentleman, Antonella Vitale, Marco Vignetti, Franco Mandelli, Jerome Ritz, and Robin Foa Gene expression profile of adult T-cell acute lymphocytic leukemia identifies distinct subsets of patients with different response to therapy and survival. Blood, 1 April 2004, Vol. 103, No. 7.
"expr_ALL"

NULL
#' Gene annotation data for the expr_ALL data set
#'
#' @format A numeric matrix with 9038 rows (genes) and 5 columns:
#'  \describe{
#'  \item{ensembl_gene_id}{ENSEMBL gene id, e.g. "ENSG00000000003"}
#'  \item{chromosome_name}{character value in "1":"22" or "X", "Y"}
#'  \item{start_position}{start position of the probe set (in bp)}
#'  \item{end_position}{start position of the probe set (in bp)}
#'  \item{band}{chromosomal band, e.g. "p11.2"}
#'  }
#'
#' @source \url{https://bioconductor.org/packages/release/data/annotation/html/hgu95av2.html}
"expr_ALL_annotation"

#' fMRI data for 30 samples from the Localizer data set
#'
#' Functional Magnetic Resonance Imaging (fMRI) measurements from the Localizer
#' data set
#'
#' @format A numeric matrix with 48900 rows (voxels) and 30 columns (samples).
#'   The samples are classified into two subgoups ("left" vs "right"), as
#'   indicated by the column names. These subgroups correspond to two different
#'   motor tasks the subjects were asked to perform: "left click" vs "right
#'   click".
#'
#' @details To import this data we have used the Python module
#'   [nilearn](http://nilearn.github.io/)
#'
#' @source \url{http://brainomics.cea.fr/localizer/}
#'
#' @references Orfanos, D. P., Michel, V., Schwartz, Y., Pinel, P., Moreno, A.,
#' Le Bihan, D., & Frouin, V. (2017). The brainomics/localizer database.
#' Neuroimage, 144, 309-314.
#'
#' Abraham, A., Pedregosa, F., Eickenberg, M., Gervais, P., Mueller, A.,
#' Kossaifi, J., Gramfort, A., Thirion, B. and Varoquaux, G., 2014. Machine
#' learning for neuroimaging with scikit-learn. Frontiers in neuroinformatics,
#' 8, p.14.
#'
"fMRI_localizer"

#' Harvard-Oxford brain atlas
#'
#' Probabilistic brain atlases covering 48 cortical structural areas, derived
#' from structural data and segmentations.
#'
#' @format A numeric matrix with 48 rows (cortical areas) and 48900 columns
#'   (voxels). Non-zero entries in row \eqn{r} indicate the voxels in the
#'   \eqn{r}-th region. The names of the areas are stored in the row names of
#'   the matrix.
#'
#' @details Obtained via the Python module [nilearn](http://nilearn.github.io/),
#'   thanks to the R package [reticulate](https://rstudio.github.io/reticulate/)
#'
#' @source \url{https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/Atlases}
#'
"brainAtlas"


#' Subset of Gene Ontology terms for the hgu95av2 microarray
#'
#'
#'
#' @format A numeric matrix with 9038 rows (microarray probes) and 631 columns
#'   (GO terms from the Biological Process ontology). Non-zero entries in
#'   column \eqn{c} indicate the probes corresponding to the \eqn{c}-th GO
#'   term. The GO ids are stored in the column names of the matrix.
#'
#' @details Obtained via the Bioconductor packages topGO, hgu95av2.db.
#'
#' @source \url{https://bioconductor.org/packages/hgu95av2.db/}
#'
"hgu95av2_GO_BP"

#' Gene Ontology terms for the expr_ALL data set
#'
#' @format A numeric matrix with :9038 rows (microarray probes) and 144 columns
#'   (selected GO terms). Non-zero entries in column \eqn{c} indicate the probes
#'   corresponding to the \eqn{c}-th GO term. The GO ids are stored in the
#'   column names of the matrix.
#'
#' @details Obtained via the Bioconductor package org.Hs.eg.db
#'
#' @source \url{https://bioconductor.org/packages/org.Hs.eg.db/}
#'
"expr_ALL_GO"

#' Bulk RNAseq matrix of the Cancer Genome Atlas Urothelial Bladder Carcinoma (TCGA-BLCA)
#'
#' @format A numeric matrix with :20146 rows (gens) and 135 columns
#'   (cancer samples). The samples are classified into two subgoups:
#'  \enumerate{
#'  \item{65 samples are in stage ii of an Urothelial Bladder Carcinoma cancer}
#'  \item{70 samples are in stage iii of an Urothelial Bladder Carcinoma cancer}
#'  }
#'  The column names provide the mutational status ("stage ii" or "stage iii").
#'  The row names are gene names 
#'
#'@details Obtained via R packages [curatedTCGAData](https://bioconductor.org/packages/release/data/experiment/html/curatedTCGAData.html)
#'  and [TCGAutils](https://bioconductor.org/packages/release/bioc/html/TCGAutils.html)
#'
#' @source \url{https://www.cancer.org/cancer/bladder-cancer/detection-diagnosis-staging/staging.html}
"RNAseq_blca"
