#
# The following file demonstrates how to produce and save
# publication-ready graphs in base R.
#

# Preliminaries #

# Remove the # symbol below to install a new package on your machine - only do this once

#install.packages("RColorBrewer")
library(RColorBrewer)
display.brewer.all() # view available colour palettes

# Data Prep #

natsal <- read.table("https://raw.githubusercontent.com/DiarmuidM/data-analysis-for-the-social-sciences-2022/main/lessons/data/natsal_3_teaching_open.tab", header=TRUE, na="NA", sep="\t")
head(natsal) # view the first six observations

natsal$religimp <- factor(natsal$religimp, levels = c(1,2,3,4), labels = c("Very important", "Fairly important", 
                                                                           "Not very important", "Not important at all"))
natsal$agrp <- factor(natsal$agrp, levels = c(1,2,3,4,5,6), labels = c("16-24", "25-34", "35-44", "45-54", "55-64", "65-74"))

natsal$rsex <- factor(natsal$rsex, levels = c(1,2), labels = c("Male", "Female"))

natsal$ethnicgrp <- factor(natsal$ethnicgrp, levels = c(1,2), labels = c("White", "Non-white"))

natsal$dage1ch[natsal$dage1ch==-1 | natsal$dage1ch==99] <- NA # convert "-1" and "99" to missing

# Univariate #

## Categorical

relig_table <- round(prop.table(table(natsal$religimp))* 100, 0) # store the results of the `table()` command in an object called 'relig_table'

colours <- brewer.pal(4, "Greys") # select 4 colours from the "Greys" palette

# Make you run the following three commands at the same time in order to save the graph

png("figure1_religimp.png", width = 600, height = 480) # save graph as .png file - make you can find this file!
barplot(relig_table, main="Religious importance",
        xlab="Importance of religion", ylab="% of respondents", col = colours, 
        legend = F)
dev.off()

# Note that you may need to change the width and height of the graph
# to ensure the labels are visible.

## Numeric

png("figure2_dage1ch.png", width = 600, height = 480) # save graph as .png file - make you can find this file!
hist(natsal$dage1ch, main="Age at birth of first child", xlab="Age of respondent", ylab = "Number of respondents")
dev.off()


# Bivariate #

## Categorical

relig_age_table <- round(prop.table(table(natsal$agrp, natsal$religimp), 1)* 100, 0) # row percentages

colours <- brewer.pal(6, "Blues") # select 6 colours from the "Blues" palette

png("figure3_religimp_age.png", width = 600, height = 480) # save graph as .png file - make you can find this file!
barplot(relig_age_table, main="Religious importance by age group",
        xlab="Importance of religion", ylab="% of respondents", col = colours, 
        legend = rownames(relig_age_table), beside=TRUE, args.legend=list(x="topleft"))
dev.off()

## Numeric

plot(natsal$dage1ch, natsal$attconservative, main="Sexual attitude by age at birth of first child",
     xlab="Age", ylab="Attitude score", col = "dark green", pch = 20)

# Multivariate #
#
# Just produce separate bivariate graphs for the levels of the third variable e.g., a religion by age
# graph for males and females separately, and place them side-by-side in your report.
#
