# 1- get (probe-level) ALL data
data("ALL", package = "ALL")

## Reduce to just two conditions
bcell <- grep("^B", as.character(ALL$BT))
moltyp <- which(as.character(ALL$mol.biol) %in% c("NEG", "BCR/ABL"))
ALL_bcrneg <- ALL[, intersect(bcell, moltyp)]
dat <- Biobase::exprs(ALL_bcrneg)
colnames(dat) <- factor(ALL_bcrneg$mol.biol)

str(dat)
# num [1:12625, 1:79] 7.6 5.05 3.9 5.9 5.93 ...
# - attr(*, "dimnames")=List of 2
# ..$ : chr [1:12625] "1000_at" "1001_at" "1002_f_at" "1003_s_at" ...
# ..$ : chr [1:79] "BCR/ABL" "NEG" "BCR/ABL" "NEG" ...


# 2- Get probe annotation
library("biomaRt")
affyids <- rownames(dat)
ensembl <- useMart("ensembl",dataset = "hsapiens_gene_ensembl")
annot <- getBM(attributes = c('affy_hg_u95av2', 'ensembl_gene_id', 'chromosome_name',
                              'start_position', 'end_position', 'band'),
               filters = 'affy_hg_u95av2',
               values = affyids,
               mart = ensembl)
dim(annot)
head(annot, 3)
# affy_hg_u95av2 ensembl_gene_id    chromosome_name start_position end_position band
# 1     32189_g_at ENSG00000276876 CHR_HSCHR20_1_CTG3       64155437     64245898
# 2       32188_at ENSG00000276876 CHR_HSCHR20_1_CTG3       64155437     64245898
# 3     32189_g_at ENSG00000275018 CHR_HSCHR20_1_CTG3       64211718     64278487

# drop weird chromosome names
chrs <- c(as.character(1:22), "X", "Y")
ww <- which(annot$chromosome_name %in% chrs)
annot <- annot[ww, ]
dim(annot)

##  probes with many matches
head(sort(table(annot$affy_hg_u95av2), decreasing = TRUE))
annot[grep("31463_s_at", annot$affy_hg_u95av2), ]

# drop affy ids mapping to several genes
pnames <- names(which(table(annot$affy_hg_u95av2) == 1))
mm <- match(pnames, annot$affy_hg_u95av2)
expr_ALL_annotation <- annot[mm, ]

# 3- use gene-level summaries

# drop non-annotated affy ids
mm <- match(rownames(dat), annot$affy_hg_u95av2)
ww <- which(!is.na(mm))

dat <- dat[ww, ]
dim(dat)
mm <- match(rownames(dat), annot$affy_hg_u95av2)
stopifnot(sum(is.na(mm)) == 0) ## all probe sets are now annotated
length(mm)
gnames <- annot[["ensembl_gene_id"]][mm]

res <- aggregate(x = dat, by = list(gnames), FUN = mean)
dim(res)
res[1:5, 1:4]
# Group.1  BCR/ABL      NEG BCR/ABL.1
# 1 ENSG00000000003 3.878782 3.253360  3.729143
# 2 ENSG00000000419 7.589642 6.074332  7.421220
# 3 ENSG00000000457 4.470342 4.443570  4.794457
# 4 ENSG00000000460 3.393823 3.048992  3.136202
# 5 ENSG00000000938 7.029309 7.414213  7.294503

# final clean up
gnames <- res[, 1]
expr_ALL <- as.matrix(res[, -1])
rownames(expr_ALL) <- gnames
colnames(expr_ALL) <- colnames(dat)
expr_ALL[1:5, 1:4]
dim(expr_ALL)

usethis::use_data(expr_ALL, overwrite = TRUE, internal = FALSE)

# 4- save (gene-level) annotation data
head(annot)
mm <- match(rownames(expr_ALL), annot$ensembl_gene_id)
stopifnot(sum(is.na(mm))==0)
expr_ALL_annotation <- annot[mm, -1]
head(expr_ALL_annotation)
dim(expr_ALL_annotation)

usethis::use_data(expr_ALL_annotation, overwrite = TRUE, internal = FALSE)

