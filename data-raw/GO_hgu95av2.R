library("topGO")

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
selected <- probeNames[which(pval < 0.001)]
length(selected)
# end data set-specific code

way2GO <- function(probeNames, selected, chipType,
                  ontology = c("CC", "BP", "MF"),
                  minNbProbes = 5  # to only keep GO terms with 'enough' genes
                  ) {
    nbProbes <- length(probeNames)

    chip.db <- sprintf("%s.db", chipType)
    library(chip.db, character.only = TRUE)
    envir <- eval(as.name(sprintf("%sGO", chipType)))
    gene2GO <- lapply(mget(selected, envir = envir, ifnotfound = NA),
                      names)
    gene2GO[sapply(gene2GO, is.null)] <- NA

    go2genes <- topGO::annFUN.gene2GO(whichOnto = ontology, gene2GO = gene2GO)
    # keep GO terms with 'enough' genes
    ww <- which(sapply(go2genes, length) > minNbProbes)
    go2g <- go2genes[ww]

    mat <- matrix(0, nrow = nbProbes, ncol = length(go2g))
    for (gg in seq_along(go2g)) {
        mm <- match(go2g[[gg]], probeNames)
        mat[mm, gg] <- 1
    }
    colnames(mat) <- names(go2g)
    rownames(mat) <- probeNames
    mat
}

chipType <- "hgu95av2"

## Biological process
hgu95av2_GO_BP <- way2GO(probeNames = probeNames, selected = selected, chipType = chipType,
      ontology = "BP", minNbProbes = 5)
str(hgu95av2_GO_BP)
# num [1:12625, 1:83] 0 0 0 0 0 0 0 0 0 0 ...
# - attr(*, "dimnames")=List of 2
# ..$ : chr [1:12625] "1000_at" "1001_at" "1002_f_at" "1003_s_at" ...
# ..$ : chr [1:83] "GO:0000122" "GO:0001525" "GO:0001934" "GO:0002576" ...
hist(colSums(hgu95av2_GO_BP))

usethis::use_data(hgu95av2_GO_BP, overwrite = TRUE, internal = FALSE)


# ## Molecular function
# hgu95av2_GO_MF <- way2GO(probeNames = probeNames, selected = selected, chipType = chipType,
#                          ontology = "MF", minNbProbes = 5)
# hist(colSums(hgu95av2_GO_MF))
# str(hgu95av2_GO_MF)
# # num [1:12625, 1:46] 0 0 0 0 0 0 0 0 0 0 ...
# # - attr(*, "dimnames")=List of 2
# # ..$ : chr [1:12625] "1000_at" "1001_at" "1002_f_at" "1003_s_at" ...
# # ..$ : chr [1:46] "GO:0000287" "GO:0000978" "GO:0000981" "GO:0001228" ...
# usethis::use_data(hgu95av2_GO_MF, overwrite = TRUE, internal = FALSE)
#
#
# ## Cellular compartment
# hgu95av2_GO_CC <- way2GO(probeNames = probeNames, selected = selected, chipType = chipType,
#                          ontology = "CC", minNbProbes = 5)
# hist(colSums(hgu95av2_GO_CC))
# str(hgu95av2_GO_CC)
# # num [1:12625, 1:47] 0 0 0 0 0 0 0 0 0 0 ...
# # - attr(*, "dimnames")=List of 2
# # ..$ : chr [1:12625] "1000_at" "1001_at" "1002_f_at" "1003_s_at" ...
# # ..$ : chr [1:47] "GO:0000139" "GO:0000790" "GO:0001726" "GO:0005576" ..
# usethis::use_data(hgu95av2_GO_CC, overwrite = TRUE, internal = FALSE)
