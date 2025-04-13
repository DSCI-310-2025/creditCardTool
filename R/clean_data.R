#' Clean column names using `janitor::clean_names`
#'
#' Converts all column names in a data frame to consistent `snake_case` format.
#'
#' @param df A data frame with column names to clean.
#'
#' @return A data frame with cleaned column names.
#' @export
#'
#' @examples
#' clean_column_names(data.frame("My Col" = 1:3))
clean_column_names <- function(df) {
  df <- janitor::clean_names(df)
  return(df)
}


#' Split a data frame into training and testing sets
#'
#' Randomly splits a data frame into a training set and a test set based on the given proportion.
#'
#' @param df A data frame to split.
#' @param train_size Proportion of data to use for training (default is 0.8).
#'
#' @return A list with two data frames: `train` and `test`.
#' @export
split_data <- function(df, train_size = 0.8) {
  set.seed(123)  # For reproducibility
  n <- nrow(df)
  train_index <- sample(n, size = floor(train_size * n), replace = FALSE)

  test_index <- setdiff(seq_len(n), train_index)

  train <- df[train_index, , drop = FALSE]
  test  <- df[test_index, , drop = FALSE]

  return(list(train = train, test = test))
}



#' Compute row-wise averages for `BILL_AMT` and `PAY_AMT` columns
#'
#' Adds two new columns: `avg_bill_amt` and `avg_pay_amt` to the data frame,
#' and removes the original billing and payment columns.
#'
#' @param df A data frame containing columns like `bill_amt1` to `bill_amt6`,
#' and `pay_amt1` to `pay_amt6`.
#'
#' @return A modified data frame with average columns and without the original billing/payment columns.
#' @export
compute_avg_amounts <- function(df) {
  bill_amt_cols <- grep("^bill_amt", names(df), value = TRUE)
  pay_amt_cols  <- grep("^pay_amt", names(df), value = TRUE)

  if (length(bill_amt_cols) > 0) {
    df$avg_bill_amt <- rowMeans(df[, bill_amt_cols, drop = FALSE], na.rm = TRUE)
  }

  if (length(pay_amt_cols) > 0) {
    df$avg_pay_amt <- rowMeans(df[, pay_amt_cols, drop = FALSE], na.rm = TRUE)
  }

  df <- df[, !names(df) %in% c(bill_amt_cols, pay_amt_cols), drop = FALSE]
  return(df)
}
