library(utils)

proj_path="C:\\soft\\xampp\\htdocs\\example_02\\reports\\20171228_coursera\\exploratory-data-analysis\\course-project-1"
data_path=paste0(proj_path,"\\data")
plot_path=paste0(proj_path,"\\plots")
dir.create(data_path)
dir.create(plot_path)


download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",paste0(data_path,"\\data.zip"))


unzip(paste0(data_path,"\\data.zip"),exdir=data_path)


d=read.csv(
	paste0(data_path,"\\household_power_consumption.txt"),
	sep=';'
)

ds=subset(d,Date %in% c("1/2/2007","2/2/2007"))

nrow(d);nrow(ds)

########################################
# PLOT_03 ##############################
########################################
  
  
plot(
	as.POSIXct(paste(as.Date(ds$Date,format="%d/%m/%Y"), ds$Time) ),
	as.numeric(ds$Sub_metering_1),
	type="l",
    ylab="Global Active Power (kilowatts)", 
	xlab=""
)
	   
lines(as.POSIXct(paste(as.Date(ds$Date,format="%d/%m/%Y"), ds$Time) ),as.numeric(ds$Sub_metering_2),col='red')
lines(as.POSIXct(paste(as.Date(ds$Date,format="%d/%m/%Y"), ds$Time) ),as.numeric(ds$Sub_metering_3),col='blue')
legend(
	"topright", 
	col=c("black", "red", "blue"), 
	lty=1, lwd=2, 
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)


png(paste0(plot_path,"//plot_03.PNG"), width=480, height=480)
dev.off()
