context("Gene expression data (ALL)")

test_that("Vanilla tests for ALL data", {
    data("expr_ALL")
    dat <- expr_ALL
    expect_equal(nrow(dat), 9038)
    expect_equal(ncol(dat), 79)
    cn <- colnames(dat)
    tab <- table(cn)
    expect_identical(names(tab), c("BCR/ABL", "NEG"))
    expect_true(tab[1] == 37)
    expect_true(tab[2] == 42)
})


test_that("Tests for expr_ALL gene annotation data", {
    data("expr_ALL")
    data("expr_ALL_annotation")

    ids <- rownames(expr_ALL)
    ann_ids <- expr_ALL_annotation[["ensembl_gene_id"]]
    expect_true(all(ann_ids %in% ids))

    chr <- expr_ALL_annotation[["chromosome_name"]]
    chrs <- c(as.character(1:22), "X", "Y")
    expect_true(all(chr %in% chrs))

    spos <- expr_ALL_annotation[["start_position"]]
    epos <- expr_ALL_annotation[["end_position"]]
    expect_true(all(epos > spos))
})


test_that("Tests for GO annotation data", {
    data("expr_ALL")
    data("expr_ALL_GO")

    expect_equal(nrow(expr_ALL_GO), 9038)
    expect_equal(ncol(expr_ALL_GO), 144)

    ids <- rownames(expr_ALL)
    ann_ids <- rownames(expr_ALL_GO)
    expect_true(identical(ids, ann_ids))

    expect_true(all(expr_ALL_GO %in% c(0,1)))
})
