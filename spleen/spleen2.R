rm(list=ls())
library(xlsx)
require(XLConnect)
library(sas7bdat)
library(Hmisc)
library(survival)
library("lubridate")
wb = loadWorkbook("D:/NANA/st jude/Spleen Project/SpleenComplete 9-9-13.xls")
spleen = readWorksheet(wb, sheet = "_4_10_13SpleenComplete", header = TRUE)
 


##############################################
## age in months#######################
Age=(difftime(spleen$Dx_date, spleen$DOB,units="days" )/365.25)*12



spleen2=read.xlsx2("D:/NANA/st jude/spleen Project/Spleen1.xlsx", sheetName = "spleen1")


wbb = loadWorkbook("D:/NANA/st jude/Spleen Project/spleen1.xlsx")
spleen4 = readWorksheet(wbb, sheet = "spleen1", header = TRUE)

spleen3=spleen4 


newdata <- spleen4[order(spleen4$age_Dx),] 

spleen3=newdata




#####################################################################
### coding into age range#######################################
## ####################################################

range=c()
for (i in 1:dim(spleen4)[1]){

if(spleen4$age_Dx[i] <=3){
    range[i] <- 1
} else if(spleen4$age_Dx[i] >3&spleen4$age_Dx[i] <=6){
    range[i] <- 2
}
 else if(spleen4$age_Dx[i] >6&spleen4$age_Dx[i] <=9){
    range[i] <- 3
}
 else if(spleen4$age_Dx[i] >9&spleen4$age_Dx[i] <=30){
    range[i] <- 4 
}
 else if(spleen4$age_Dx[i] >30&spleen4$age_Dx[i] <60){
    range[i] <- 5  
} 
 else if(spleen4$age_Dx[i] >=60&spleen4$age_Dx[i] <83){
    range[i] <- 6  
}
 else if(spleen4$age_Dx[i] >=83&spleen4$age_Dx[i] <107){
    range[i] <- 7  
}
 else if(spleen4$age_Dx[i] >=107&spleen4$age_Dx[i] <131){
    range[i] <- 8  
}
 else if(spleen4$age_Dx[i] >=131&spleen4$age_Dx[i] <155){
    range[i] <- 9  
}
 else if(spleen4$age_Dx[i] >=155&spleen4$age_Dx[i] <179){
    range[i] <- 10  
}

else {
    range[i] <- 11
}

}


data1=data.frame(spleen4,Agerange=range)
data1 <- data1[order(data1$Agerange),]
length(data1$Agerange)

head(data1)

#####################################################################
### coding to check enlaged spleen or not#######################################
### enlarged =1,unenlarged =2#######################################
## ####################################################


enlarged=c()
for (i in 1:dim(spleen4)[1]){

if(data1$Agerange[i]==5&data1$Length[i] >95){
    enlarged[i] <- 1
} else if(data1$Agerange[i]==6&data1$Length[i] >105){
    enlarged[i] <- 1
}
 else if(data1$Agerange[i]==7&data1$Length[i] >105){
     enlarged[i] <- 1
}
 else if(data1$Agerange[i]==8&data1$Length[i] >110){
     enlarged[i] <- 1
}
 else if(data1$Agerange[i]==9&data1$Length[i] >115){
    enlarged[i] <- 1 
} 
 else if(data1$Agerange[i]==10&data1$Length[i] >120){
    enlarged[i] <- 1 
}

 else if(data1$Agerange[i]==11&data1$Length[i] >120){
    enlarged[i] <- 1
}else {
    enlarged[i] <- 2
}

}
enlarged

length(enlarged)
length(enlarged[enlarged==1])
length(enlarged[enlarged==2])
data2=data.frame(data1,enlarged)

head(data2)

enlarged.data=subset(data2, enlarged==1)




unenlarged.data=subset(data2, enlarged==2)


summary(unenlarged.data)



summary(enlarged.data)



describe(unenlarged.data)

describe(enlarged.data)






########################################################################
############convert date to numeric####################################
########################################################################


startdate <- "1970-01-01"
as.numeric(as.Date(startdate))
enddate <- "1970-01-05"
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
OS1

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

enlarged.data1=data.frame(enlarged.data,O.S.TIME.months=OS1/12)
unenlarged.data1=data.frame(unenlarged.data,O.S.TIME.months=OS2/12)


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

enlarged.data2=data.frame(enlarged.data1,EFS.TIME.months=EFS1/12)
unenlarged.data2=data.frame(unenlarged.data1,EFS.TIME.months=EFS2/12)


data3=rbind(enlarged.data2,unenlarged.data2)



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

#h0:g1=g2  H0: the 2 groups(enlarged and unenlarged)  survival curves are the same

#ha:at at  least one survival curves is  different



status=data4$status


group=data4$enlarged



datatable3.3=data4

time=data4$O.S.TIME.months


#par(mfrow=c(2,1))

############################## Add fit lines########################
pdf("D:/NANA/st jude/Spleen Project/ost.pdf")
#png("D:/NANA/st jude/Spleen Project/ost.png")
 plot(survfit(Surv(time=data4$O.S.TIME.months, status) ~ group, data=data4)
 , xlab="Time in months", ylab="Survival Probability",col=c("blue","red"), lty=1:2, mark.time=FALSE)
title(main='Kaplan Meier-Curves for Overall Survival Times ')
legend(5, 0.1,c('enlarged', 'unenlarged'), pch=c(1,2) ,col=c("blue","red"))
dev.off();



##### K-sample Long-Rank test,rh0=0 for Overall Survival Times
##
 survdiff(Surv(time, status) ~ group, data=data3,rho=0)


##### K-sample Long-Rank test,rh0=0 for Event Free Survival
 ##
survdiff(Surv(time=data4$EFS.TIME.months, status) ~ group, data=data4,rho=0)


pdf("D:/NANA/st jude/Spleen Project/efs.pdf")
#png("D:/NANA/st jude/Spleen Project/efs.png")
 plot(survfit(Surv(time=data4$EFS.TIME.months, status) ~ group, data=data4)
 , xlab="Time in months", ylab="Survival Probability",col=c("blue","red"), lty=1:2, mark.time=FALSE)
title(main='Kaplan Meier-Curves for Event Free Survival Times ')
legend(5, 0.1,c('enlarged', 'unenlarged'), pch=c(1,2) ,col=c("blue","red"))
#################### both 5,0.1 for positioning the legend##########################
####################5,0.1 the x and y co-ordinates to be used to position the legend################# 
dev.off();





