#' Extract data from roc() function
#'
#' @param x result of roc() function
#' @param incomparables ignore
#' @param ... ignore
#' @return a dataframe.
#' @name unique
#' @export
#' @method unique roc_coxph
unique.roc_coxph <- function(x, incomparables = FALSE, ...){
    message(tmcn::toUTF8("unique\u5DF2\u88AB\u5F03\u7528,\u8BF7\u7528summary"))
}
#' @rdname unique
#' @export
#' @method unique roc_logit
unique.roc_logit <- function(x, incomparables = FALSE, ...){
    message(tmcn::toUTF8("unique\u5DF2\u88AB\u5F03\u7528,\u8BF7\u7528summary"))
}
#' @rdname unique
#' @export
#' @method unique auc_coxph
unique.auc_coxph <- function(x, incomparables = FALSE, ...){
    message(tmcn::toUTF8("unique\u5DF2\u88AB\u5F03\u7528,\u8BF7\u7528summary"))
}
