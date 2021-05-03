library("topGO")
library("sansSouci")

# data set-specific code to perform ad hoc gene selection
# (to avoid having too many GO terms)
data(expr_ALL)
dat <- expr_ALL
rm(expr_ALL)
categ <- ifelse(colnames(dat) == "BCR/ABL", 1, 0) # map to 0/1
dex <- data.frame(sansSouci::rowWelchTests(dat, categ))
probeNames <- rownames(dex)
nbProbes <- length(probeNames)

pval <- dex[["p.value"]]
adjp <- p.adjust(pval, method = "BH")
#selected <- probeNames[which(adjp < 0.05)]
selected <- probeNames[which(pval < 0.00001)]
length(selected)
# end data set-specific code

way2GO <- function(probeNames, selected, chipType,
                  ontology = c("CC", "BP", "MF")) {
    nbProbes <- length(probeNames)

    chip.db <- sprintf("%s.db", chipType)
    library(chip.db, character.only = TRUE)
    envir <- eval(as.name(sprintf("%sGO", chipType)))
    gene2GO <- lapply(mget(selected, envir = envir, ifnotfound = NA),
                      names)
    selGO <- unique(unlist(gene2GO))
    envir <- eval(as.name(sprintf("%sGO2PROBE", chipType)))
    go2genes <- lapply(mget(selGO, envir = envir), as.character)

    mat <- matrix(0, nrow = nbProbes, ncol = length(go2genes))
    for (gg in seq_along(go2genes)) {
        mm <- match(go2genes[[gg]], probeNames)
        mat[mm, gg] <- 1
    }
    colnames(mat) <- names(go2genes)
    rownames(mat) <- probeNames
    mat
}

chipType <- "hgu95av2"

## Biological process
hgu95av2_GO_BP <- way2GO(probeNames = probeNames,
                         selected = selected,
                         chipType = chipType,
      ontology = "BP")
str(hgu95av2_GO_BP)
# num [1:9038, 1:18348] 0 0 0 0 0 0 0 0 0 0 ...
# - attr(*, "dimnames")=List of 2
# ..$ : chr [1:9038] "ENSG00000000003" "ENSG00000000419" "ENSG00000000457" "ENSG00000000460" ...
# ..$ : chr [1:18348] "GO:0000002" "GO:0000003" "GO:0000012" "GO:0000017" ...
hist(colSums(hgu95av2_GO_BP), breaks = 100)

#usethis::use_data(hgu95av2_GO_BP, overwrite = TRUE, internal = FALSE)


# ## Molecular function
# hgu95av2_GO_MF <- way2GO(probeNames = probeNames, selected = selected, chipType = chipType,
#                          ontology = "MF", minNbProbes = 5)
# hist(colSums(hgu95av2_GO_MF))
# str(hgu95av2_GO_MF)
# usethis::use_data(hgu95av2_GO_MF, overwrite = TRUE, internal = FALSE)
#
#
# ## Cellular compartment
# hgu95av2_GO_CC <- way2GO(probeNames = probeNames, selected = selected, chipType = chipType,
#                          ontology = "CC", minNbProbes = 5)
# hist(colSums(hgu95av2_GO_CC))
# str(hgu95av2_GO_CC)
# usethis::use_data(hgu95av2_GO_CC, overwrite = TRUE, internal = FALSE)
