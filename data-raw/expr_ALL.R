## code to prepare `expr_ALL` dataset goes here
data("ALL", package = "ALL")

## Reduce to just two conditions
bcell <- grep("^B", as.character(ALL$BT))
moltyp <- which(as.character(ALL$mol.biol) %in% c("NEG", "BCR/ABL"))
ALL_bcrneg <- ALL[, intersect(bcell, moltyp)]
expr_ALL <- Biobase::exprs(ALL_bcrneg)
colnames(expr_ALL) <- factor(ALL_bcrneg$mol.biol)

str(expr_ALL)
# num [1:12625, 1:79] 7.6 5.05 3.9 5.9 5.93 ...
# - attr(*, "dimnames")=List of 2
# ..$ : chr [1:12625] "1000_at" "1001_at" "1002_f_at" "1003_s_at" ...
# ..$ : chr [1:79] "BCR/ABL" "NEG" "BCR/ABL" "NEG" ...

usethis::use_data(expr_ALL, overwrite = TRUE, internal = FALSE)
