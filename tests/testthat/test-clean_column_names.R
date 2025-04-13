test_that("clean_column_names makes names snake_case", {
  df <- data.frame("My Col" = 1:3)
  cleaned <- clean_column_names(df)
  expect_true("my_col" %in% names(cleaned))
})
