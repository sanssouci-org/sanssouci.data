context("fMRI data (Localizer)")

test_that("Vanilla tests for Localizer data", {
    data(fMRI_localizer)
    dat <- fMRI_localizer
    expect_equal(nrow(dat),  48900)
    expect_equal(ncol(dat), 30)
    cn <- colnames(dat)
    tab <- table(cn)
    expect_identical(names(tab), c("left", "right"))
    expect_true(tab[1] == 15)
    expect_true(tab[2] == 15)
})

