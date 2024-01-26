
# Clear Global Environment 
rm(list = ls())


# R Tutorial Creating a Data Frame 

days <- c("Mon","Tus", "Wed", "Thur", "Fri", "Sat", "Sun")
temp <- c(28,30.5,32,31.2,29.3,27.9,26.4)
snowed <- c("T","T","F","F","T","T","F")
RPI_Weather_Week <- data.frame(days,temp,snowed) 
RPI_Weather_Week

head(RPI_Weather_Week)
str(RPI_Weather_Week)
summary(RPI_Weather_Week)

RPI_Weather_Week[1,] # First Row
RPI_Weather_Week[,1] # First Col

RPI_Weather_Week[,'snowed']
RPI_Weather_Week[,'days']
RPI_Weather_Week[,'temp']

RPI_Weather_Week[1:5,c("days","temp")]
RPI_Weather_Week$temp

subset(RPI_Weather_Week,subset = snowed == TRUE)

sorted.snowed <- order(RPI_Weather_Week[,'snowed'])
sorted.snowed

RPI_Weather_Week$temp
dec.snow <- order(RPI_Weather_Week$temp)

dec.snow



#----------- Lab 01 ----------------

setwd("/Users/diegodecabanyes/Desktop/MBA/Data Analytics /Lab01")

EPI_data <- read.csv("2010EPI_data.csv")

names(EPI_data) = EPI_data[1,] # make first row the headers
EPI_data = EPI_data[-1,] # remove the first row
# View(EPI_data)

attach(EPI_data) 	# sets the ‘default’ object
fix(EPI_data) 	# launches a simple data editor
EPI <- as.numeric(EPI)
EPI  # prints out values EPI_data$EPI
tf <- is.na(EPI) # records True values if the value is NA
E <- EPI[!tf] # filters out NA values, new array

# Exercise 1 Data Exploration 
summary(as.numeric(EPI))  # stats 
fivenum(as.numeric(EPI),na.rm=TRUE)
help(stem)
stem(as.numeric(EPI))		 # stem and leaf plot
help(hist)
hist(EPI)
hist(EPI, seq(30., 95., 1.0), prob=TRUE)
help(lines)
lines(density(EPI,na.rm=TRUE,bw=1.)) # or try bw=“SJ”
help(rug)
rug(EPI) 

# Exercise 1 Cumulative Density Function & Examples 
plot(ecdf(EPI), do.points=FALSE, verticals=TRUE)
# Quantile-Quantile?
par(pty="s")
qqnorm(EPI); qqline(EPI)

# Make a Q-Qplot against the generating distribution by: x<-seq(30,95,1)

qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)


# Fitting the distribution in the EPI data set. 


# Exercise 2 Filtering population 
Landlock <- as.numeric(Landlock)
EPILand <- EPI[!Landlock]
ELand <- EPILand[!is.na(EPILand)]
hist(ELand)
hist(ELand, seq(30., 95., 1.0), prob=TRUE)

ELand  
tf <- is.na(ELand)
E <- EPI[!tf]

summary(as.numeric(ELand)) 
fivenum(as.numeric(ELand),na.rm=TRUE)
stem(as.numeric(ELand))		 
hist(ELand)
hist(ELand, seq(30., 95., 1.0), prob=TRUE)
lines(density(ELand,na.rm=TRUE,bw=1.)) 
rug(ELand) 

plot(ecdf(ELand), do.points=FALSE, verticals=TRUE) 

par(pty="s") 
qqnorm(ELand); qqline(ELand)

qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

boxplot(ELand, DALY)
qqplot(ELand, DALY)

boxplot(Eland, ENVHEALTH)
qqplot(ELand, ENVHEALTH)

boxplot(ELand, BIODIVERSITY)
qqplot(ELand, BIODIVERSITY)

boxplot(ELand, AIR_E)
qqplot(ELand, AIR_E)

No_surface_water <- as.numeric(No_surface_water)
boxplot(EPI, No_surface_water)
qqplot(EPI, No_surface_water)

Desert <- as.numeric(Desert)
boxplot(EPI, Desert)
qqplot(EPI, Desert)

High_Population_Density <- as.numeric(High_Population_Density)
boxplot(EPI, High_Population_Density)
qqplot(EPI, High_Population_Density)

EPI_South_Asia_Region <- EPI[EPI_regions == "South Asia"]
EPI_South_Asia_Sub_Region <- EPI[GEO_subregion == "South Asia"]


# Dataset GPW3_GRUMP 
setwd("/Users/diegodecabanyes/Desktop/MBA/Data Analytics /Lab01")
GPW3_GRUMP_data <- read.csv("GPW3_GRUMP_SummaryInformation_2010.csv")
View(GPW3_GRUMP_data)

# Summary Statistics 
PopulationPerUnit <- GPW3_GRUMP_data["PopulationPerUnit"]

tf_2 <- is.na(PopulationPerUnit)
PopulationPerUnit <- PopulationPerUnit[!tf_2]
summary(PopulationPerUnit)

# Histogram 
hist(PopulationPerUnit)

boxplot(PopulationPerUnit~Area, data = GPW3_GRUMP_data)

Area <- GPW3_GRUMP_data["Area"]

# Replace 
Area <- replace(Area, Area == "","NA")
# Drop 
Area <- as.numeric(Area[!is.na(Area == TRUE)])

# qq plot 
qqplot(PopulationPerUnit,Area)

# Density Function 
plot(ecdf(Area), do.points=FALSE, verticals=TRUE)
plot(ecdf(PopulationPerUnit),do.points=FALSE, verticals= TRUE)

# Water Treatment Data set 
rm(list = ls())

setwd("/Users/diegodecabanyes/Desktop/MBA/Data Analytics /Lab01")
Water_Treatment_data <- read.csv("water-treatment.csv")

View(Water_Treatment_data)

test_date <- Water_Treatment_data['DATE']
SED_E <- Water_Treatment_data["SED.E"]

#  Cleaning 
SED_E[SED_E == "?"] <- NA
SED_E <- na.omit(SED_E)


p_H <- Water_Treatment_data["PH.E"]
summary(p_H)

SED_E <- as.numeric(unlist(SED_E))
typeof(SED_E)
summary(SED_E)

boxplot(p_H,SED_E) 
boxplot(p_H,Water_Treatment_data["SS.E"])





