# install.packages("BiocManager")
# BiocManager::install("GEOquery")
library("GEOquery")
library("stringr")
library("dplyr")
library("forcats")

# load series and platform data from GEO
Sys.setenv("VROOM_CONNECTION_SIZE" = 131072 * 10)
gset <- getGEO("GSE42057", GSEMatrix = TRUE, getGPL = FALSE)
gset <- gset[[1]]

Y <- exprs(gset) # already log2 transformed

pheno <- phenoData(gset)
pdata <- pheno@data


# subject/control status
group_chr <- pdata[["source_name_ch1"]]
table(group_chr)
# Control subject PBMC    COPD subject PBMC
# 42                   94

group <- stringr::str_replace(pheno@data[["source_name_ch1"]], " subject PBMC", "")
covar_data <- pheno@data %>%
  select(ends_with(":ch1")) %>%
  rename_with(~gsub(":ch1", "", .x, fixed = TRUE))
str(covar_data)

# drop useless variables
to_drop <- c("tissue", "pctemph_slicer", "pctgastrap_slicer")
covar_data <- covar_data %>%
  select(!all_of(to_drop))

# export to txt files
X <- cbind(group = group,
           covar_data)
str(X)
str(rownames(X))

X <- type.convert(X, as.is = TRUE)

if(all(rownames(X) == colnames(Y))){
  print("OK ! Same observations between Y and X")
} else {
  joint_obs <- base::intersect(rownames(X), colnames(Y))
  X <- X[joint_obs,]
  Y <- Y[,joint_obs]
}

if(sum(is.na(X))!=0){
  keep.nonNA <- which(!rowAnyMissings(as.matrix(X)))
  Y <- Y[, keep.nonNA]
  X <- X[keep.nonNA, ]
}

str(X)
str(rownames(X))

expr_COPD_design <- X
expr_COPD <- round(Y, 4) ## save some space/bandwidth
usethis::use_data(expr_COPD, expr_COPD_design, overwrite = TRUE, internal = FALSE)
