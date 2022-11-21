# Week 11 - R Syntax - Inferential Analysis #
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

t.test(natsal$attconservative, na.rm = TRUE)$conf.int # calculate 95% confidence intervals for the mean of `attconservative`

mean(natsal$dage1ch, na.rm = TRUE)

t.test(natsal$dage1ch, na.rm = TRUE)$conf.int # calculate 95% confidence intervals for the mean of `dage1ch`

round(prop.table(table(natsal$religimp)) * 100, 0)

install.packages("DescTools") # install the necessary package - only needs to be done once

library(DescTools) # import the package containing the `MultinomCI` command

MultinomCI(table(natsal$religimp)) # 95% confidence interval is the default

# INSERT CODE HERE

CramerV(natsal$religimp, natsal$ethnicgrp)

CramerV(natsal$religimp, natsal$ethnicgrp)

#options(scipen = 999) # surpress display of scientific notation

chisq.test(natsal$religimp, natsal$ethnicgrp)

chisq.test(natsal$religimp, natsal$rsex)

natsal_samp <- natsal[sample(nrow(natsal), 100), ] # randomly sample 100 observations from the dataset

CramerV(natsal_samp$religimp, natsal_samp$ethnicgrp)

chisq.test(natsal_samp$religimp, natsal_samp$rsex)

install.packages("lsr") # install the necessary package - only needs to be done once

library(lsr) # import the package containing the `etaSquared()` command

model <- aov(attconservative ~ agrp, data = natsal)
etaSquared(model)

summary(model)

plot(natsal$dage1ch, natsal$attconservative) # X variable (axis) is listed first, Y variable (axis) second

cor(natsal$dage1ch, natsal$attconservative, use = "complete.obs")

cor.test(natsal$dage1ch, natsal$attconservative, use = "complete.obs")
