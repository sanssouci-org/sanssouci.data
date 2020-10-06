## code to prepare `brainAtlas` dataset goes here
source_python("data-raw/brain-atlas_Harvard-Oxford.py")

regions <- py$regions
labels <- py$labels[-1]  ## remove 'Background' network
rownames(regions) <- labels
brainAtlas <- regions
str(brainAtlas)

usethis::use_data(brainAtlas, overwrite = TRUE)
