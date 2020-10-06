context("Gene expression data (ALL)")

test_that("Vanilla tests for ALL data", {
    data(expr_ALL)
    dat <- expr_ALL
    expect_equal(nrow(dat), 12625)
    expect_equal(ncol(dat), 79)
    cn <- colnames(dat)
    tab <- table(cn)
    expect_identical(names(tab), c("BCR/ABL", "NEG"))
    expect_true(tab[1] == 37)
    expect_true(tab[2] == 42)
})

