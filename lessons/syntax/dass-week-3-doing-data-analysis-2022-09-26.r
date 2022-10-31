name <- readline(prompt="Enter name: ")
print(paste("Hi,", name, "enjoy learning more about R and exploring data!"))

x * 5

x <- 10 # create an object called 'x' and give it the value '10'

x * 5 # multiply 'x' by 5

natsal <- read.table("https://raw.githubusercontent.com/DiarmuidM/data-analysis-for-the-social-sciences-2022/main/lessons/data/natsal_3_teaching_open.tab", header=TRUE, na="NA", sep="\t")

natsal

head(natsal)

tail(natsal)

names(natsal)

str(natsal)

summary(natsal$rsex)

summary(natsal$agrp)

summary(natsal$attconservative)

# INSERT CODE HERE

natsal <- read.table("https://raw.githubusercontent.com/DiarmuidM/data-analysis-for-the-social-sciences-2022/main/lessons/data/natsal_3_teaching_open.tab", header=TRUE, na="NA", sep="\t")

head(natsal)

summary(natsal$dage1ch)

natsal_analysis <- subset(natsal, dage1ch > -1 & dage1ch < 99)

nrow(natsal_analysis)

nrow(natsal)

summary(natsal_analysis$dage1ch)
hist(natsal_analysis$dage1ch)

summary(natsal_analysis$attconservative)
hist(natsal_analysis$attconservative)

plot(natsal_analysis$attconservative,natsal_analysis$dage1ch)

cor(natsal_analysis$attconservative, natsal_analysis$dage1ch, use = "complete.obs")

natsal_males <- subset(natsal_analysis, rsex==1) # create a subset of observations containing only male respondents
cor(natsal_males$attconservative, natsal_males$dage1ch, use = "complete.obs")

natsal_females <- subset(natsal_analysis, rsex==2) # create a subset of observations containing only female respondents
cor(natsal_females$attconservative, natsal_females$dage1ch, use = "complete.obs")

natsal_white <- subset(natsal_analysis, ethnicgrpr==1) # create a subset of observations containing only white respondents
cor(natsal_white$attconservative, natsal_white$dage1ch, use = "complete.obs")

natsal_nonwhite <- subset(natsal_analysis, ethnicgrpr==2) # create a subset of observations containing only non-white respondents
cor(natsal_nonwhite$attconservative, natsal_nonwhite$dage1ch, use = "complete.obs")
