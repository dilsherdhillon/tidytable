# Suppress R CMD check note
#' @import data.table
#' @importFrom data.table as.data.table copy data.table dcast is.data.table melt
#' @importFrom data.table setattr setDT
#' @importFrom rlang abort caller_env enexpr enexprs expr eval_tidy flatten
#' @importFrom rlang is_formula is_named parse_expr seq2 sym syms
#' @importFrom stats as.formula na.omit setNames
#' @importFrom utils head tail
NULL

globalVariables(c("data", ".","..select_vars", ".count", "na_index", ".new_col",
                  "..all_names", "..final_order_i", "..rows"))
