library("reticulate")
source_python("data-raw/fMRI_localizer.py")
# The above will trigger a deprecation warning about encoding. This is (still) fine.

fMRI_localizer <- py$df_fmri_masked
usethis::use_data(fMRI_localizer, overwrite = TRUE)
