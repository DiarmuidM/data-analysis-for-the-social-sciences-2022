# Week 10 - R Syntax #
#
# These are the R commands contained in the Week 10 notebook.
#
# Open this syntax file in RStudio or create your own file and copy-and-paste synatx as you need it.
#

natsal <- read.table("https://raw.githubusercontent.com/DiarmuidM/data-analysis-for-the-social-sciences-2022/main/lessons/data/natsal_3_teaching_open.tab", header=TRUE, na="NA", sep="\t")

head(natsal) # view the first six observations

natsal$religimp <- factor(natsal$religimp, levels = c(1,2,3,4), labels = c("Very important", "Fairly important", 
                                                                            "Not very important", "Not important at all"))

natsal$agrp <- factor(natsal$agrp, levels = c(1,2,3,4,5,6), labels = c("16-24", "25-34", "35-44", "45-54", "55-64", "65-74"))

natsal$rsex <- factor(natsal$rsex, levels = c(1,2), labels = c("Male", "Female"))

natsal$dage1ch[natsal$dage1ch==-1 | natsal$dage1ch==99] <- NA # convert "-1" and "99" to missing

table(natsal$religimp)

barplot(table(natsal$religimp))

table(natsal$agrp, natsal$religimp)

relig_age_table <- table(natsal$agrp, natsal$religimp) # store the results of the `table()` command in an object called 'relig_age_table'

round(prop.table(relig_age_table, 1)* 100, 0) # display row percentages

relig_age_perc_table <- round(prop.table(relig_age_table, 1)* 100, 0)

barplot(relig_age_perc_table, main="Religious importance by age group",
  xlab="Importance of religion", ylab="% of respondents", col = c("red", "grey", "grey", "grey","grey"), 
  legend = rownames(relig_age_perc_table), beside=TRUE, args.legend=list(x="topleft"))

# You only need to run the following line once on your machine
install.packages("DescTools") 

library(DescTools) # import the package containing the `GoodmanKruskalGamma()` command

GoodmanKruskalGamma(natsal$religimp, natsal$agrp)

cor.test(as.numeric(natsal$religimp), as.numeric(natsal$agrp), method="kendall") # Kendall's tau-B

relig_sex_table <- table(natsal$religimp, natsal$rsex) # store the results of the `table()` command in an object called 'relig_age_table'

round(prop.table(relig_sex_table, 2)* 100, 0) # column percentages

CramerV(natsal$religimp, natsal$rsex)

summary(natsal$attconservative)

sd(natsal$attconservative, na.rm=TRUE)

hist(natsal$attconservative)

aggregate(attconservative ~ agrp, data = natsal, mean)

aggregate(attconservative ~ agrp, data = natsal, median)

aggregate(attconservative ~ agrp, data = natsal, sd)

aggregate(attconservative ~ agrp, data = natsal, min)

aggregate(attconservative ~ agrp, data = natsal, max)

boxplot(attconservative ~ agrp,
    data = natsal,
    main = "Attitude to Sex by Age",
    xlab = "Age Group",
    ylab = "Attitude Score",
    col = "steelblue",
    border = "black")

# You only need to run the following line once on your machine
install.packages("lsr")

library(lsr) # import the package containing the `etaSquared()` command

model <- aov(attconservative ~ agrp, data = natsal)
etaSquared(model)

# Run the following three lines at the same time
par(mfrow = c(1, 2))
hist(natsal$dage1ch)
hist(natsal$attconservative)

plot(natsal$dage1ch, natsal$attconservative) # X variable (axis) is listed first, Y variable (axis) second

cor(natsal$dage1ch, natsal$attconservative, use = "complete.obs")

# Run the following two lines at the same time
plot(natsal$dage1ch, natsal$attconservative)
abline(lm(natsal$attconservative ~ natsal$dage1ch))
