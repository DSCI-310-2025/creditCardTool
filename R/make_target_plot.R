#' Create a bar plot of the default payment distribution
#'
#' This function takes a data frame that contains the column `default_payment_next_month`
#' and produces a bar plot showing the distribution of default status.
#'
#' @param df A data frame containing a column named `default_payment_next_month`.
#'
#' @return A `ggplot` object showing the bar plot of default status.
#' @export
#'
#' @examples
#' make_target_plot(df)  # df must include the column `default_payment_next_month`
make_target_plot <- function(df) {
  if (!"default_payment_next_month" %in% colnames(df)) {
    stop("Column 'default_payment_next_month' not found in the dataframe.")
  }
  df$default_payment_next_month <- as.factor(df$default_payment_next_month)

  ggplot2::ggplot(df, ggplot2::aes(x = default_payment_next_month,
                                   fill = default_payment_next_month)) +
    ggplot2::geom_bar() +
    ggplot2::labs(
      title = "Distribution of Default Payments",
      x = "Default (0 = No, 1 = Yes)",
      y = "Count"
    ) +
    ggplot2::theme_minimal()
}
