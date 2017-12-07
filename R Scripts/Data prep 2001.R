eng<-read.csv(file.choose(), header=TRUE)
wal<-read.csv(file.choose(), header=TRUE)
scot<-read.csv(file.choose(), header=TRUE)
ire<-read.csv(file.choose(), header=TRUE)
names(ire)[names(ire)=="cs3560001"] <- "cs0520001"
names(ire)[names(ire)=="cs3560013"] <- "cs0520013"
names(ire)[names(ire)=="cs3560017"] <- "cs0520017"
uk <- Reduce(function(x, y) merge(x, y, all=TRUE),
list(eng, wal, scot, ire))
uk[complete.cases(uk), ]
