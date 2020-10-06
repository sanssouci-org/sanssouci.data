context("Harvard-Oxford brain Atlas")

test_that("Vanilla tests for Harvard-Oxford brain Atlas", {
    data(brainAtlas)
    expect_equal(nrow(brainAtlas), 48)
    expect_equal(ncol(brainAtlas), 48900)
})

test_that("Match between fMRI data and brain Atlas", {
    data(fMRI_localizer)
    data(brainAtlas)
    expect_equal(ncol(brainAtlas), nrow(fMRI_localizer))
})

