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

#spleen3<-read.sas7bdat("D:/NANA/st jude/spleen Project/Spleen1.sas7bdat", debug=FALSE)

wbb = loadWorkbook("D:/NANA/st jude/Spleen Project/spleen1.xlsx")
spleen4 = readWorksheet(wbb, sheet = "spleen1", header = TRUE)

spleen3=spleen4 

#spleen$Dx_date-as.numeric(spleen$death_date)

#spleen2=spleen1[,-31]
#spleen3=data.frame(spleen2,age_Dx=spleen1$age_Dx*12)

newdata <- spleen4[order(spleen4$age_Dx),] 

spleen3=newdata


d1 <- subset(spleen3, age_Dx <=3,select=c( MRN,Dx_date,SMN_date,relapse_date,death_date,LastSeen,Race,
Sex,Stage,spleen_involvement,B_sx,Histology,Risk
 ,Wt_kg, Ht_cm, Length, Width,Thickness, Volume_cm3_,vol,depoist_ind,age_Dx, B_sx_dum ))

d2 <- subset(spleen3, age_Dx >3&age_Dx <=6,select=c( MRN,Dx_date,SMN_date,relapse_date,death_date,LastSeen
,Race ,Sex,Stage,spleen_involvement,B_sx,Histology,Risk,
              Wt_kg, Ht_cm, Length, Width,Thickness, Volume_cm3_,vol,depoist_ind,age_Dx, B_sx_dum ))

d3 <- subset(spleen3, age_Dx >6&age_Dx <=9,select=c( MRN,Dx_date,SMN_date,relapse_date,death_date,LastSeen
,Race ,Sex,Stage,spleen_involvement,B_sx,Histology,Risk,
              Wt_kg, Ht_cm, Length, Width,Thickness, Volume_cm3_,vol,depoist_ind,age_Dx, B_sx_dum ))

d4 <- subset(spleen3,age_Dx >9& age_Dx <=30,select=c( MRN,Dx_date,SMN_date,relapse_date,death_date,LastSeen
,Race ,Sex,Stage,spleen_involvement,B_sx,Histology,Risk,
              Wt_kg, Ht_cm, Length, Width,Thickness, Volume_cm3_,vol,depoist_ind,age_Dx, B_sx_dum ))

d5 <- subset(spleen3, age_Dx >30&age_Dx <=59,select=c( MRN,Dx_date,SMN_date,relapse_date,death_date,LastSeen
,Race ,Sex,Stage,spleen_involvement,B_sx,Histology,Risk,
              Wt_kg, Ht_cm, Length, Width,Thickness, Volume_cm3_,vol,depoist_ind,age_Dx, B_sx_dum ))

dd5=data.frame(d5,upperboundary=rep(95,dim(d5)[1]))
enlargedspleen5=dd5[dd5$Length>105,]
unenlargedspleen5=dd5[dd5$Length<105,]

d6 <- subset(spleen3, age_Dx >59& age_Dx <=83,select=c( MRN,Dx_date,SMN_date,relapse_date,death_date,LastSeen
,Race ,Sex,Stage,spleen_involvement,B_sx,Histology,Risk,
              Wt_kg, Ht_cm, Length, Width,Thickness, Volume_cm3_,vol,depoist_ind,age_Dx, B_sx_dum ))

dd6=data.frame(d6,upperboundary=rep(105,dim(d6)[1]))
enlargedspleen6=dd6[dd6$Length>105,]
unenlargedspleen6=dd6[dd6$Length<105,]


d7 <- subset(spleen3, age_Dx >83&age_Dx <107,select=c( MRN,Dx_date,SMN_date,relapse_date,death_date,LastSeen
,Race ,Sex,Stage,spleen_involvement,B_sx,Histology,Risk,
              Wt_kg, Ht_cm, Length, Width,Thickness, Volume_cm3_,vol,depoist_ind,age_Dx, B_sx_dum ))

dd7=data.frame(d7,upperboundary=rep(105,dim(d7)[1]))
enlargedspleen7=dd7[dd7$Length>105,]
unenlargedspleen7=dd7[dd7$Length<105,]


d8 <- subset(spleen3, age_Dx >=107&age_Dx <131,select=c( MRN,Dx_date,SMN_date,relapse_date,death_date,LastSeen
,Race ,Sex,Stage,spleen_involvement,B_sx,Histology,Risk,
              Wt_kg, Ht_cm, Length, Width,Thickness, Volume_cm3_,vol,depoist_ind,age_Dx, B_sx_dum ))

dd8=data.frame(d8,upperboundary=rep(110,dim(d8)[1]))

enlargedspleen8=dd8[dd8$Length>110,]
unenlargedspleen8=dd8[dd8$Length<110,]


d9 <- subset(spleen3, age_Dx >=131&age_Dx <155,select=c( MRN,Dx_date,SMN_date,relapse_date,death_date,LastSeen
,Race ,Sex,Stage,spleen_involvement,B_sx,Histology,Risk,
              Wt_kg, Ht_cm, Length, Width,Thickness, Volume_cm3_,vol,depoist_ind,age_Dx, B_sx_dum ))

dd9=data.frame(d9,upperboundary=rep(115,dim(d9)[1]))

enlargedspleen9=dd9[dd9$Length>115,]
unenlargedspleen9=dd9[dd9$Length<115,]


d10 <- subset(spleen3, age_Dx >=155&age_Dx <179,select=c( MRN,Dx_date,SMN_date,relapse_date,death_date,LastSeen
,Race ,Sex,Stage,spleen_involvement,B_sx,Histology,Risk,
              Wt_kg, Ht_cm, Length, Width,Thickness, Volume_cm3_,vol,depoist_ind,age_Dx, B_sx_dum ))

dd10=data.frame(d10,upperboundary=rep(120,dim(d10)[1]))
enlargedspleen10=dd10[dd10$Length>120,]
unenlargedspleen10=dd10[dd10$Length<120,]


d11 <- subset(spleen3, age_Dx >=179&age_Dx <200,select=c( MRN,Dx_date,SMN_date,relapse_date,death_date,LastSeen
,Race ,Sex,Stage,spleen_involvement,B_sx,Histology,Risk,
              Wt_kg, Ht_cm, Length, Width,Thickness, Volume_cm3_,vol,depoist_ind,age_Dx, B_sx_dum ))
dd11=data.frame(d11,upperboundary=rep(120,dim(d11)[1]))

enlargedspleen11=dd11[dd11$Length>120,]
unenlargedspleen11=dd11[dd11$Length<120,]



d12 <- subset(spleen3, age_Dx >= 200,select=c( MRN,Dx_date,SMN_date,relapse_date,death_date,LastSeen
,Race ,Sex,Stage,spleen_involvement,B_sx,Histology,Risk,
              Wt_kg, Ht_cm, Length, Width,Thickness, Volume_cm3_,vol,depoist_ind,age_Dx, B_sx_dum ))



dd12=data.frame(d12,upperboundary=rep(120,dim(d12)[1]))

enlargedspleen12=dd12[dd12$Length>120,]
unenlargedspleen12=dd12[dd12$Length<120,]


dim(rbind(d1,d2,d3,d4,d5,d6,d6,d7,d8,d9,d10,d11,d12))[1]
v=(rbind(d1,d2,d3,d4,d5,d6,d6,d7,d8,d9,d10,d11,d12))
v1 =v[order(v$age_Dx),] 
dim(v1)
v2=v1[v1$age_Dx==unique(v1$age_Dx)]
dim(v2)
dim(d1)[1]+dim(d2)[1]+dim(d3)[1]+dim(d4)[1]+dim(d5)[1]+dim(d6)[1]+dim(d7)[1]
+dim(d8)[1]+dim(d9)[1]+dim(d10)[1]+dim(d11)[1]+dim(d12)[1]


dim(spleen3)
dim(newdata)

enlargeddata=rbind(enlargedspleen5,enlargedspleen6,enlargedspleen7,
                       enlargedspleen8,enlargedspleen9,enlargedspleen10,
                        enlargedspleen11,enlargedspleen12)

enlargeddata=data.frame(enlargeddata,group=rep(1,65))

unenlargeddata=rbind(unenlargedspleen5,unenlargedspleen6,unenlargedspleen7,
                       unenlargedspleen8,unenlargedspleen9,unenlargedspleen10,
                        unenlargedspleen11,unenlargedspleen12)

unenlargeddata=data.frame(unenlargeddata,group=rep(2,230))


summary(unenlargeddata)



summary(enlargeddata)



describe(unenlargeddata)

describe(enlargeddata)


spleendata=rbind(enlargeddata,unenlargeddata)

dim(spleendata)
dim(spleen4)
spleendata1=spleendata[order(spleendata$age_Dx),] 
spleendata1$age_Dx
newdata$age_Dx

cbind(newdata$age_Dx,spleendata1$age_Dx)
cbind(newdata$age_Dx,v1$age_Dx)


#####################################################################
### coding into age range#######################################
## ####################################################

status=c()
for (i in 1:dim(spleen4)[1]){

if(spleen4$age_Dx[i] <=3){
    status[i] <- 1
} else if(spleen4$age_Dx[i] >3&spleen4$age_Dx[i] <=6){
    status[i] <- 2
}
 else if(spleen4$age_Dx[i] >6&spleen4$age_Dx[i] <=9){
    status[i] <- 3
}
 else if(spleen4$age_Dx[i] >9&spleen4$age_Dx[i] <=30){
    status[i] <- 4 
}
 else if(spleen4$age_Dx[i] >30&spleen4$age_Dx[i] <=59){
    status[i] <- 5  
} 
 else if(spleen4$age_Dx[i] >59&spleen4$age_Dx[i] <=83){
    status[i] <- 6  
}
 else if(spleen4$age_Dx[i] >83&spleen4$age_Dx[i] <=107){
    status[i] <- 7  
}
 else if(spleen4$age_Dx[i] >107&spleen4$age_Dx[i] <=131){
    status[i] <- 8  
}
 else if(spleen4$age_Dx[i] >131&spleen4$age_Dx[i] <=155){
    status[i] <- 9  
}
 else if(spleen4$age_Dx[i] >155&spleen4$age_Dx[i] <=179){
    status[i] <- 10  
}
 else if(spleen4$age_Dx[i] >179&spleen4$age_Dx[i] <=200){
    status[i] <- 11  
}else {
    status[i] <- 12
}

}
status
length(status)

data1=data.frame(spleen4,Agerange=status)
data1 <- data1[order(data1$Agerange),]
length(data1$Agerange)


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
}
 else if(data1$Agerange[i]==12&data1$Length[i] >120){
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



f=c(0,1,3)
min(f[f>0])

difftime("2007-11-01","2001-10-10",units="days" )

difftime("2012-07-14","2005-05-28",units="days" )

as.Date(enlarged.data$death_date,origin="1970-01-01")-as.Date(enlarged.data$Dx_date,origin="1970-01-01")
as.Date(enlarged.data$LastSeen,origin="1970-01-01")-as.Date(enlarged.data$Dx_date,origin="1970-01-01")

enlarged.data$LastSeen-enlarged.data$Dx_date