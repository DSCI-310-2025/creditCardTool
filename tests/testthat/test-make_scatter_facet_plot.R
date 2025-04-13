test_that("make_scatter_facet_plot works and returns ggplot", {
  test_df <- data.frame(
    LIMIT_BAL = c(10000, 20000),
    AGE = c(23, 45),
    default_payment_next_month = c(0, 1)
  )

  p <- make_scatter_facet_plot(test_df, c("LIMIT_BAL", "AGE"))
  expect_s3_class(p, "ggplot")
})
