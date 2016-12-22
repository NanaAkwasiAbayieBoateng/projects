ods html close; /* close previous */
ods html; /* open new */


/*  Read excel data into SAS*/

PROC IMPORT OUT= key DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\key.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print data=key;
run;
PROC IMPORT OUT= key1 DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\keyOS2008_01262015.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print data=key1;
run;
PROC IMPORT OUT= Demographics  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\Demographics OS08 deidentified.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print data=Demographics ;
run;


PROC IMPORT OUT= OS08PedsQL4  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\OS08 PedsQL 4 deidentified.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print data=OS08PedsQL4;
run;

PROC IMPORT OUT= PedsQLcancer  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\OS08 PedsQL cancer module all ages deidentified.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print data=PedsQLcancer;
run;

PROC IMPORT OUT= OS2008Symptoms  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\OS2008 Symptoms Distress Scale deidentified.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;

proc print data=OS2008Symptoms;
run;


/* sorting the data */
proc sort data=Patientcharacterstics;
   by ACCESSION_NBR;
run;
proc sort data=Patientcharacterstics;
   by MRN;
run;
proc print data = Patientcharacterstics;
run;

proc sort data=key;
   by ID;
run;
proc sort data=key1;
   by MRN;
run;


proc sort data=Demographics;
   by ID;
run;
proc sort data=OS08PedsQL4;
   by ID;
run;
proc sort data=PedsQLcancer;
   by ID;
run;
proc sort data=OS2008Symptoms;
   by ID;
run;


/* merging  QOL data with key*/

data Ndemographics;

   merge key Demographics;
   by ID;
run;
proc print data = Ndemographics;
run;
proc sort data=Ndemographics;
   by MRN;
run;
proc sort data=Patientcharacterstics;
   by MRN;
run;
proc print data=Ndemographics;
run;

data NOS08PedsQL4(drop = T1_Pre_therapy T2_Week_10 T3_Week_20 T4_End_of_Therapy T5_6_months_off_therapy T6_18_months_off_therapy);

   merge key OS08PedsQL4;
   by ID;
run;

proc print data=NOS08PedsQL4;
run;

data NPedsQLcancer(drop = T1_Pre_therapy T2_Week_10 T3_Week_20 T4_End_of_Therapy T5_6_months_off_therapy T6_18_months_off_therapy);

   merge key PedsQLcancer;
   by ID;
run;

proc print data=NPedsQLcancer;
run;

data NOS2008Symptoms(drop = T1_Pre_therapy T2_Week_10 T3_Week_20 T4_End_of_Therapy T5_6_months_off_therapy T6_18_months_off_therapy);

   merge key OS2008Symptoms;
   by ID;
run;

proc print data=NOS2008Symptoms;
run;


/* merging  QOL+key data with Ascension Number  from Patient Characteristics*/

/* demographics*/
proc sort data=Ndemographics;
   by MRN;
run;
data NNdemographics(drop=Onstudydate)  ;

   merge key1 NDemographics;
   by MRN ;
    *set key1;
*set NDemographics;
   *by MRN ;
run;
proc sort data=NNdemographics;
   by Accessionnbr;
run;
proc print data=NNdemographics;
run;





/*
proc sort data=Patientcharacterstics;
   by MRN;
run;
data NNdemographics (drop=  PATIENTID BIRTHDATE GENDER RACE ONSTUDYDATE ENROLLINGINSTITUTION
DIAGNOSISDISEASE DIAGNOSISDATE DIAGNOSISID SITETYPE DXSITE STRATUM) ;

   set Patientcharacterstics;
set NDemographics;
   by MRN ;
run;
proc sort data=NNdemographics;
   by ACCESSION_NBR;
run;
proc print data=NNdemographics;
run;*/


/* PedsQL4*/
proc sort data=NNdemographics;
   by MRN;
run;
proc sort data=NOS08PedsQL4;
   by MRN;
run;
data NNOS08PedsQL4(drop=Onstudydate) ;
merge key1 NOS08PedsQL4;
by MRN;
   *set key1;
*set NOS08PedsQL4;
run;
proc sort data=NNOS08PedsQL4;
   by Accessionnbr;
run;
proc print data=NNOS08PedsQL4;
run;
/*
proc sort data=NNdemographics;
   by MRN;
run;
proc sort data=NOS08PedsQL4;
   by MRN;
run;
data NNOS08PedsQL4(drop=Age T1_Pre_therapy T2_Week_10 T3_Week_20 T4_End_of_Therapy T5_6_months_off_therapy T6_18_months_off_therapy) ;

   merge NNdemographics NOS08PedsQL4;
run;
proc sort data=NNOS08PedsQL4;
   by Accessionnbr;
run;
proc print data=NNOS08PedsQL4;
run;*/


/* PedsQLcancer*/

proc sort data=NPedsQLcancer;
   by MRN;
run;
data NNPedsQLcancer(drop=Onstudydate)  ;

merge key1 NPedsQLcancer;
by MRN;
run;
proc sort data=NNPedsQLcancer;
   by Accessionnbr;
run;
proc print data=NNPedsQLcancer;
run;
/*proc sort data=NNdemographics;
   by MRN;
run;
proc sort data=NPedsQLcancer;
   by MRN;
run;
data NNPedsQLcancer  ;

merge NNdemographics NPedsQLcancer;
by MRN;
run;
proc sort data=NNPedsQLcancer;
   by ACCESSION_NBR;
run;
proc print data=NNPedsQLcancer;
run;*/



/* OS2008Symptoms*/
proc sort data=NOS2008Symptoms;
   by MRN;
run;
data NNOS2008Symptoms(drop=Onstudydate) ;

merge key1 NOS2008Symptoms;
by MRN;
run;
proc sort data=NNOS2008Symptoms;
   by  Accessionnbr;
run;
proc print data=NNOS2008Symptoms;
run;





data NNNdemographics(DROP=MRN ID);
SET NNdemographics;
RUN;
proc sort data=NNNdemographics;
   by  Accessionnbr;
run;

data NNNOS08PedsQL4(DROP=MRN ID);
SET NNOS08PedsQL4;
RUN;
proc sort data=NNNOS08PedsQL4;
   by  Accessionnbr;
run;


data NNNPedsQLcancer(DROP=MRN ID);
SET NNPedsQLcancer;
RUN;
proc sort data=NNNPedsQLcancer;
   by  Accessionnbr;
run;

data NNNOS2008Symptoms(DROP=MRN ID);
SET NNOS2008Symptoms;
RUN;
proc sort data=NNNOS2008Symptoms;
   by  Accessionnbr;
run;
/*proc sort data=NNdemographics;
   by MRN;
run;
proc sort data=NOS2008Symptoms;
   by MRN;
run;
data NNOS2008Symptoms (drop=Age T1_Pre_therapy T2_Week_10 T3_Week_20 T4_End_of_Therapy T5_6_months_off_therapy T6_18_months_off_therapy) ;

merge NNdemographics NOS2008Symptoms;
by MRN;
run;
proc sort data=NNOS2008Symptoms;
   by  ACCESSION_NBR;
run;
proc print data=NNOS2008Symptoms;
run;



/*Here is a sample program that writes out SAS data called mydata to 
an Excel file called mydata.xlsx into the directory "c:\dissertation".

proc export data=mydata outfile='c:\dissertation\mydata.xlsx' dbms = xlsx replace;
run;*/


/*save sas dataset permanently*/

data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\QOLdemographics'; set NNNdemographics;
run;
proc export data=NNNdemographics outfile='C:\Users\nboateng\Desktop\st jude\OS08 DATA\QOLdemographics.csv' dbms = csv replace;
run;




data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\QOLOS08PedsQL4'; set NNNOS08PedsQL4;
run;
proc export data=NNNOS08PedsQL4 outfile='C:\Users\nboateng\Desktop\st jude\OS08 DATA\QOLOS08PedsQL4.csv' dbms = csv replace;
run;




data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\QOLPedsQLcancer'; set NNNPedsQLcancer;
run;
proc export data=NNNPedsQLcancer outfile='C:\Users\nboateng\Desktop\st jude\OS08 DATA\QOLPedsQLcancer.csv' dbms =csv replace;
run;




data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\QOLOS2008Symptoms'; set NNNOS2008Symptoms;
run;
proc export data=NNNOS2008Symptoms outfile='C:\Users\nboateng\Desktop\st jude\OS08 DATA\QOLOS2008Symptoms.csv' dbms = csv replace;
run;
