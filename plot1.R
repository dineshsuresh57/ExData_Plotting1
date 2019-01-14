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
png(filename = "plot1.png", width = 480, height = 480)
hist(plot_data$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
dev.off()