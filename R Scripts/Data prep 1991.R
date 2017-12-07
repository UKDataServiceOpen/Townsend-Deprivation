ire<-read.csv(file.choose(), header=TRUE)
l080020<- (ire$sn080012+ire$sn080166)
l080134<- (ire$sn080078+ire$sn080232)
ire$l080020<-l080020
ire$l080134<-l080134
names(ire)[names(ire)=="sn200001"] <- "l200001"
names(ire)[names(ire)=="sn200002"] <- "l200002"
names(ire)[names(ire)=="sn200003"] <- "l200003"
names(ire)[names(ire)=="sn210002"] <- "l210002"
names(ire)[names(ire)=="sn210003"] <- "l210003"
names(ire)[names(ire)=="sn230001"] <- "l230001"
names(ire)[names(ire)=="sn230003"] <- "l230004"
names(ire)[names(ire)=="sn230004"] <- "l230005"
eng<-read.csv(file.choose(), header=TRUE)
wal<-read.csv(file.choose(), header=TRUE)
scot<-read.csv(file.choose(), header=TRUE)
uk <- Reduce(function(x, y) merge(x, y, all=TRUE),
list(eng, wal, scot, ire))
uk[complete.cases(uk), ]
