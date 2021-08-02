rt <- data.table::fread(file ="C:\\Users\\asus\\Documents\\WeChat Files\\wxid_mcrkclwcdrbp22\\FileStorage\\File\\2021-08\\Y(1).txt")

fit<-rms::lrm(GROUP~RPL8+OAS2+NFAT5+DROSHA+NONHSAT093153.2+NONHSAT209004.1+NONHSAT118924.2,rt)
r <- roc(fit,model=T)
ggplot(r)
