# get the Harvard-Oxford brain atlas using nilearn
from nilearn import datasets

atlas=datasets.fetch_atlas_harvard_oxford('cort-prob-1mm')
regions=nifti_masker.transform(atlas.maps)
labels=atlas.labels
