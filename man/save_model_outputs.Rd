% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/modelling_abstraction.R
\name{save_model_outputs}
\alias{save_model_outputs}
\title{Save confusion matrix and performance metrics to files}
\usage{
save_model_outputs(predictions, actual, prefix)
}
\arguments{
\item{predictions}{Predicted labels}

\item{actual}{Actual labels}

\item{prefix}{Output file path prefix (no extension)}
}
\description{
Saves confusion matrix and model performance to CSV and TXT files.
}
\examples{
\dontrun{
actual <- factor(c(0, 1, 0, 1))
pred <- factor(c(0, 1, 1, 1))
save_model_outputs(pred, actual, "knn_results")
}

}
