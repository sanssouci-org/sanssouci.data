context("Gene expression data (COPD)")

test_that("Tests for COPD data", {
 data("expr_COPD")
 dat <- expr_COPD
 expect_equal(nrow(dat), 12531)
 expect_equal(ncol(dat), 136)
 
 data("expr_COPD_design")
 expect_equal(ncol(dat), nrow(expr_COPD_design))
 expect_equal(colnames(dat), rownames(expr_COPD_design))
 expect_equal(ncol(expr_COPD_design), 11)
})
