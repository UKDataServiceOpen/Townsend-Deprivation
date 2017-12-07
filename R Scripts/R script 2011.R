ukdata<-read.csv(file.choose(), header=TRUE)
carperc<-((ukdata$F991/ukdata$F989)*100)
homeperc<-(((ukdata$F2357+ukdata$F2362+ukdata$F2368)/ukdata$F2347)*100)
overperc<-(((ukdata$F2081+ukdata$F2083)/ukdata$F2075)*100)
unempperc<-((ukdata$F248/ukdata$F244)*100)
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
Townsendscores<-data.frame(ukdata$GEO_CODE, ukdata$GEO_LABEL, ukdata$TDS, quintile)
names(Townsendscores)[names(Townsendscores) == "ukdata.GEO_CODE"]<-"geo_code"
names(Townsendscores)[names(Townsendscores) == "ukdata.GEO_LABEL"]<-"geo_label"
names(Townsendscores)[names(Townsendscores) == "ukdata.TDS"]<-"TDS"
write.csv(Townsendscores, "insertfilename.csv")