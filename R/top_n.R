#' Select top (or bottom) n rows (by value)
#'
#' @description
#' This is a wrapper that uses `dt[order()]` to select the top or bottom entries in each group, ordered by `wt`.
#'
#' @param .data A data.frame or data.table
#' @param n Number of rows to return
#' @param wt (Optional). The variable to use for ordering. If NULL uses the last column in the data.table.
#' @param by `list()` of bare column names to group by
#'
#' @md
#' @export
#'
#' @examples
#' example_dt <- data.table::data.table(
#'   x = 1:5,
#'   y = 6:10,
#'   z = c(rep("a", 3), rep("b", 2)))
#'
#' example_dt %>%
#'   dt_top_n(2, wt = y)
#'
#' example_dt %>%
#'   dt_top_n(2, wt = y, by = z)
dt_top_n <- function(.data, n = 5, wt = NULL, by = NULL) {
  UseMethod("dt_top_n")
}

#' @export
dt_top_n.data.table <- function(.data, n = 5, wt = NULL, by = NULL) {

  if (!is.numeric(n) | length(n) > 1) stop("n must be a single number")

  wt <- enexpr(wt)
  by <- enexpr(by)

  if (is.null(wt)) {
    .data %>%
      dt_slice(1:n, !!by)
  } else {
    .data %>%
      dt_arrange(-!!wt) %>%
      dt_slice(1:n, !!by)
  }
}

#' @export
dt_top_n.data.frame <- function(.data, n = 5, wt = NULL, by = NULL) {
  .data <- as.data.table(.data)
  wt <- enexpr(wt)
  by <- enexpr(by)

  dt_top_n(.data, n, wt = !!wt, by = !!by)
}

