#' @param rank rank by AUC
#' @rdname ggplot
#' @method ggplot roc_coxph
#' @export
#' @examples
#' library(ggDCA)
#' library(rms)
#' fit <- lrm(status~ANLN+CENPA+GPR182,LIRI)
#' ####        one model ####
#' pp <- roc(fit,
#'           model=TRUE) # one model
#' summary(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit,
#'           x='ANLN') # one x
#' summary(pp)
#' ggplot(pp)
#'
#' \donttest{
#' pp <- roc(fit,
#'           x=c('ANLN','CENPA')) # more x
#' summary(pp)
#' ggplot(pp)
#'
#'
#' pp <- roc(fit,
#'           x=TRUE) # ALL x
#' summary(pp)
#' ggplot(pp)
#'
#'
#' pp <- roc(fit,
#'           model=TRUE, # one model
#'           x=TRUE) # ALL x
#' summary(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit,
#'           model='Three Genes', # specify model name
#'           x=TRUE) # ALL x
#' summary(pp)
#' ggplot(pp)
#'
#' ####        more model   ####
#'
#' fit2 <- lrm(status~ANLN+CENPA,LIRI)
#' pp <- roc(fit,fit2,
#'           model=TRUE) # all model
#' summary(pp)
#' ggplot(pp)
#'
#'
#' pp <- roc(fit,fit2,
#'           model=c('Three Genes','Two Genes')) # specify model names
#' summary(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit,fit2,
#'           x=TRUE,                             # all x
#'           model=c('Three Genes','Two Genes')) # all model
#' summary(pp)
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
#' summary(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit, times=1,
#'           model=TRUE)            # all model
#' summary(pp)
#' ggplot(pp)
#'
#' #----            roc for x
#' pp <- roc(fit, times=1,
#'           x='ANLN')              # one x
#' summary(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit, times=1,
#'           x=c('ANLN','CENPA'))   # more x
#' summary(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit, times=1,
#'           x=TRUE)                # all x
#' summary(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit, times=1,
#'           model=TRUE,            # one model
#'           x=TRUE)                # all x
#' summary(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit, times=1,
#'           model='Three Genes',   # specify model names
#'           x=TRUE)                # all X
#' summary(pp)
#' ggplot(pp)
#'
#' ####        one model, more time ####
#'
#' pp <- roc(fit, times=c(1,2,3,4,5,6),
#'           model=TRUE)            # one model
#' summary(pp)
#' ggplot(pp)
#'
#'
#' pp <- roc(fit, times=c(1,2),
#'           x =  'ANLN')           # one x
#'
#' summary(pp)
#' ggplot(pp)
#'
#'
#' pp <- roc(fit, times=c(1,2,3,4,5,6),
#'           x = c('ANLN','CENPA')) # more x
#' summary(pp)
#' ggplot(pp,ncol = 3)
#'
#'
#' pp <- roc(fit, times=c(1,2),
#'           model=TRUE,            # one model
#'           x = TRUE) # all x
#' summary(pp)
#' ggplot(pp)
#'
#' ####        more models, one time ####
#' fit2 <- cph(Surv(time,status)~ANLN+CENPA,LIRI)
#'
#' pp <- roc(fit,fit2,times=1,
#'           x=TRUE,
#'           model=c('Three Genes','Two Genes'))            #
#' summary(pp)
#' ggplot(pp)
#' ####        more models, more time ####
#' pp <- roc(fit,fit2,times=c(1,2),
#'           model=c('Three Genes','Two Genes'))            #
#' summary(pp)
#' ggplot(pp)
#'
#' pp <- roc(fit,fit2,times=c(1,2),
#'           x=TRUE,
#'           model=c('Three Genes','Two Genes'))            #
#' summary(pp)
#' ggplot(pp)
#' }
ggplot.roc_coxph <- function(data,
                           mapping,
                           color=NULL,
                           lwd=1.05,
                           grid.space=2,
                           rank=FALSE,
                           ncol=NULL,
                           ...,
                           environment = parent.frame()){
    # data=pp
    pp <- as.data.frame(data)
    pp <- as.data.frame(pp)
    mA <- summary(data)
    model=time='forpass'

    if (rank){
        level <- unique(mA$marker[order(mA$AUC,decreasing = TRUE)])
    }else{
        level <- unique(mA$marker)
    }
    pp$marker <-factor(pp$marker,levels = level)
    pp$time <- factor(pp$time,levels = unique(pp$time))
    # length
    (lenmodel <- length(unique(pp$model)))
    (lentime <- length(unique(pp$time)))
    (lenmarker <- length(unique(pp$marker)))

    # plot
    if (lenmodel == 1 & lentime == 1 &lenmarker == 1){
        p <- ggplot(pp)
        p <- p + geom_line(aes_string(x='FP',y='TP'))
    }else if(lenmodel == 1 & lentime == 1 &lenmarker > 1){
        p <- ggplot(pp)
        p <- p + geom_line(aes_string(x='FP',y='TP',color='marker'))
    }else if(lenmodel == 1 & lentime > 1 &lenmarker == 1){
        p <- ggplot(pp)
        p <- p + geom_line(aes_string(x='FP',y='TP',color='time'))
    }else if(lenmodel == 1 & lentime > 1 &lenmarker > 1){
        p <- ggplot(pp)
        p <- p + geom_line(aes_string(x='FP',y='TP',color='marker')) +
            facet_wrap(~time,ncol = ifelse(is.null(ncol),length(unique(pp$time)),ncol))
    }else if(lenmodel > 1 & lentime > 1 & lenmodel == lenmarker){
        p <- ggplot(pp)
        p <- p + geom_line(aes_string(x='FP',y='TP',color='marker')) +
            facet_wrap(~time,ncol = ifelse(is.null(ncol),length(unique(pp$time)),ncol))
    }else if(lenmodel > 1 & lentime == 1 & lenmodel != lenmarker){
        p <- ggplot(pp)
        p <- p + geom_line(aes_string(x='FP',y='TP',color='marker')) +
            facet_wrap(~model,ncol = ifelse(is.null(ncol),length(unique(pp$model)),ncol))
    }else if(lenmodel > 1 & lentime > 1 & lenmodel != lenmarker){
        p <- ggplot(pp)
        p <- p + geom_line(aes_string(x='FP',y='TP',color='marker')) +
            facet_grid(rows = vars(model),
                       cols = vars(time))
    }
    if (!is.null(color)){
        p <- p+scale_color_manual(values = color)
    }
    p +
        xlab('1 - Specificity')+
        ylab('Sensitivity') +
        scale_x_continuous(limits = c(0, 1), expand = c(0, 0)) +
        scale_y_continuous(limits = c(0, 1), expand = c(0, 0)) +
        coord_fixed() +
        theme_bw() +
        geom_abline(intercept = 0, slope = 1, color="gray",
                    linetype="dashed", size=0.75)+
        theme(legend.position = 'right',
              panel.spacing = unit(grid.space, "lines"))
    # legend.title = element_blank()
}


