library("biomaRt")
data(expr_ALL)
affyids <- rownames(expr_ALL)
rm(expr_ALL)
ensembl <- useMart("ensembl",dataset = "hsapiens_gene_ensembl")
annot <- getBM(attributes = c('affy_hg_u95av2', 'hgnc_symbol', 'chromosome_name',
                              'start_position', 'end_position', 'band'),
               filters = 'affy_hg_u95av2',
               values = affyids,
               mart = ensembl)
head(annot, 3)
# affy_hg_u95av2 hgnc_symbol chromosome_name start_position end_position   band
# 1      1633_g_at        PIM2               X       48913182     48919024 p11.23
# 2        1652_at        PIM2               X       48913182     48919024 p11.23
# 3        1487_at       ESRRA              11       64305524     64316743  q13.1

# drop weird chromosome names
chrs <- c(as.character(1:22), "X", "Y")
ww <- which(annot$chromosome_name %in% chrs)
annot <- annot[ww, ]

## total number of probes annotated
length(unique(annot$affy_hg_u95av2))

##  probes with many matches
head(sort(table(annot$affy_hg_u95av2), decreasing = TRUE))
annot[grep("31463_s_at", annot$affy_hg_u95av2), ]

# drop non-unique affy ids
gnames <- names(which(table(annot$affy_hg_u95av2) == 1))
mm <- match(gnames, annot$affy_hg_u95av2)
expr_ALL_annotation <- annot[mm, ]

head(expr_ALL_annotation)
usethis::use_data(expr_ALL_annotation, overwrite = TRUE, internal = FALSE)
