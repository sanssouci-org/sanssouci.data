# Source: python notebook: [Massively univariate analysis of a motor task from the Localizer dataset](https://nilearn.github.io/auto_examples/05_advanced/plot_localizer_mass_univariate_methods.html#sphx-glr-auto-examples-05-advanced-plot-localizer-mass-univariate-methods-py)

# ---------------
# setup
# ---------------
import numpy as np
from nilearn import datasets
from nilearn.input_data import NiftiMasker
from nilearn.image import get_data

# ---------------
# load data
# ---------------
n_samples = 16

localizer_dataset_left = datasets.fetch_localizer_contrasts(
    ["left visual click"], n_subjects=n_samples)

localizer_dataset_right = datasets.fetch_localizer_contrasts(
    ["right visual click"], n_subjects=n_samples)

# ---------------
# quality control
# ---------------

tested_var_left = localizer_dataset_left.ext_vars['pseudo']
# Quality check / Remove subjects with bad tested variate
mask_quality_check_left = np.where(tested_var_left != b'n/a')[0]
n_samples_left = mask_quality_check_left.size
contrast_map_filenames_left = [localizer_dataset_left.cmaps[i]
                          for i in mask_quality_check_left]
tested_var_left = tested_var_left[mask_quality_check_left].astype(float).reshape((-1, 1))

tested_var_right = localizer_dataset_right.ext_vars['pseudo']
# Quality check / Remove subjects with bad tested variate
mask_quality_check_right = np.where(tested_var_right != b'n/a')[0]
n_samples_right = mask_quality_check_right.size
contrast_map_filenames_right = [localizer_dataset_right.cmaps[i]
                          for i in mask_quality_check_right]
tested_var_right = tested_var_right[mask_quality_check_right].astype(float).reshape((-1, 1))

# ---------------
# smoothing
# ---------------
smt = 5

nifti_masker = NiftiMasker(
    smoothing_fwhm=smt,
    memory='nilearn_cache', memory_level=1)  # cache options
fmri_masked_left = nifti_masker.fit_transform(contrast_map_filenames_left)
fmri_masked_left=np.transpose(fmri_masked_left)
#fmri_masked_left.shape

fmri_masked_right = nifti_masker.fit_transform(contrast_map_filenames_right)
fmri_masked_right=np.transpose(fmri_masked_right)
#fmri_masked_right.shape

columns_ok_left=["left"]*fmri_masked_left.shape[1]
columns_ok_right=["right"]*fmri_masked_right.shape[1]
columns_ok=columns_ok_left+columns_ok_right
#len(columns_ok)

# ---------------
# Merging samples
# ---------------

import pandas as pd
df_fmri_masked_left=pd.DataFrame(data=fmri_masked_left,columns=columns_ok_left)
df_fmri_masked_right=pd.DataFrame(data=fmri_masked_right,columns=columns_ok_right)
df_fmri_masked=pd.concat([df_fmri_masked_left,df_fmri_masked_right],axis=1)
df_fmri_masked.shape
