context("Gene expression data (ALL)")

test_that("Vanilla tests for ALL data", {
    data("expr_ALL")
    dat <- expr_ALL
    expect_equal(nrow(dat), 12625)
    expect_equal(ncol(dat), 79)
    cn <- colnames(dat)
    tab <- table(cn)
    expect_identical(names(tab), c("BCR/ABL", "NEG"))
    expect_true(tab[1] == 37)
    expect_true(tab[2] == 42)
})


test_that("Tests for ALL probe annotation data", {
    data("expr_ALL")
    data("expr_ALL_annotation")

    ids <- rownames(expr_ALL)
    ann_ids <- expr_ALL_annotation[["affy_hg_u95av2"]]
    expect_true(all(ann_ids %in% ids))

    chr <- expr_ALL_annotation[["chromosome_name"]]
    chrs <- c(as.character(1:22), "X", "Y")
    expect_true(all(chr %in% chrs))

    spos <- expr_ALL_annotation[["start_position"]]
    epos <- expr_ALL_annotation[["end_position"]]
    expect_true(all(epos > spos))
})
