
####################################################
## quality of life  data##########
########################################################
library(xlsx) 
key<-read.xlsx( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/keyOS2008_01262015.xlsx",
        sheetName = "Sheet1")

key1<-read.xlsx( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/key.xlsx",
        sheetName = "Sheet1")

pedscancer<-read.xlsx( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/qualityoflife/OS2008 PedsQL3 all ages.xlsx",
        sheetName = "scored")

pedsql4<-read.xlsx( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/qualityoflife/OS2008 PedsQL4 all ages.xlsx",
        sheetName = "scored")

symptons<-read.xlsx( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/qualityoflife/OS2008 Symptoms Distress Scale deidentified.xlsx",
        sheetName = "OS2008 Symptoms Distress Scale")

Demographics<-read.xlsx( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/qualityoflife/Demographics OS08 deidentified.xlsx",
        sheetName = "Sheet1")

key2 <- merge(key,key1, by=c("MRN"))

mydatax <- merge(key,pedscancer, by=c("MRN"))

mydataxx <- merge(key,pedsql4, by=c("MRN"))

mydatax1 <- merge(key2,symptons, by=c("ID"))


mydatax1=mydatax1[,-c(1,2,3,5:11)]



mydataxx2 <- merge(key2,Demographics, by=c("ID"))

mydataxx2=mydataxx2[,-c(1:3,12:18)]




mydatax <- merge(key,pedscancer, by=c("MRN"))

write.xlsx(x=mydatax , file =  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/qualityoflife/pedscancer.xlsx",
        sheetName = "sheet1", row.names = FALSE)
write.xlsx(x=mydataxx , file =  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/qualityoflife/pedsql4.xlsx",
        sheetName = "sheet1", row.names = FALSE)
write.xlsx(x=mydatax1 , file =  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/qualityoflife/symptons.xlsx",
        sheetName = "sheet1", row.names = FALSE)
write.xlsx(x=mydataxx2 , file =  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/qualityoflife/Demographics.xlsx",
        sheetName = "sheet1", row.names = FALSE)




####################################################
## functional outcome data##########
########################################################
library(xlsx) 
key<-read.xlsx( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/keyOS2008_01262015.xlsx",
        sheetName = "Sheet1")
fma<-read.csv( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/fma.csv")
Mstsquestions<-read.csv( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/Mstsquestions.csv")
Strength_measurements<-read.csv( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/Strength_measurements.csv")
Promarom<-read.csv( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/Promarom.csv")


mydata <- merge(key,fma, by=c("MRN"))

mydata1 <- merge(key,Mstsquestions, by=c("MRN"))

mydata2 <- merge(key,Strength_measurements, by=c("MRN"))

mydata3 <- merge(key,Promarom, by=c("MRN"))

write.xlsx(x=mydata , file =  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/nfma.xlsx",
        sheetName = "nfma", row.names = FALSE)

write.xlsx(x=mydata1 , file =  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/nMstsquestions.xlsx",
        sheetName = "nMstsquestions", row.names = FALSE)

write.xlsx(x=mydata2 , file =  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/nStrength_measurements.xlsx",
        sheetName = "nStrength_measurements", row.names = FALSE)

write.xlsx(x=mydata3 , file =  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/nPromarom.xlsx",
        sheetName = "nPromarom", row.names = FALSE)




####################################################
## other data##########
########################################################

Bonegrowth<-read.csv( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/Bonegrowth.csv")

Patient_demographics<-read.csv( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/Patient_demographics.csv")


Bonegrowth<-read.csv( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/Bonegrowth.csv")


Patientaccrual<-read.csv( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/Patientaccrual.csv")


Sexualdevparams<-read.csv( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/Sexualdevparams.csv")


weigthheight<-read.csv( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/weigthheight.csv")


Labdata<-read.csv( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/Labdata.csv")



mydata4 <- merge(key,Bonegrowth, by=c("MRN"))

mydata5 <- merge(key,Patient_demographics, by=c("MRN"))

mydata6 <- merge(key,Patientaccrual, by=c("MRN"))

mydata7 <- merge(key,Sexualdevparams, by=c("MRN"))

mydata8 <- merge(key,weigthheight, by=c("MRN"))

mydata9 <- merge(key,Labdata, by=c("MRN"))


write.xlsx(x=mydata4 , file =  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/nBonegrowth.xlsx",
        sheetName = "nBonegrowth", row.names = FALSE)


write.xlsx(x=mydata5 , file =  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/nPatient_demographics.xlsx",
        sheetName = "nPatient_demographics", row.names = FALSE)


write.xlsx(x=mydata6 , file =  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/nPatientaccrual.xlsx",
        sheetName = "nPatientaccrual", row.names = FALSE)



write.xlsx(x=mydata7 , file =  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/nSexualdevparams.xlsx",
        sheetName = "nSexualdevparams", row.names = FALSE)



write.xlsx(x=mydata8 , file =  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/nweigthheight.xlsx",
        sheetName = "nweigthheight", row.names = FALSE)



write.xlsx(x=mydata9 , file =  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/nLabdata.xlsx",
        sheetName = "nLabdata", row.names = FALSE)




####################################################
## combining patient demographics and QOL demographics data##########


########################################################




Demographics<-read.xlsx( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/Demographics OS08 deidentified.xlsx",
        sheetName = "Sheet1")


library(sas7bdat)
Demographics<-read.sas7bdat("C:/Users/nboateng/Desktop/st jude/OS08 DATA/qualityoflife/qoldemographics.sas7bdat", debug=FALSE)



#############################################################################################
## renaming a variable in a dataset##########################################################
#############################################################################################

names(mydata5)

names(mydata5)[3] <- "Accessionnbr" 

mydata10 <- merge(Demographics,mydata5, by=c("Accessionnbr"))


write.xlsx(x=mydata10 , file =  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/mergedemographics.xlsx",
        sheetName = "sheet1", row.names = FALSE)



#############################################################################################
##detecting missing MRN variable in a dataset##########################################################
#############################################################################################

key<-read.xlsx( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/keyOS2008_01262015.xlsx",
        sheetName = "Sheet1")

nkey<-read.xlsx( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/key.xlsx",
        sheetName = "Sheet1")
demo<-read.xlsx( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/Demographics OS08 deidentified.xlsx",
        sheetName = "Sheet1")

names(key)
names(demo)
names(nkey)
mydata11 <- merge(key,nkey, by=c("MRN"))

mydata12 <- merge(mydata11,demo, by=c("ID"))

write.xlsx(x=mydata12 , file =  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/na.xlsx",
        sheetName = "na", row.names = FALSE)




##############################################################################
######reccomendations###########################################################
#############################################################################

npta<-read.xlsx( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/others/nPatientaccrual.xlsx",
        sheetName = "nPatientaccrual")

nptd<-read.xlsx( file = "C:/Users/nboateng/Desktop/st jude/OS08 DATA/others/nPatient_demographics.xlsx",
        sheetName = "nPatient_demographics")


mydata13 <- merge(npta,nptd, by=c("Accessionnbr."))


write.xlsx(x=mydata13 , file =  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/others/Accrualdemographics.xlsx",
        sheetName = "na", row.names = FALSE)