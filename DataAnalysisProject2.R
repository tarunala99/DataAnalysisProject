setwd("~/Downloads/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
u<-tapply(NEI$Emissions,NEI$year,sum)
png('plot1.png')
barplot(u,main="Total PM2.5 Emissions from sources",xlab="year",ylab="Total PM Emissions(Tons)")
dev.off()

setwd("~/Downloads/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
g<-cbind.data.frame(NEI$Emissions[NEI$fips=="24510"],NEI$year[NEI$fips=="24510"])
i<-tapply(g$`NEI$Emissions[NEI$fips == "24510"]`,g$`NEI$year[NEI$fips == "24510"]`,sum)
png('plot2.png')
barplot(i,main="PM2.5 Emissions in Baltimore city",xlab="year",ylab="Total PM Emissions(Tons)")
dev.off()

setwd("~/Downloads/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

e<-split(data.frame(NEI$Emissions[NEI$fips == "24510"],NEI$year[NEI$fips == "24510"]),NEI$type[NEI$fips == "24510"])
png('plot4.png')
count=1
ui<-names(e)
p<-data.frame()
for(t in e)
{
        fd<-tapply(t$NEI.Emissions.NEI.fips.....24510..,t$NEI.year.NEI.fips.....24510..,sum)
        ty<-cbind.data.frame(fd,names(fd),ui[count])
        p<-rbind(p,ty)
        print(fd)
        count<-count+1
}
qplot(names(fd),fd,data=p,facets=.~`ui[count]`,xlab="year",ylab="Total emissions",main="Emissions split according to type")
dev.off()

setwd("~/Downloads/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
t<-merge(NEI,SCC,by="SCC")
s<-data.frame(t$fips,t$SCC.Level.One,t$SCC.Level.Two,t$SCC.Level.Three,t$SCC.Level.Four,t$year,t$Emissions)
w<-grepl("coal",s$t.SCC.Level.One,ignore.case = TRUE)|grepl("coal",s$t.SCC.Level.Two,ignore.case = TRUE)|grepl("coal",s$t.SCC.Level.Three,ignore.case = TRUE)|grepl("coal",s$t.SCC.Level.Four,ignore.case = TRUE)
q<-data.frame(s$t.Emissions[w],s$t.year[w])
b<-tapply(q$s.t.Emissions.w.,q$s.t.year.w.,sum)
png('plot4.png')
barplot(b,main="Total PM2.5 Emissions from coal sources",xlab="year",ylab="Total PM Emissions(Tons)")
dev.off()

setwd("~/Downloads/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
t<-merge(NEI,SCC,by="SCC")
s<-data.frame(t$fips,t$SCC.Level.One,t$SCC.Level.Two,t$SCC.Level.Three,t$SCC.Level.Four,t$year,t$Emissions)
w<-(s$t.fips=="24510")&(grepl("vehicle",s$t.SCC.Level.One,ignore.case = TRUE)|grepl("vehicle",s$t.SCC.Level.Two,ignore.case = TRUE)|grepl("vehicle",s$t.SCC.Level.Three,ignore.case = TRUE)|grepl("vehicle",s$t.SCC.Level.Four,ignore.case = TRUE))
q<-data.frame(s$t.Emissions[w],s$t.year[w])
b<-tapply(q$s.t.Emissions.w.,q$s.t.year.w.,sum)
png('plot5.png')
barplot(b,main="Total PM2.5 Emissions from motor vehicles",xlab="year",ylab="Total PM Emissions(Tons)")
dev.off()

setwd("~/Downloads/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
p<-data.frame()
t<-merge(NEI,SCC,by="SCC")
s<-data.frame(t$fips,t$SCC.Level.One,t$SCC.Level.Two,t$SCC.Level.Three,t$SCC.Level.Four,t$year,t$Emissions)
w<-(s$t.fips=="24510")&(grepl("vehicle",s$t.SCC.Level.One,ignore.case = TRUE)|grepl("vehicle",s$t.SCC.Level.Two,ignore.case = TRUE)|grepl("vehicle",s$t.SCC.Level.Three,ignore.case = TRUE)|grepl("vehicle",s$t.SCC.Level.Four,ignore.case = TRUE))
q<-data.frame(s$t.Emissions[w],s$t.year[w])
b<-tapply(q$s.t.Emissions.w.,q$s.t.year.w.,sum)
ty<-cbind.data.frame(b,names(b),"Baltimore City")
p<-rbind(p,ty)


s<-data.frame(t$fips,t$SCC.Level.One,t$SCC.Level.Two,t$SCC.Level.Three,t$SCC.Level.Four,t$year,t$Emissions)
w<-(s$t.fips=="06037")&(grepl("vehicle",s$t.SCC.Level.One,ignore.case = TRUE)|grepl("vehicle",s$t.SCC.Level.Two,ignore.case = TRUE)|grepl("vehicle",s$t.SCC.Level.Three,ignore.case = TRUE)|grepl("vehicle",s$t.SCC.Level.Four,ignore.case = TRUE))
q<-data.frame(s$t.Emissions[w],s$t.year[w])
b<-tapply(q$s.t.Emissions.w.,q$s.t.year.w.,sum)
ty<-cbind.data.frame(b,names(b),"Los Angeles County")
colnames(p) <- c("Emissions","year","City")
colnames(ty) <- c("Emissions","year","City")
p<-rbind(p,ty)

png('plot6.png')
barplot(b,main="Total PM2.5 Emissions from motor vehicles",xlab="year",ylab="Total PM Emissions(Tons)")
qplot(year,Emissions,data=p,facets=.~`City`,xlab="year",ylab="Total emissions",main="Emissions split according to type")
dev.off()