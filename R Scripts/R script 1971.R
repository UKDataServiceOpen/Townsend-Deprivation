gbdata<-read.csv(file.choose(), header=TRUE)
carperc<-(gbdata$c71s18_077/10)
homeperc<-(gbdata$c71s18_053/10)
overperc<-((gbdata$c71s18_065+gbdata$c71s18_066)/10)
unempperc<-(((gbdata$c71s05_261+gbdata$c71s05_264+gbdata$c71s05_267)/(gbdata$c71s05_257+gbdata$c71s05_258+gbdata$c71s05_259))*100)
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
Townsendscores<-data.frame(gbdata$Zone.Code, gbdata$Zone.Name, gbdata$TDS, quintile)
names(Townsendscores)[names(Townsendscores) == "gbdata.Zone.Code"]<-"Zone.Code"
names(Townsendscores)[names(Townsendscores) == "gbdata.Zone.Name"]<-"Zone.Name"
names(Townsendscores)[names(Townsendscores) == "gbdata.TDS"]<-"TDS"
write.csv(Townsendscores, "insertfilename.csv")