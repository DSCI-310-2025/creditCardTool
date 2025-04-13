test_that("make_target_plot creates a ggplot", {
  df <- data.frame(default_payment_next_month = c(0, 1, 1, 0))
  p <- make_target_plot(df)
  expect_s3_class(p, "ggplot")
})
