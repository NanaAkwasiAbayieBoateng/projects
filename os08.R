
######demographics data########################

mydata<-read.csv("C:/Users/nboateng/Desktop/st jude/OS08 DATA/Demographics OS08 deidentified.csv")

library(foreign)
write.foreign(mydata, "C:/Users/nboateng/Desktop/st jude/OS08 DATA/Demographics OS08 deidentified.csv", "C:/Users/nboateng/Desktop/st jude/OS08 DATA/OS08Demographics.sas",   package="SAS") 




######pedsql4 data########################

mydata<-read.csv("C:/Users/nboateng/Desktop/st jude/OS08 DATA/OS08 PedsQL 4 deidentified.csv")

library(foreign)
write.foreign(mydata, "C:/Users/nboateng/Desktop/st jude/OS08 DATA/OS08 PedsQL 4 deidentified.csv", "C:/Users/nboateng/Desktop/st jude/OS08 DATA/OS08PedsQL4.sas",   package="SAS") 



######pedsql data########################

mydata<-read.csv("C:/Users/nboateng/Desktop/st jude/OS08 DATA/OS08 PedsQL cancer module all ages deidentified.csv")

library(foreign)
write.foreign(mydata, "C:/Users/nboateng/Desktop/st jude/OS08 DATA/OS08 PedsQL cancer module all ages deidentified.csv", "C:/Users/nboateng/Desktop/st jude/OS08 DATA/OS08Pedcancer.sas",   package="SAS") 



######OS2008 Symptoms Distress Scale deidentified data########################

mydata<-read.csv("C:/Users/nboateng/Desktop/st jude/OS08 DATA/OS2008 Symptoms Distress Scale deidentified.csv")

library(foreign)
write.foreign(mydata, "C:/Users/nboateng/Desktop/st jude/OS08 DATA/OS2008 Symptoms Distress Scale deidentified.csv", "C:/Users/nboateng/Desktop/st jude/OS2008Symp.sas",   package="SAS") 

