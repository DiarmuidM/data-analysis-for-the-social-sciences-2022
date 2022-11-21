# Week 11 - R Syntax - Multivariate Analysis #
#
# These are the R commands contained in the Week 11 notebook.
#
# Open this syntax file in RStudio or create your own file and copy-and-paste synatx as you need it.
#


natsal <- read.table("https://raw.githubusercontent.com/DiarmuidM/data-analysis-for-the-social-sciences-2022/main/lessons/data/natsal_3_teaching_open.tab", header=TRUE, na="NA", sep="\t")
head(natsal) # view the first six observations

natsal$religimp <- factor(natsal$religimp, levels = c(1,2,3,4), labels = c("Very important", "Fairly important", 
                                                                            "Not very important", "Not important at all"))

natsal$agrp <- factor(natsal$agrp, levels = c(1,2,3,4,5,6), labels = c("16-24", "25-34", "35-44", "45-54", "55-64", "65-74"))

natsal$rsex <- factor(natsal$rsex, levels = c(1,2), labels = c("Male", "Female"))

natsal$ethnicgrp <- factor(natsal$ethnicgrp, levels = c(1,2), labels = c("White", "Non-white"))

natsal$dage1ch[natsal$dage1ch==-1 | natsal$dage1ch==99] <- NA # convert "-1" and "99" to missing

summary(natsal$attconservative)

sd(natsal$attconservative, na.rm=TRUE)

hist(natsal$attconservative)

aggregate(attconservative ~ agrp, data = natsal, mean)

aggregate(attconservative ~ rsex, data = natsal, mean)

aggregate(attconservative ~ agrp + rsex, data = natsal, mean)

natsal_16_24 <- natsal[natsal$agrp=="16-24",]
natsal_25_34 <- natsal[natsal$agrp=="25-34",]
natsal_35_44 <- natsal[natsal$agrp=="35-44",]
natsal_45_54 <- natsal[natsal$agrp=="45-54",]
natsal_55_64 <- natsal[natsal$agrp=="55-64",]
natsal_65_74 <- natsal[natsal$agrp=="65-74",]

install.packages("lsr") # install the necessary package - only needs to be done once

library(lsr) # import the package containing the `etaSquared()` command

model <- aov(attconservative ~ rsex, data = natsal_16_24)
etaSquared(model)

model <- aov(attconservative ~ rsex, data = natsal_25_34)
etaSquared(model)

model <- aov(attconservative ~ rsex, data = natsal_35_44)
etaSquared(model)

model <- aov(attconservative ~ rsex, data = natsal_45_54)
etaSquared(model)

model <- aov(attconservative ~ rsex, data = natsal_55_64)
etaSquared(model)

model <- aov(attconservative ~ rsex, data = natsal_65_74)
etaSquared(model)

# INSERT CODE HERE

plot(natsal$dage1ch, natsal$attconservative) # X variable (axis) is listed first, Y variable (axis) second

cor(natsal$dage1ch, natsal$attconservative, use = "complete.obs")

natsal_males <- natsal[natsal$rsex=="Male",] # create a dataset containing only males
natsal_females <- natsal[natsal$rsex=="Female",] # create a dataset containing only females

plot(natsal_males$dage1ch, natsal_males$attconservative)

plot(natsal_females$dage1ch, natsal_females$attconservative)

cor(natsal_males$dage1ch, natsal_males$attconservative, use = "complete.obs")
cor(natsal_females$dage1ch, natsal_females$attconservative, use = "complete.obs")

# INSERT CODE HERE

table(natsal$religimp)

relig_age_table <- table(natsal$agrp, natsal$religimp)
round(prop.table(relig_age_table, 1)* 100, 0) # row percentages

relig_sex_table <- table(natsal$rsex, natsal$religimp)
round(prop.table(relig_sex_table, 1)* 100, 0) # row percentages

ras_table <- table(natsal$agrp, natsal$rsex, natsal$religimp) # create crosstabulation - variable 1 is the control variable,
# variable 2 is the X (predictor) variable, variable 3 is the Y (outcome) variable.

ras_prop_table <- addmargins(prop.table(ras_table, c(1,2)), 3) # calculate proportions

ras_perc_table <- round(ftable(ras_prop_table) * 100, 0) # convert proportions to percentages

ras_perc_table # display table

# INSERT CODE HERE

natsal_16_24 # dataset containing only 16-24 year olds

install.packages("DescTools") # install the necessary package - only needs to be done once

library(DescTools) # import the package containing the `CramerV()` command

CramerV(natsal_16_24$religimp, natsal_16_24$rsex)
CramerV(natsal_25_34$religimp, natsal_25_34$rsex)
CramerV(natsal_35_44$religimp, natsal_35_44$rsex)
CramerV(natsal_45_54$religimp, natsal_45_54$rsex)
CramerV(natsal_55_64$religimp, natsal_55_64$rsex)
CramerV(natsal_65_74$religimp, natsal_65_74$rsex)
