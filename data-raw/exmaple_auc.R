

#' library(ggDCA)
#' library(rms)
#' library(modelROC)
#' ###  COX ----------
#'
#' fit <- cph(Surv(time,status)~ANLN+CENPA+GPR182,LIRI)
#'
#' ####        one model, one time ####
#' #----            auc for model
#'
#' r <- auc(fit,
#'           model='This is model') # one model
#' unique(r)
#' ggplot(r)
#'
#' r <- auc(fit,
#'           model=TRUE)            # all model
#' unique(r)
#' ggplot(r)
#'
#' \donttest{
#'
#' #----            auc for x
#' r <- auc(fit,
#'           x='ANLN')              # one x
#' unique(r)
#' ggplot(r)
#'
#' r <- auc(fit,
#'           x=c('ANLN','CENPA'))   # more x
#' unique(r)
#' ggplot(r)
#'
#' r <- auc(fit,
#'           x=TRUE)                # all x
#' unique(r)
#' ggplot(r)
#'
#' r <- auc(fit,
#'           model=TRUE,            # one model
#'           x=TRUE)                # all x
#' unique(r)
#' ggplot(r)
#'
#' r <- auc(fit,
#'           model='Three Genes',   # specify model names
#'           x=TRUE)                # all X
#' unique(r)
#' ggplot(r)
#'
#'
#'
#' ####        more models ####
#' fit2 <- cph(Surv(time,status)~ANLN+CENPA,LIRI)
#'
#'
#' r <- auc(fit,fit2,
#'           model=c('Three Genes','Two Genes'))            #
#' unique(r)
#' ggplot(r)
#'
#'
#'
#' r <- auc(fit,fit2,
#'           model=TRUE,
#'           x=TRUE)
#' unique(r)
#' ggplot(r)
#' }



