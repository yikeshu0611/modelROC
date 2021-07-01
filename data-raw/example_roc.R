

library(ggDCA)
library(rms)
fit <- lrm(status~ANLN+CENPA+GPR182,LIRI)


####        one model ####
pp <- roc(fit,
          model=TRUE) # one model
summary(pp)
ggplot(pp)
#'
pp <- roc(fit,
          x='ANLN') # one x
summary(pp)
ggplot(pp)
#'
\donttest{
pp1 <- roc(fit,
          x=c('ANLN','CENPA')) # more x
summary(pp)
ggplot(pp)
#'
#'
pp <- roc(fit,
          x=TRUE) # ALL x
summary(pp)
ggplot(pp)
#'
#'
pp <- roc(fit,
          model=TRUE, # one model
          x=TRUE) # ALL x
summary(pp)
ggplot(pp)
#'
pp <- roc(fit,
          model='Three Genes', # specify model name
          x=TRUE) # ALL x
summary(pp)
ggplot(pp)
#'
####        more model   ####
#'
fit2 <- lrm(status~ANLN+CENPA,LIRI)
pp <- roc(fit,fit2,
          model=TRUE) # all model
summary(pp)
ggplot(pp)
#'
#'
pp <- roc(fit,fit2,
          model=c('Three Genes','Two Genes')) # specify model names
summary(pp)
ggplot(pp)
#'
pp <- roc(fit,fit2,
          x=TRUE,                             # all x
          model=c('Three Genes','Two Genes')) # all model
summary(pp)
ggplot(pp)
#'
###  COX ----------
#'
fit <- coxph(Surv(time,status)~ANLN+CENPA+GPR182,LIRI)
range(LIRI$time)
####        one model, one time ####
#----            roc for model
#'
pp <- roc(fit, times=1,
          model='This is model') # one model
summary(pp)
ggplot(pp)
#'
pp <- roc(fit, times=1,
          model=TRUE)            # all model
summary(pp)
ggplot(pp)
#'
#----            roc for x
pp <- roc(fit, times=1,
          x='ANLN')              # one x
summary(pp)
ggplot(pp)
#'
pp <- roc(fit, times=1,
          x=c('ANLN','CENPA'))   # more x
summary(pp)
ggplot(pp)
#'
pp <- roc(fit, times=1,
          x=TRUE)                # all x
summary(pp)
ggplot(pp)
#'
pp <- roc(fit, times=1,
          model=TRUE,            # one model
          x=TRUE)                # all x
summary(pp)
ggplot(pp)
#'
pp <- roc(fit, times=1,
          model='Three Genes',   # specify model names
          x=TRUE)                # all X
summary(pp)
ggplot(pp)
#'
####        one model, more time ####
#'
pp <- roc(fit, times=c(1,2,3,4,5,6),
          model=TRUE)            # one model
summary(pp)
ggplot(pp)
#'
#'
pp <- roc(fit, times=c(1,2),
          x =  'ANLN')           # one x
#'
summary(pp)
ggplot(pp)
#'
#'
pp <- roc(fit, times=c(1,2,3,4,5,6),
          x = c('ANLN','CENPA')) # more x
summary(pp)
ggplot(pp,ncol = 3)
#'
#'
pp <- roc(fit, times=c(1,2),
          model=TRUE,            # one model
          x = TRUE) # all x
summary(pp)
ggplot(pp)
#'
####        more models, one time ####
fit2 <- cph(Surv(time,status)~ANLN+CENPA,LIRI)
#'
pp <- roc(fit,fit2,times=1,
          x=TRUE,
          model=c('Three Genes','Two Genes'))            #
summary(pp)
ggplot(pp)
####        more models, more time ####
pp <- roc(fit,fit2,times=c(1,2),
          model=c('Three Genes','Two Genes'))            #
summary(pp)
ggplot(pp)
#'
pp <- roc(fit,fit2,times=c(1,2),
          x=TRUE,
          model=c('Three Genes','Two Genes'))            #
summary(pp)
ggplot(pp)
}

