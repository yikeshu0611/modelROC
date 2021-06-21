

#' library(ggDCA)
#' library(rms)
#' fit <- lrm(status~ANLN+CENPA+GPR182,LIRI)
#' ####        one model ####
#' pp <- roc(fit,
#'           model=TRUE) # one model
#' unique(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit,
#'           x='ANLN') # one x
#' unique(pp)
#' ggplot(pp)
#'
#' \donttest{
#' pp <- roc(fit,
#'           x=c('ANLN','CENPA')) # more x
#' unique(pp)
#' ggplot(pp)
#'
#'
#' pp <- roc(fit,
#'           x=TRUE) # ALL x
#' unique(pp)
#' ggplot(pp)
#'
#'
#' pp <- roc(fit,
#'           model=TRUE, # one model
#'           x=TRUE) # ALL x
#' unique(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit,
#'           model='Three Genes', # specify model name
#'           x=TRUE) # ALL x
#' unique(pp)
#' ggplot(pp)
#'
#' ####        more model   ####
#'
#' fit2 <- lrm(status~ANLN+CENPA,LIRI)
#' pp <- roc(fit,fit2,
#'           model=TRUE) # all model
#' unique(pp)
#' ggplot(pp)
#'
#'
#' pp <- roc(fit,fit2,
#'           model=c('Three Genes','Two Genes')) # specify model names
#' unique(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit,fit2,
#'           x=TRUE,                             # all x
#'           model=c('Three Genes','Two Genes')) # all model
#' unique(pp)
#' ggplot(pp)
#'
#' ###  COX ----------
#'
#' fit <- cph(Surv(time,status)~ANLN+CENPA+GPR182,LIRI)
#' range(LIRI$time)
#' ####        one model, one time ####
#' #----            roc for model
#'
#' pp <- roc(fit, times=1,
#'           model='This is model') # one model
#' unique(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit, times=1,
#'           model=TRUE)            # all model
#' unique(pp)
#' ggplot(pp)
#'
#' #----            roc for x
#' pp <- roc(fit, times=1,
#'           x='ANLN')              # one x
#' unique(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit, times=1,
#'           x=c('ANLN','CENPA'))   # more x
#' unique(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit, times=1,
#'           x=TRUE)                # all x
#' unique(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit, times=1,
#'           model=TRUE,            # one model
#'           x=TRUE)                # all x
#' unique(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit, times=1,
#'           model='Three Genes',   # specify model names
#'           x=TRUE)                # all X
#' unique(pp)
#' ggplot(pp)
#'
#' ####        one model, more time ####
#'
#' pp <- roc(fit, times=c(1,2,3,4,5,6),
#'           model=TRUE)            # one model
#' unique(pp)
#' ggplot(pp)
#'
#'
#' pp <- roc(fit, times=c(1,2),
#'           x =  'ANLN')           # one x
#'
#' unique(pp)
#' ggplot(pp)
#'
#'
#' pp <- roc(fit, times=c(1,2,3,4,5,6),
#'           x = c('ANLN','CENPA')) # more x
#' unique(pp)
#' ggplot(pp,ncol = 3)
#'
#'
#' pp <- roc(fit, times=c(1,2),
#'           model=TRUE,            # one model
#'           x = TRUE) # all x
#' unique(pp)
#' ggplot(pp)
#'
#' ####        more models, one time ####
#' fit2 <- cph(Surv(time,status)~ANLN+CENPA,LIRI)
#'
#' pp <- roc(fit,fit2,times=1,
#'           x=TRUE,
#'           model=c('Three Genes','Two Genes'))            #
#' unique(pp)
#' ggplot(pp)
#' ####        more models, more time ####
#' pp <- roc(fit,fit2,times=c(1,2),
#'           model=c('Three Genes','Two Genes'))            #
#' unique(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit,fit2,times=c(1,2),
#'           x=TRUE,
#'           model=c('Three Genes','Two Genes'))            #
#' unique(pp)
#' ggplot(pp)
#' }

