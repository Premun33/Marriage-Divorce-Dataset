library(tidyverse)
library(rpart)
library(rpart.plot)
library(tree)
#library(installr)


# NUMBER 1
# Shorten variable names to look nicer in matrix
ageGap<-Processed_Marriage_Divorce_DB$`Age Gap`
economicSimilarities<-Processed_Marriage_Divorce_DB$`Economic Similarity`
commonInterests<-Processed_Marriage_Divorce_DB$`Common Interests`
divorceScore<-Processed_Marriage_Divorce_DB$`Divorce Score`

# Create data frame
cov_matrix<-data.frame(ageGap,commonInterests,divorceScore,economicSimilarities)

# Create covariance matrix with the given variables
cov(cov_matrix)

# Create correlation matrix
cor(cov_matrix)


#NUMBER 2
# Create data frame for common interests and love
attach(Processed_Marriage_Divorce_DB)
CI_L<-data.frame(`Common Interests`, Love)

# Scale data
s2<-scale(CI_L)

# Plot attributes
plot(s2, pch=16, col="purple")
detach(Processed_Marriage_Divorce_DB)


#NUMBER 3
#Create variable to store all rows with recommendation=="Divorce"
divorce<-Processed_Marriage_Divorce_DB %>% filter(Processed_Marriage_Divorce_DB$Recommendation=="Divorce")

# Create variable to store all rows with recommendation=="Marry"
marry<-Processed_Marriage_Divorce_DB %>% filter(Processed_Marriage_Divorce_DB$Recommendation=="Marry")

# Create 2 histogram for 'Divorce Score' each for marry and divorce recommendations
hist(marry$`Divorce Score`,col="pink", border="pink4", main='Divorce Score (Recommendation: Marry)', xlab = "Divorce Score", ylab = "# of Occurences")
hist(divorce$`Divorce Score`,col="slateblue", border="slateblue4", main='Divorce Score (Recommendation: Divorce)',xlab = "Divorce Score", ylab = "# of Occurences")

# Create 2 histograms for 'Desire to Marry" each for marry and divorce recommendations
hist(marry$`Desire to Marry`,col="pink", border="pink4", main='Desire to Marry (Recommendation: Marry)',xlab='Desire to Marry', ylab='# of Occurences')
hist(divorce$`Desire to Marry`,col="slateblue", border="slateblue4", main='Desire to Marry (Recommendation: Divorce)',xlab='Desire to Marry', ylab='# of Occurances')

# Create 2 histograms for 'Common Interests' each for marry and divorce recommendations
hist(marry$`Common Interests`,col="pink", border="pink4", main='Common Interests (Recommendation: Marry)',xlab='Common Interests', ylab='# of Occurences')
hist(divorce$`Common Interests`,col="slateblue", border="slateblue4", main='Common Interests (Recommendation: Divorce)',xlab='Common Interests', ylab='# of Occurances')


#NUMBER 4
# Create box plot for M and D
#D
boxplot(divorce$`Self Confidence`,border = "red4", col = "floralwhite", xlab='Self Confidence(Recommendation: Divorce)',horizontal = TRUE)

#M
boxplot(marry$`Self Confidence`,border = "red4", col = "floralwhite", xlab='Self Confidence(Recommendation: Marry)',horizontal = TRUE)

# Create boxplot of all instances of 'self confidence'
boxplot(Processed_Marriage_Divorce_DB$`Self Confidence`, border = "red4", col = "floralwhite", horizontal = TRUE, xlab='All instances of Self Confidence')


#NUMBER5
# Create supervised scatter plot for economic similarity and common interests
divorce_sp<-data.frame(economic_similarities=divorce$`Economic Similarity`,common_interests=divorce$`Common Interests`)
marry_sp<-data.frame(economic_similarities=marry$`Economic Similarity`,common_interests=marry$`Common Interests`)
sp12<-rbind(divorce_sp,marry_sp)
sp12$vis<-c(rep("divorce"), rep("marry"))
ggplot(sp12, aes(x=economic_similarities, y=common_interests, group=vis, col=vis)) + geom_point() + geom_smooth(method="lm")

# Create scatter plot for common interest and loyalty
divorce_sp1<-data.frame(common_interests=divorce$`Common Interests`, loyalty=divorce$Loyalty)
marry_sp1<-data.frame(common_interests=marry$`Common Interests`, loyalty=marry$Loyalty)
sp12_1<-rbind(divorce_sp1,marry_sp1)
sp12_1$vis<-c(rep("divorce"), rep("marry"))
ggplot(sp12_1, aes(x=common_interests, y=loyalty, group=vis, col=vis)) + geom_point() + geom_smooth(method="lm")

# Create scatter plot for loyalty and economic similarity
divorce_sp2<-data.frame(loyalty=divorce$Loyalty, economic_similarities=divorce$`Economic Similarity`)
marry_sp2<-data.frame(loyalty=marry$Loyalty, economic_similarities=marry$`Economic Similarity`)
sp12_2<-rbind(divorce_sp2,marry_sp2)
sp12_2$vis<-c(rep("divorce"), rep("marry"))
ggplot(sp12_2, aes(x=loyalty, y=economic_similarities, group=vis, col=vis)) + geom_point() + geom_smooth(method="lm")



#NUMBER 6
# Create density plot for age gap
ag<-data.frame(age_gap=c(marry$`Age Gap`,divorce$`Age Gap`), recommendation=c(rep("marry"), rep("divorce")))
ggplot(ag, aes(x=age_gap, color=recommendation, fill=recommendation)) + geom_density(alpha=0.3) + scale_fill_manual(values = c("red","blue"))

# Create density plot for social gap
sg<-data.frame(social_gap=c(marry$`Social Gap`,divorce$`Social Gap`), recommendation=c(rep("marry"), rep("divorce")))
ggplot(sg, aes(x=social_gap, color=recommendation, fill=recommendation)) + geom_density(alpha=0.3) + scale_fill_manual(values = c("red","blue"))


#NUMBER 7
# eliminate last 2 columns from data frame
# I used generic variable names just to test out different methods for deleting columns
x<-Processed_Marriage_Divorce_DB
x1<-x$`Divorce Score`<-NULL
x1<- x[,-31]
# Once I got rid of last 2 columns I changed the variable name so it makes sense again and scaled the data
z_processedmarriage <-scale(x1)

#fit linear model to predict divorce score
mod<-lm(scale(Processed_Marriage_Divorce_DB$`Divorce Score`) ~ z_processedmarriage)
# print coefficients
mod$coefficients
# print r squared
summary(mod)$r.squared


#NUMBER 8
#without independency and education
#x[,12] = engagement time
x<-data.frame(twentyeightAttr, r=factor(Processed_Marriage_Divorce_DB$Recommendation))
model<-rpart(x$r~x[,1]+x[,2]+x[,3]+x[,4]+x[,5]+x[,6]+x[,7]+x[,8]+x[,9]+x[,10]+x[,11]+x[,12]+x[,13]+x[,14]+x[,15]
             +x[,16]+x[,17]+x[,18]+x[,19]+x[,20]+x[,21]+x[,22]+x[,23]+x[,24]+x[,25]+x[,26]+x[,27]+x[,28],
             control=rpart.control(cp=0.02, maxdepth=8))
plot(model)
text(model,use.n=TRUE, all=TRUE, cex=0.5)

# all attributes
# y[,2] = education
y<-data.frame(x1, r=factor(Processed_Marriage_Divorce_DB$Recommendation))
model1<-rpart(y$r~y[,1]+y[,2]+y[,3]+y[,4]+y[,5]+y[,6]+y[,7]+y[,8]+y[,9]+y[,10]+y[,11]+y[,12]+y[,13]+y[,14]+y[,15]
             +y[,16]+y[,17]+y[,18]+y[,19]+y[,20]+y[,21]+y[,22]+y[,23]+y[,24]+y[,25]+y[,26]+y[,27]+y[,28],
             control=rpart.control(cp=0.02, maxdepth=8))
plot(model1)
text(model1,use.n=TRUE, all=TRUE, cex=0.5)

#y[,18] = sense of having children
y<-data.frame(x1, r=factor(Processed_Marriage_Divorce_DB$Recommendation))
model1<-rpart(y$r~y[,1]+y[,3]+y[,4]+y[,5]+y[,6]+y[,7]+y[,8]+y[,9]+y[,10]+y[,11]+y[,12]+y[,13]+y[,15]
              +y[,16]+y[,17]+y[,18]+y[,19]+y[,20]+y[,21]+y[,22]+y[,23]+y[,24]+y[,25]+y[,26]+y[,27]+y[,28],
              control=rpart.control(cp=0.02, maxdepth=8))
plot(model1)
text(model1,use.n=TRUE, all=TRUE, cex=0.5)
