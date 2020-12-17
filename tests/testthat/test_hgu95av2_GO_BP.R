context("GO/BP annotation for the hgu95av2 microarray")

test_that("Vanilla tests for hgu95av2_GO_BP", {
    skip("Not applicable")
    data("hgu95av2_GO_BP")
    expect_equal(nrow(hgu95av2_GO_BP), 12625)
    expect_equal(ncol(hgu95av2_GO_BP), 631)
})

test_that("Match between fMRI data and brain Atlas", {
    skip("Not applicable")
    data("expr_ALL")
    data("hgu95av2_GO_BP")
    expect_equal(nrow(hgu95av2_GO_BP), nrow(expr_ALL))
})

