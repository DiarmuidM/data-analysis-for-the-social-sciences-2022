natsal <- read.table("C:/Users/77901764/Dropbox/uws/teaching/dass/datasets/natsal/UKDA-8735-tab/tab/natsal_3_teaching.tab", 
                     header=TRUE, strip.white = TRUE, stringsAsFactors = FALSE,
                     na.strings = c("NA", ""), sep="\t")
head(natsal) # view the first six observations

names(natsal)

summary(natsal$dage1ch)

natsal$dage1ch[natsal$dage1ch==-1 | natsal$dage1ch==99] <- NA # convert "-1" and "99" to missing

summary(natsal$dage1ch)

natsal$dage1ch_copy <- natsal$dage1ch

summary(natsal$dage1ch_copy)

summary(natsal$dage1ch)

natsal$dage1ch_grp <- NA # create a blank variable

natsal$dage1ch_grp[natsal$dage1ch >= 15 & natsal$dage1ch < 20] <- 1 # first age group
natsal$dage1ch_grp[natsal$dage1ch >= 20 & natsal$dage1ch < 25] <- 2 # second age group etc
natsal$dage1ch_grp[natsal$dage1ch >= 25 & natsal$dage1ch < 30] <- 3
natsal$dage1ch_grp[natsal$dage1ch >= 30 & natsal$dage1ch < 35] <- 4
natsal$dage1ch_grp[natsal$dage1ch >= 35 & natsal$dage1ch <= 100] <- 5

natsal$dage1ch_grp <- factor(natsal$dage1ch_grp, levels = c(1,2,3,4,5), labels = c("15-19", "20-24", "25-29", "30-34", "35-40"))

table(natsal$dage1ch_grp)

natsal$dage1ch_grp2 <- cut(natsal$dage1ch, c(15,20,25,30,35,100), right=FALSE, labels=c("15-19", "20-24", "25-29", "30-34", "35-40"))

table(natsal$dage1ch_grp2)

table(natsal$religimp)

natsal$religimp_miss <- factor(natsal$religimp, levels = c(1,2,3,4, 9), labels = c("Very important", "Fairly important", 
                                                                                         "Not very important", "Not important at all",
                                                                                          "Not answered"))

table(natsal$religimp_miss)

natsal$religimp <- factor(natsal$religimp, levels = c(1,2,3,4), labels = c("Very important", "Fairly important", 
                                                                                         "Not very important", "Not important at all"))

table(natsal$religimp)

natsal$rsex <- factor(natsal$rsex, levels = c(1,2), labels = c("Male", "Female"))

table(natsal$rsex)

natsal$ethnicgrp <- factor(natsal$ethnicgrp, levels = c(1,2,9), labels = c("White", "Non-white", "Not answered"))

table(natsal$ethnicgrp)

natsal$sexid <- factor(natsal$sexid, levels = c(1,2,3,4,9), labels = c("Heterosexual/straight", "Gay/lesbian", 
                                                                                   "Bisexual", "Other", "Not answered"))

table(natsal$sexid)

natsal$health <- factor(natsal$health, levels = c(1,2,3,4,5,9), labels = c("Very good", "Good", 
                                                                                   "Fair", "Bad", "Very bad", "Not answered"))

table(natsal$health)

natsal$disabil2 <- factor(natsal$disabil2, levels = c(1,2,3,9), labels = c("None", "Non-limiting", 
                                                                                   "Limiting", "Not answered"))

table(natsal$disabil2)

natsal$drink <- factor(natsal$drink, levels = c(1,2,9), labels = c("Yes", "No", "Not answered"))

table(natsal$drink)

natsal$alcohol2 <- factor(natsal$alcohol2, levels = c(0,1,2,9), labels = c("None", "Not more than recommended", 
                                                                                       "More than recommended", "Not answered"))

table(natsal$alcohol2)

natsal$smoking <- factor(natsal$smoking, levels = c(1,2,3,4,9), labels = c("Non-smoker", "Ex-smoker", 
                                                                                       "Light smoker", "Heavy smoker", "Not answered"))

table(natsal$smoking)

natsal$drcannabis <- factor(natsal$drcannabis, levels = c(0,1,-1,9), labels = c("No", "Yes", 
                                                                                            "Not applicable", "Not answered"))

table(natsal$drcannabis)

natsal$drampheta <- factor(natsal$drampheta, levels = c(0,1,-1,9), labels = c("No", "Yes", 
                                                                                            "Not applicable", "Not answered"))

table(natsal$drampheta)

natsal$drcocaine <- factor(natsal$drcocaine, levels = c(0,1,-1,9), labels = c("No", "Yes", 
                                                                                            "Not applicable", "Not answered"))

table(natsal$drcocaine)

natsal$drcrack <- factor(natsal$drcrack, levels = c(0,1,-1,9), labels = c("No", "Yes", 
                                                                                            "Not applicable", "Not answered"))

table(natsal$drcrack)

natsal$drecstasy <- factor(natsal$drecstasy, levels = c(0,1,-1,9), labels = c("No", "Yes", 
                                                                                            "Not applicable", "Not answered"))

table(natsal$drecstasy)

natsal$drnonihero <- factor(natsal$drnonihero, levels = c(0,1,-1,9), labels = c("No", "Yes", 
                                                                                            "Not applicable", "Not answered"))

table(natsal$drnonihero)

natsal$dracidlsd <- factor(natsal$dracidlsd, levels = c(0,1,-1,9), labels = c("No", "Yes", 
                                                                                            "Not applicable", "Not answered"))

table(natsal$dracidlsd)

natsal$drcrysmeth <- factor(natsal$drcrysmeth, levels = c(0,1,-1,9), labels = c("No", "Yes", 
                                                                                            "Not applicable", "Not answered"))

table(natsal$drcrysmeth)

natsal$dramylnit <- factor(natsal$dramylnit, levels = c(0,1,-1,9), labels = c("No", "Yes", 
                                                                                            "Not applicable", "Not answered"))

table(natsal$dramylnit)

natsal$drothnonpre <- factor(natsal$drothnonpre, levels = c(0,1,-1,9), labels = c("No", "Yes", 
                                                                                            "Not applicable", "Not answered"))

table(natsal$drothnonpre)

natsal$inject2 <- factor(natsal$inject2, levels = c(1,2,-1,9), labels = c("Yes", "No", 
                                                                                            "Not applicable", "Not answered"))

table(natsal$inject2)

natsal$drugsyr2 <- factor(natsal$drugsyr2, levels = c(0,1,2,-1,9), labels = c("No", "Yes, cannabis only",
                                                                                          "Yes, drugs other than cannabis", 
                                                                                          "Not applicable", "Not answered"))

table(natsal$drugsyr2)

natsal$mscore[natsal$mscore==-1 | natsal$mscore==9] <- NA

summary(natsal$mscore)

natsal$depscr <- factor(natsal$depscr, levels = c(0,1), labels = c("Yes", "No"))

table(natsal$depscr)

natsal$attscale <- factor(natsal$attscale, levels = c(1,2,3,4,5,6), labels = c("Opposite sex only", 
                                                                                           "More often opposite sex, and at least once same sex",
                                                                                          "About equally often to opposite sex and same sex",
                                                                                          "More often same sex, and at least once opposite sex",
                                                                                          "Same sex only",
                                                                                          "Never felt sexually attracted to anyone at all"))

table(natsal$attscale)

natsal$expscale <- factor(natsal$expscale, levels = c(1,2,3,4,5,6), labels = c("Opposite sex only", 
                                                                                           "More often opposite sex, and at least once same sex",
                                                                                          "About equally often to opposite sex and same sex",
                                                                                          "More often same sex, and at least once opposite sex",
                                                                                          "Same sex only",
                                                                                          "Never felt sexually attracted to anyone at all"))

table(natsal$expscale)

natsal$hetlife[natsal$hetlife==-1 | natsal$hetlife>=9995] <- NA

summary(natsal$hetlife)

natsal$samlife[natsal$samlife==-1 | natsal$samlife>=9995] <- NA

summary(natsal$samlife)

natsal$marstat <- factor(natsal$marstat, levels = c(1,2,3,4,5,6,7,8,9), labels = c("Single & never married", 
                                                                                           "Married & living with spouse",
                                                                                          "In registered same-sex civil partnership & living with partner",
                                                                                          "Separated but still legally married",
                                                                                          "Divorced",
                                                                                          "Widowed",
                                                                                              "Separated but still legally in same-sex civil partnership",
                                                                                              "Formerly a same-sex civil partner but now legally dissolved",
                                                                                              "Surviving civil partner, partner having died"))

table(natsal$marstat)
