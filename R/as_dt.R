#' Safely work with data.tables
#'
#' Copies a data.table so you can work on it, or converts a data.frame to a data.table.
#'
#' @param .data
#'
#' @return
#' @export
#'
#' @examples
#' example_df <- data.frame(x = 1:10)
#'
#' example_df %>%
#'   as_dt() %>%
#'   .[,let(double_x = x * 2)]
as_dt <- function(.data) {
  if (is.data.table(.data)) {
    copy(.data)
  } else if (is.data.frame(.data)) {
    as.data.table(.data)
  } else {
    stop(".data must be a data.frame or data.table")
  }
}