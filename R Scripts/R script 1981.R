gbdata<-read.csv(file.choose(), header=TRUE)
carperc<-((gbdata$X81sas100949/gbdata$X81sas100929)*100)
homeperc<-(((gbdata$X81sas100929-gbdata$X81sas100967)/gbdata$X81sas100929)*100)
overperc<-(((gbdata$X81sas100945+gbdata$X81sas100946)/gbdata$X81sas100929)*100)
unempperc<-((gbdata$X81sas090859/gbdata$X81sas090719)*100)
overperc[is.na(unempperc)] <- 0
unempperc[is.na(unempperc)] <- 0
carperc[is.na(unempperc)] <- 0
homeperc[is.na(unempperc)] <- 0
lnoverperc<-(log(overperc+1))
lnunempperc<-(log(unempperc+1))
zcar<-((carperc-mean(carperc))/sd(carperc))
zhome<-((homeperc-mean(homeperc))/sd(homeperc))
zover<-((lnoverperc-mean(lnoverperc))/sd(lnoverperc))
zunemp<-((lnunempperc-mean(lnunempperc))/sd(lnunempperc))
TDS<- (zcar + zhome + zover + zunemp)
gbdata$TDS<-TDS 
quintile <- cut(TDS, quantile(TDS, probs=0:5/5, na.rm=TRUE), include.lowest=TRUE, labels=FALSE)
Townsendscores<-data.frame(gbdata$Zone.ID, gbdata$Zone.Name, gbdata$TDS, quintile)
names(Townsendscores)[names(Townsendscores) == "gbdata.Zone.ID"]<-"Zone.ID"
names(Townsendscores)[names(Townsendscores) == "gbdata.Zone.Name"]<-"Zone.Name"
names(Townsendscores)[names(Townsendscores) == "gbdata.TDS"]<-"TDS"
write.csv(Townsendscores, "insertfilename.csv")