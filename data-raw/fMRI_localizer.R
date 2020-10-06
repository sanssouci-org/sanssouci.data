library("reticulate")
source_python("data-raw/fMRI_localizer.py")
# The above will trigger a deprecation warning about encoding. This is (still) fine.

fMRI_localizer <- as.matrix(py$df_fmri_masked)

str(fMRI_localizer)
# num [1:48900, 1:30] -0.0261 0.3612 0.6768 0.0249 1.0796 ...
# - attr(*, "dimnames")=List of 2
# ..$ : NULL
# ..$ : chr [1:30] "left" "left" "left" "left" ...

usethis::use_data(fMRI_localizer, overwrite = TRUE)
