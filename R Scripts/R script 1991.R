gbdata<-read.csv(file.choose(), header=TRUE)
carperc<-((gbdata$l210003/gbdata$l210002)*100)
homeperc<-(((gbdata$l200001-(gbdata$l200002+gbdata$l200003))/gbdata$l200001)*100)
overperc<-(((gbdata$l230004+gbdata$l230005)/gbdata$l230001)*100)
unempperc<-((gbdata$l080134/gbdata$l080020)*100)
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
gbdata$TDS<-TDS 
quintile <- cut(TDS, quantile(TDS, probs=0:5/5, na.rm=TRUE), include.lowest=TRUE, labels=FALSE)
Townsendscores<-data.frame(gbdata$Zone.ID, gbdata$Zone.name, gbdata$TDS, quintile)
names(Townsendscores)[names(Townsendscores) == "gbdata.Zone.ID"]<-"Zone.ID"
names(Townsendscores)[names(Townsendscores) == "gbdata.Zone.name"]<-"Zone.name"
names(Townsendscores)[names(Townsendscores) == "gbdata.TDS"]<-"TDS"
write.csv(Townsendscores, "insertfilename.csv")