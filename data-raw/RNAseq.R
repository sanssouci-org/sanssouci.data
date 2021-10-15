library("curatedTCGAData")
library("TCGAutils")

# 1 - get bulk RNAseq data
blca <- curatedTCGAData("BLCA", "RNA*", dry.run = FALSE)
head(getSubtypeMap(blca))
annot <- colData(blca)[, getClinicalNames("BLCA")]
blca <- blca[[1]]

X <- assays(blca)[[1]]
str(X) 
sample_type <- substr(colnames(X), 14, 16)
tumors <- which(sample_type %in% c("01A", "01B"))
X <- X[, tumors]
colnames(X) <- substr(colnames(X), 1, 12)

# ref for BLCA stages: 
# https://www.cancer.org/cancer/bladder-cancer/detection-diagnosis-staging/staging.html
# reduce to two conditions
idx_0 <- which(annot$pathologic_stage == "stage ii")
idx_1 <- which(annot$pathologic_stage == "stage iii")
s_0 <- rownames(annot)[idx_0]
s_1 <- rownames(annot)[idx_1]

X0 <- X[, match(s_0, colnames(X))]
X1 <- X[, match(s_1, colnames(X))]
Y <- cbind(X0, X1)

groups <- rep(c(0, 1), times = c(ncol(X0), ncol(X1)))

# drop 0 genes
ww <- which(rowSums(Y) == 0)
length(ww)
Y <- Y[-ww, ]

bulkRNAseq <- as.matrix(Y)
colnames(bulkRNAseq) <- groups


usethis::use_data(bulkRNAseq, overwrite = TRUE, internal = FALSE)