# BiocManager::install("org.Hs.eg.db")
library("org.Hs.eg.db")

# data set-specific code to perform ad hoc gene selection
# (to avoid having too many GO terms)
data(RNAseq_blca)
dat <- RNAseq_blca
categ <- ifelse(colnames(dat) == "III", 1, 0) # map to 0/1
dex <- data.frame(sanssouci::rowWilcoxonTests(dat, categ))
probeNames <- rownames(dex)
nbProbes <- length(probeNames)

pval <- dex[["p.value"]]
adjp <- p.adjust(pval, method = "BH")
#selected <- probeNames[which(adjp < 0.05)]
selected <- probeNames[which(pval < 0.0001)]
length(selected)
# end data set-specific code

keytypes(org.Hs.eg.db)

cols <- c("SYMBOL", "GENENAME")
sel <- select(org.Hs.eg.db, keys=selected, columns=cols, keytype="SYMBOL")
head(sel)
dim(sel)

sel <- select(org.Hs.eg.db, keys=selected, columns="GO", keytype="SYMBOL")
head(sel)
dim(sel)
sel <- subset(sel, EVIDENCE == "TAS")
dim(sel)

GOs <- unique(sel$GO)
rev_sel <- select(org.Hs.eg.db, keys=GOs, columns=cols, keytype="GO")
head(rev_sel)
rev_sel <- subset(rev_sel, EVIDENCE == "TAS")

head(rev_sel)
dim(rev_sel)
table(rev_sel$ONTOLOGY)

# map to matrix with genes x go_terms
gnames <- rownames(dat)
tap <- tapply(rev_sel$SYMBOL, INDEX = rev_sel$GO, FUN = function(x){
 y <- numeric(length(gnames))
 y[match(x, gnames)] <- 1
 y
})
go <- Reduce(cbind, tap)
rownames(go) <- gnames
colnames(go) <- names(tap)
dim(go)

# filter
RNAseq_blca_GO <- go[, colSums(go) >= 3]
str(RNAseq_blca_GO)
# num [1:20196, 1:362] 0 0 0 0 0 0 0 1 0 0 ...
# - attr(*, "dimnames")=List of 2
# ..$ : chr [1:20196] "A1BG" "A1CF" "A2BP1" "A2LD1" ...
# ..$ : chr [1:362] "GO:0000139" "GO:0000165" "GO:0000166" "GO:0000228" ...
usethis::use_data(RNAseq_blca_GO, overwrite = TRUE, internal = FALSE)


# retrieve GO TERM (label)
library("GO.db")
keytypes(GO.db)
goat <- select(GO.db, keys=colnames(go), columns="TERM", keytype="GOID")
head(goat)

url_pre <- "https://www.ebi.ac.uk/QuickGO/term/"
names(goat) <- c("id", "label")
goat$url <- paste0(url_pre, goat$id)

dim(goat)


# query ENSEMBL: http://www.ensembl.org/Homo_sapiens/Gene/Summary?g=ENSG00000097007
