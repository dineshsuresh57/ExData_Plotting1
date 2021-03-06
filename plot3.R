#Set the working directory
setwd("C:\\assessment_4\\final_code")
#Read the data
pwrcons <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings ="?")
#Combining the data & time
pwrcons$datetime <- strptime(paste(pwrcons$Date, pwrcons$Time), format = "%d/%m/%Y %H:%M:%S")
#Subsetting the two days data for plotting
plot_data <- subset(pwrcons,datetime>=strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S")
                    & datetime<=strptime("2007-02-02 23:59:59", format = "%Y-%m-%d %H:%M:%S"))
#Plotting the graph
png(filename = "plot3.png", width = 480, height = 480)
with(plot_data, plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(plot_data, lines(datetime, Sub_metering_1, col = "black"))
with(plot_data, lines(datetime, Sub_metering_2, col = "red"))
with(plot_data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", colnames(plot_data[,7:9]), lty = c(1,1,1), col = c("black","red","blue"))
dev.off()