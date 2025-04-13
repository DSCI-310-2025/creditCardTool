test_that("compute_avg_amounts adds avg columns and removes bill/pay columns", {
  df <- data.frame(
    bill_amt1 = c(100, 200),
    bill_amt2 = c(300, 400),
    pay_amt1 = c(10, 20),
    pay_amt2 = c(30, 40)
  )
  result <- compute_avg_amounts(df)

  expect_true("avg_bill_amt" %in% names(result))
  expect_true("avg_pay_amt" %in% names(result))

  # Only test that original columns are gone, not ones like avg_bill_amt
  expect_false(any(names(result) %in% c("bill_amt1", "bill_amt2", "pay_amt1", "pay_amt2")))
})
