# Week 9 - R Syntax #
#
# Open this syntax file in RStudio or create your own file and copy-and-paste synatx as you need it.
#
#

country_ages <- read.csv("https://raw.githubusercontent.com/DiarmuidM/data-analysis-for-the-social-sciences-2022/main/lessons/data/median-age-our-world-in-data.csv", header=TRUE, na="NA")
country_ages_2015 <- country_ages[country_ages$Year==2015,]
summary(country_ages$Age)

sd(country_ages$Age)

natsal <- read.table("https://raw.githubusercontent.com/DiarmuidM/data-analysis-for-the-social-sciences-2022/main/lessons/data/natsal_3_teaching_open.tab", header=TRUE, na="NA", sep="\t")
head(natsal) # view the first six observations

names(natsal)

summary(natsal$attconservative)

natsal$religimp <- factor(natsal$religimp, levels = c(1,2,3,4), labels = c("Very important", "Fairly important", 
                                                                                         "Not very important", "Not important at all"))

table(natsal$religimp)

table(natsal$religimp)

round(prop.table(table(natsal$religimp)) * 100, 0)

barplot(table(natsal$religimp))

natsal$dage1ch[natsal$dage1ch==-1 | natsal$dage1ch==99] <- NA # convert "-1" and "99" to missing

mean(natsal$dage1ch, na.rm=TRUE)  # ignore missing values when calculating the mean

median(natsal$dage1ch, na.rm=TRUE)

summary(natsal$dage1ch)

hist(natsal$dage1ch, breaks = seq(15, 40, by=1)) # each bar represents a single age

barplot(table(natsal$dage1ch))

summary(natsal$attconservative)

mean(natsal$attconservative, na.rm=TRUE) # ignore missing values when calculating the mean

median(natsal$attconservative, na.rm=TRUE) # ignore missing values when calculating the mean)

hist(natsal$attconservative)

summary(natsal$attconservative)

sd(natsal$attconservative, na.rm=TRUE)

