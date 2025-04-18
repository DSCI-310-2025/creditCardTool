#' Create scatter plots of features vs. default status with faceting
#'
#' This function takes a data frame and a character vector of numeric feature column names,
#' and produces a faceted scatter plot showing the relationship between each feature
#' and the binary `default_payment_next_month` status.
#'
#' @param df A data frame containing the features and a column named `default_payment_next_month`.
#' @param features A character vector of column names (features) to plot against default status.
#'
#' @return A `ggplot` object with faceted scatter plots.
#' @export
#'
#' @examples
#' df <- data.frame(
#'   LIMIT_BAL = c(10000, 20000, 30000),
#'   AGE = c(23, 45, 36),
#'   default_payment_next_month = c(0, 1, 0)
#' )
#' make_scatter_facet_plot(df, c("LIMIT_BAL", "AGE"))
make_scatter_facet_plot <- function(df, features) {
  missing <- setdiff(features, colnames(df))
  if (length(missing) > 0) stop(paste("Missing columns:", paste(missing, collapse = ", ")))

  df$default_payment_next_month <- as.factor(df$default_payment_next_month)

  df_long <- df |>
    tidyr::pivot_longer(cols = tidyselect::all_of(features),
                        names_to = "Feature", values_to = "Value")

  ggplot2::ggplot(
    df_long,
    ggplot2::aes(x = Value, y = default_payment_next_month, color = default_payment_next_month)
  ) +
    ggplot2::geom_point(alpha = 0.5) +
    ggplot2::geom_smooth(method = "lm", se = FALSE, linetype = "dashed") +
    ggplot2::facet_wrap(~ Feature, scales = "free_x") +
    ggplot2::labs(
      title = "Scatter Plots of Numeric Features vs Default Payment",
      x = "Feature Value",
      y = "Default Payment (0 = No, 1 = Yes)",
      color = "Default Status"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(
      strip.text = ggplot2::element_text(size = 14),
      axis.text = ggplot2::element_text(size = 12),
      axis.title = ggplot2::element_text(size = 14),
      legend.text = ggplot2::element_text(size = 12),
      legend.title = ggplot2::element_text(size = 14)
    )
}
