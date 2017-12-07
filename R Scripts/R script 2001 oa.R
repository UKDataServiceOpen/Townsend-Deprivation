ukdata<-read.csv(file.choose(), header=TRUE)
carperc<-((ukdata$ks0170002/ukdata$ks0170001)*100)
homeperc<-(((ukdata$ks0180005+ukdata$ks0180006+ukdata$ks0180007+ukdata$ks0180008)/ukdata$ks0180001)*100)
overperc<-(((ukdata$cs0520013+ukdata$cs0520017)/ukdata$cs0520001)*100)
unempperc<-((ukdata$cs0210046/ukdata$cs0210010)*100)
overperc[is.na(overperc)] <- 0
unempperc[is.na(unempperc)] <- 0
carperc[is.na(carperc)] <- 0
homeperc[is.na(homeperc)] <- 0
lnoverperc<-(log(overperc+1))
lnunempperc<-(log(unempperc+1))
zcar<-((carperc-mean(carperc))/sd(carperc))
zhome<-((homeperc-mean(homeperc))/sd(homeperc))
zover<-((lnoverperc-mean(lnoverperc))/sd(lnoverperc))
zunemp<-((lnunempperc-mean(lnunempperc))/sd(lnunempperc))
TDS<- (zcar + zhome + zover + zunemp)
ukdata$TDS<-TDS 
quintile <- cut(TDS, quantile(TDS, probs=0:5/5, na.rm=TRUE), include.lowest=TRUE, labels=FALSE)
Townsendscores<-data.frame(ukdata$Zone.Code, ukdata$TDS, quintile)
names(Townsendscores)[names(Townsendscores) == "ukdata.Zone.Code"]<-"Zone.Code"
names(Townsendscores)[names(Townsendscores) == "ukdata.TDS"]<-"TDS"
write.csv(Townsendscores, "insertfilename.csv")

