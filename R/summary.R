#' Extract data from roc() function
#'
#' @param x result of roc() function
#' @param incomparables ignore
#' @param ... ignore
#' @return a dataframe.
#' @name summary
#' @export
#' @method summary roc_coxph
summary.roc_coxph <- function(x, incomparables = FALSE, ...){
    x <- as.data.frame(x)
    unique(x[,c('model','time','marker','AUC','lower95CI','upper95CI')])
}
#' @rdname summary
#' @export
#' @method summary roc_logit
summary.roc_logit <- function(x, incomparables = FALSE, ...){
    x <- as.data.frame(x)
    unique(x[,c('model','marker','AUC','lower95CI','upper95CI','cutoff.opt')])
}
#' @rdname summary
#' @export
#' @method summary auc_coxph
summary.auc_coxph <- function(x, incomparables = FALSE, ...){
    x <- as.data.frame(x)
    unique(x[,c('model','marker')])
}
