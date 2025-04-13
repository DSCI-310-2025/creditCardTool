test_that("split_data returns train and test sets", {
  df <- data.frame(x = 1:100)
  result <- split_data(df, 0.7)
  expect_type(result, "list")
  expect_true(all(c("train", "test") %in% names(result)))
  expect_equal(nrow(result$train) + nrow(result$test), nrow(df))
})
