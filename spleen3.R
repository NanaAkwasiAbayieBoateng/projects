rm(list=ls())
library(xlsx)
require(XLConnect)
library(sas7bdat)
library(Hmisc)
library(survival)
library("lubridate")





wbb = loadWorkbook("H:/Nana/Spleen Project/spleen1.xlsx")
spleen4 = readWorksheet(wbb, sheet = "spleen1", header = TRUE)

spleen3=spleen4 


newdata <- spleen4[order(spleen4$age_Dx),] 

spleen3=newdata







data1=data.frame(spleen4)

#####################################################################
##### categorizing race2 varaiables
#### white =1,black =2,other=3
#####################################################################
newrace=c()
for (i in 1:dim(spleen4)[1]){

if(data1$Race[i]=="W"){
newrace[i]=1

}else if(data1$Race[i]=="B"){
newrace[i]=2


}else{
newrace[i]=3

}
}

#####################################################################
##### categorizing sex varaiables
#### female =1,male=0
#####################################################################
newgender=c()
for (i in 1:dim(spleen4)[1]){

if(data1$Sex[i]=="F"){
newgender[i]=1
}else{
newgender[i]=0

}
}

#####################################################################
##### categorizing spleen invovlvement varaiables
#### no =1,yes=0
#####################################################################
newspleen=c()
for (i in 1:dim(spleen4)[1]){

if(data1$spleen_involvement[i]=="no"){
newspleen[i]=1
}else{
newspleen[i]=0

}
}

#####################################################################
##### categorizing Risk  varaiables
#### favorable =1, unfavorable=2,intermediate=3,inrmediate=4
#####################################################################
newRisk=c()
for (i in 1:dim(spleen4)[1]){

if(data1$Risk[i]=="favorable"){
newRisk[i]=1

}else if(data1$Risk[i]=="unfavorable"){
newRisk[i]=2


}else if(data1$Risk[i]=="intermediate"){
newRisk[i]=3


}else{
newRisk[i]=4

}
}

length(newRisk)
length(newgender)
length(newrace)
data1=data.frame(data1,newRisk,newgender,newrace,newspleen)

#####################################################################
### coding to check enlaged spleen or not#######################################
### enlarged =1,unenlarged =2#######################################
## ####################################################



enlarged=c()
for (i in 1:dim(spleen4)[1]){

if(spleen4$age_Dx[spleen4$age_Dx<59]&data1$Length[i] <95){
    enlarged[i] <- 1
} else if(spleen4$age_Dx[spleen4$age_Dx>59&spleen4$age_Dx<83]&data1$Length[i] <105){
    enlarged[i] <- 1
}
 else if(spleen4$age_Dx[spleen4$age_Dx>83&spleen4$age_Dx<107]&data1$Length[i] <105){
     enlarged[i] <- 1
}
 else if(spleen4$age_Dx[spleen4$age_Dx>107&spleen4$age_Dx<131]&data1$Length[i] <110){
     enlarged[i] <- 1
}
 else if(spleen4$age_Dx[spleen4$age_Dx>131&spleen4$age_Dx<155]&data1$Length[i] <115){
    enlarged[i] <- 1 
} 
 else if(spleen4$age_Dx[spleen4$age_Dx>155&spleen4$age_Dx<179]&data1$Length[i] <120){
    enlarged[i] <- 1 

}else {
    enlarged[i] <- 2
}

}


length(enlarged)
length(enlarged[enlarged==1])
length(enlarged[enlarged==2])
data2=data.frame(data1,enlarged,spleen4$age_Dx,data1$Length)

head(data2)

enlarged.data=subset(data2, enlarged==2)




unenlarged.data=subset(data2, enlarged==1)


summary(unenlarged.data)



summary(enlarged.data)

head(enlarged.data)

head(unenlarged.data)

describe(unenlarged.data)

describe(enlarged.data)

describe(data2)

wilcox.test((enlarged.data$age_Dx),(unenlarged.data$age_Dx))
wilcox.test((enlarged.data$Stage),(unenlarged.data$Stage))
wilcox.test((enlarged.data$B_sx_dum),(unenlarged.data$B_sx_dum))
wilcox.test((enlarged.data$Wt_kg),(unenlarged.data$Wt_kg))
wilcox.test((enlarged.data$Ht_cm),(unenlarged.data$Ht_cm))
wilcox.test((enlarged.data$Length),(unenlarged.data$Length))
wilcox.test((enlarged.data$Width),(unenlarged.data$Width))
wilcox.test((enlarged.data$Volume_cm3_),(unenlarged.data$Volume_cm3_))
wilcox.test((enlarged.data$Thickness),(unenlarged.data$Thickness))
wilcox.test((enlarged.data$newrace),(unenlarged.data$newrace))
wilcox.test((enlarged.data$newgender),(unenlarged.data$newgender))
wilcox.test((enlarged.data$newRisk),(unenlarged.data$newRisk))

wilcox.test((enlarged.data$newspleen),(unenlarged.data$newspleen))



########################################################################
############convert date to numeric####################################
########################################################################


startdate <- "1970-01-01"
as.numeric(as.Date(startdate))
enddate <- "1970-01-05"
enddate <- "2016-06-05"
as.numeric(as.Date(enddate))-as.numeric(as.Date(startdate))
as.numeric(startdate)
unclass(enddate)
as.numeric(enddate)
(as.Date(enddate))-(as.Date(startdate))

########################################################################
############convert date to numeric####################################
########################################################################

x=as.numeric(as.Date(enlarged.data$death_date,origin="1970-01-01"))
x1=as.numeric(as.Date(unenlarged.data$death_date,origin="1970-01-01"))

########################################################################
################# convert from numeric back to date##########################################
########################################################################

as.Date(x,origin="1970-01-01")
u=as.Date("03/May/15",format="%d/%b/%y")-as.Date("03/June/15",format="%d/%b/%y")
u[[1]]


########################################################################
################# setting NA Values to 0########################################## 
########################################################################

####### this## x[!complete.cases(x)]=0  
 

x[is.na(x)]=0
x1[is.na(x1)]=0

########################################################################
################# OS1= overall survival time  for enlarged group ########################################## 
########################################################################

OS1=c()

for (i in 1:dim(enlarged.data)[1]){

if (x[i]==0){

OS1[[i]]=as.numeric(as.Date(enlarged.data$LastSeen,origin="1970-01-01"))[i]-as.numeric(as.Date(enlarged.data$Dx_date,origin="1970-01-01"))[i]

#OS1[i]=(difftime(enlarged.data$LastSeen)[i], enlarged.data$Dx_date,units="days" )/365.25)*12

}else {
OS1[[i]]=x[i]-as.numeric(as.Date(enlarged.data$Dx_date,origin="1970-01-01"))[i]

#OS1[i]=(difftime(enlarged.data$death_date)[i], enlarged.data$Dx_date,units="days" )/365.25)*12

}
}


########################################################################
################# OS2= overall survival time  for unenlarged group ########################################## 
########################################################################

OS2=c()

for (i in 1:dim(unenlarged.data)[1]){

if (x1[i]==0){

OS2[[i]]=as.numeric(as.Date(unenlarged.data$LastSeen,origin="1970-01-01"))[i]-as.numeric(as.Date(unenlarged.data$Dx_date,origin="1970-01-01"))[i]


}else {
OS2[[i]]=x1[i]-as.numeric(as.Date(unenlarged.data$Dx_date,origin="1970-01-01"))[i]


}
}
OS2

enlarged.data1=data.frame(enlarged.data,O.S.TIME.months=(OS1/365.25)*12)
unenlarged.data1=data.frame(unenlarged.data,O.S.TIME.months=(OS2/365.25)*12)


########################################################################
################# EFS1= Event Free Survival time  for enlarged group ########################################## 
########################################################################
x2=as.numeric(as.Date(enlarged.data$death_date,origin="1970-01-01"))
x3=as.numeric(as.Date(enlarged.data$SMN_date,origin="1970-01-01"))
x4=as.numeric(as.Date(enlarged.data$relapse_date ,origin="1970-01-01"))
x2[is.na(x2)]=0
x3[is.na(x3)]=0
x4[is.na(x4)]=0

EFS1=c()

for (i in 1:dim(enlarged.data)[1]){

if (x2[i]==0& x3[i]==0& x4[i]==0 ){

EFS1[[i]]=as.numeric(as.Date(enlarged.data$LastSeen,origin="1970-01-01"))[i]-as.numeric(as.Date(enlarged.data$Dx_date,origin="1970-01-01"))[i]


}else {

f1=c(x2[i],x3[i],x4[i])

EFS1[[i]]=min(f1[f1>0])-as.numeric(as.Date(enlarged.data$Dx_date,origin="1970-01-01"))[i]


}
}
EFS1




########################################################################
################# EFS2= Event Free Survival time  for unenlarged group ########################################## 
########################################################################
x5=as.numeric(as.Date(unenlarged.data$death_date,origin="1970-01-01"))
x6=as.numeric(as.Date(unenlarged.data$SMN_date,origin="1970-01-01"))
x7=as.numeric(as.Date(unenlarged.data$relapse_date ,origin="1970-01-01"))
x5[is.na(x5)]=0
x6[is.na(x6)]=0
x7[is.na(x7)]=0

EFS2=c()

for (i in 1:dim(unenlarged.data)[1]){

if (x5[i]==0 & x6[i]==0 & x7[i]==0 ){

EFS2[[i]]=as.numeric(as.Date(unenlarged.data$LastSeen,origin="1970-01-01"))[i]-as.numeric(as.Date(unenlarged.data$Dx_date,origin="1970-01-01"))[i]


}else {

f2=c(x5[i],x6[i],x7[i])

EFS2[[i]]=min(f2[f2>0])-as.numeric(as.Date(unenlarged.data$Dx_date,origin="1970-01-01"))[i]


}
}
EFS2

enlarged.data2=data.frame(enlarged.data1,EFS.TIME.months=(EFS1/365.25)*12)
unenlarged.data2=data.frame(unenlarged.data1,EFS.TIME.months=(EFS2/365.25)*12)


data3=rbind(enlarged.data2,unenlarged.data2)
data3=rbind(enlarged.data2,unenlarged.data2)
names(enlarged.data2)
names(unenlarged.data2)
head(enlarged.data2)
head(unenlarged.data2)
dim(enlarged.data2)
dim(unenlarged.data2)
)

x8=as.numeric(as.Date(spleen4$death_date,origin="1970-01-01"))
x8[is.na(x8)]=0

status=c()

for (i in 1:dim(spleen4)[1]){

if (x8[i]==0){

status[i]=0

}else {

status[i]=1


}
}

length(status)

data4=data.frame(data3,status)

head(data4)

#h0:g1=g2  H0: the 2 groups(enlarged and unenlarged)  survival curves are the same

#ha:at at  least one survival curves is  different

#status<-c(s1,s2,s3)

status=data4$status

#group=c(group.1,group.2,group.3)

group=data4$enlarged

#datatable3.3=data.frame(time,status,group)

datatable3.3=data4

time=data4$O.S.TIME.months


#par(mfrow=c(2,1))

############################## Add fit lines########################
#pdf("H:/Nana/Spleen Project/ost.pdf")
png("H:/Nana/Spleen Project/ost.png")
 plot(survfit(Surv(time=data4$O.S.TIME.months, status) ~ group, data=data4)
 , xlab="Time in months", ylab="Survival Probability",col=c("blue","red"), lty=1:2, mark.time=FALSE)
title(main='Kaplan Meier-Curves for Overall Survival Times ')
legend(5, 0.1,c('enlarged', 'unenlarged'), pch=c(1,2) ,col=c("blue","red"))
dev.off();



##### K-sample Long-Rank test,rh0=0 for Overall Survival Times
##
 survdiff(Surv(time=data4$O.S.TIME.months, status) ~ group, data=data4,rho=0)


##### K-sample Long-Rank test,rh0=0 for Event Free Survival
 ##
survdiff(Surv(time=data4$EFS.TIME.months, status) ~ group, data=data4,rho=0)


#pdf("H:/Nana/Spleen Project/efs.pdf")
png("H:/Nana/Spleen Project/efs.png")
 plot(survfit(Surv(time=data4$EFS.TIME.months, status) ~ group, data=data4)
 , xlab="Time in months", ylab="Survival Probability",col=c("blue","red"), lty=1:2, mark.time=FALSE)
title(main='Kaplan Meier-Curves for Event Free Survival Times ')
legend(5, 0.1,c('enlarged', 'unenlarged'), pch=c(1,2) ,col=c("blue","red"))
#################### both 5,0.1 for positioning the legend##########################
####################5,0.1 the x and y co-ordinates to be used to position the legend################# 
dev.off();

wilcox.test(enlarged.data1$O.S.TIME.months,unenlarged.data1$O.S.TIME.months)


write.csv(data4,file = "H:/Nana/Spleen Project/data4.csv",eol = "\n", row.names = FALSE)


write.xlsx(x=data4 , file =  "H:/Nana/Spleen Project/data4.xlsx",
        sheetName = "sheet1", row.names = FALSE)














## reset contrasts to defaults
options(contrasts = c("contr.treatment", "contr.poly"))
tens <- with(warpbreaks, C(tension, poly, 1))
attributes(tens)

## tension SHOULD be an ordered factor, but as it is not we can use
m=aov(breaks ~ wool + tens + tension, data = warpbreaks)
summary(m)
## show the use of ...  The default contrast is contr.treatment here
summary(lm(breaks ~ wool + C(tension, base = 2), data = warpbreaks))


# following on from help(esoph)
model3 <- glm(cbind(ncases, ncontrols) ~ agegp + C(tobgp, , 1) +
     C(alcgp, , 1), data = esoph, family = binomial())
summary(model3)


cbind(esoph$ncases, esoph$ncontrols)

tens1 <- with(esoph, C(tobgp, poly, 1))
tens2 <- with(esoph, C(alcgp, poly, 1))
tens3<- with(esoph, C(agegp, poly, 1))





########################################################################
################# Cox Proportinal model for EFS ########################################## 
########################################################################

head(data4)
options(contrasts=c("contr.treatment", "contr.poly"))
vafit6 <- coxph(Surv(time=data4$EFS.TIME.months, data4$status) ~ race2+Sex
+Risk + spleen_involvement + Length +Width+Thickness+Stage+Wt_kg+Ht_cm+
Volume_cm3_+B_sx+Histology+factor(enlarged)+age_Dx+vol+depoist_ind , data = data4,
x=T, y=T, robust=T,
method="efron", singular.ok=T)
summary(vafit6)

########################################################################
################# Cox Proportinal model for OST ########################################## 
########################################################################

head(data4)
na.omit(data4)
head(data4)
data4$race2=as.factor(data4$race2)
data4$Stage=as.factor(data4$Stage)
options(contrasts=c("contr.treatment", "contr.poly"))
vafit7 <- coxph(Surv(time=data4$O.S.TIME.months, data4$status) ~ race2+Sex
+Risk + spleen_involvement + Length +Width+Thickness+Stage+Wt_kg+Ht_cm+
Volume_cm3_+B_sx+Histology+factor(enlarged)+age_Dx+vol+depoist_ind , data = data4,
x=T, y=T, robust=T,
method="efron", singular.ok=T)
summary(vafit7)


step(vafit7, direction="both",K=2,steps=1000)

library(MASS)
 
step <- stepAIC(vafit6, direction="both")
step(vafit7, na.rm=TRUE)
