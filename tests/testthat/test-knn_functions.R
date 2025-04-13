test_that("normalize scales values between 0 and 1", {
  x <- c(1, 5, 10)
  norm_x <- normalize(x)
  expect_true(all(norm_x >= 0 & norm_x <= 1))
  expect_equal(norm_x[1], 0)
  expect_equal(norm_x[3], 1)
})

test_that("split_dataset splits 80/20 without errors", {
  df <- data.frame(x = 1:10)
  split <- split_dataset(df)
  expect_named(split, c("train", "test"))
  expect_equal(nrow(split$train), 8)
  expect_equal(nrow(split$test), 2)
})

test_that("prepare_knn_data outputs train/test sets and labels", {
  df <- data.frame(
    feature1 = 1:10,
    feature2 = 10:1,
    default_payment_next_month = rep(0:1, 5)
  )
  split <- split_dataset(df)
  result <- prepare_knn_data(split$train, split$test, "default_payment_next_month")
  expect_named(result, c("train", "test", "train_labels", "test_labels"))
  expect_true(all(sapply(result$train, is.numeric)))
  expect_equal(length(result$train_labels), nrow(split$train))
})

test_that("evaluate_k_values returns correct structure", {
  train <- data.frame(a = c(0, 1), b = c(1, 0))
  test <- data.frame(a = c(0.2, 0.8), b = c(0.9, 0.1))
  train_labels <- factor(c(0, 1))
  test_labels <- factor(c(0, 1))
  results <- evaluate_k_values(train, test, train_labels, test_labels, k_values = 1:3)
  expect_true(all(c("k", "accuracy") %in% colnames(results)))
  expect_equal(nrow(results), 3)
})

test_that("make_accuracy_plot returns a ggplot object", {
  df <- data.frame(k = 1:5, accuracy = seq(0.6, 0.8, length.out = 5))
  plot <- make_accuracy_plot(df)
  expect_s3_class(plot, "ggplot")
})
