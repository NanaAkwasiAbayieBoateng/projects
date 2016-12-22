ods html close; /* close previous */
ods html; /* open new */

/* Read excel into sas*/

PROC IMPORT OUT= Demographics  DATAFILE="C:\Users\nboateng\Desktop\st jude\OS08 DATA\Demographics OS08 deidentified.xlsx"
            DBMS=xlsx REPLACE;
    
     GETNAMES=YES;
RUN;
proc print data = Demographics;
run;
PROC IMPORT OUT= key  DATAFILE="C:\Users\nboateng\Desktop\st jude\OS08 DATA\key.xlsx"
            DBMS=xlsx REPLACE;
    
     GETNAMES=YES;
RUN;
proc print data = key;
run;

PROC IMPORT OUT= os08PedsQL4  DATAFILE="C:\Users\nboateng\Desktop\st jude\OS08 DATA\OS08 PedsQL 4 deidentified.xlsx"
            DBMS=xlsx REPLACE;
    
     GETNAMES=YES;
RUN;
proc print data = os08PedsQL4 ;
run;
PROC IMPORT OUT= OS08PedsQLcancer  DATAFILE="C:\Users\nboateng\Desktop\st jude\OS08 DATA\OS08 PedsQL cancer module all ages deidentified.xlsx"
            DBMS=xlsx REPLACE;
    
     GETNAMES=YES;
RUN;
proc print data = OS08PedsQLcancer;
run;

PROC IMPORT OUT= OS2008Symptoms  DATAFILE="C:\Users\nboateng\Desktop\st jude\OS08 DATA\OS2008 Symptoms Distress Scale deidentified.xlsx"
            DBMS=xlsx REPLACE;
    
     GETNAMES=YES;
RUN;
proc print data = OS2008Symptoms;
run;

data Patientcharacterstics;
 set os08lib.Patientcharacterstics;

run;
proc sort data=Patientcharacterstics  out =Patientcharacterstic;
   by MRN  ACCESSION_NBR;
run;
proc sort data=Demographics;
   by ID;
run;
proc sort data=key;
   by ID;
run;

proc print data = Patientcharacterstic;
run;

data demo;
   merge Patientcharacterstics Demographics;
   by MRN;
run;
proc print data = demo;
run;

/*save sas dataset permanently*/

data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\Demographics'; set Demographics;
run;
/************************************************/
*recreating qol data with mrn and id*;
data Demographic;
   merge key Demographics  ;
   by ID;
run;
proc print data = Demographic;
run;
data PPedsQL4;
   merge key os08PedsQL4  ;
   by ID;
run;
proc print data = PPedsQL4;
run;


data PPedsQLcancer;
   merge key OS08PedsQLcancer  ;
   by ID;
run;
proc print data = PPedsQLcancer;
run;

data PPedsQLcancer;
   merge key OS08PedsQLcancer  ;
   by ID;
run;
proc print data = PPedsQLcancer;
run;

***********************************************************************
* MERGING QOL WITH PATIENTCHACTERISTICS TO PRODUCE ACESS NUMBER COLUMN;
data newdemo(drop=BIRTHDATE GENDER RACE ONSTUDYDATE ENROLLINGINSTITUTION DIAGNOSISDISEASE DIAGNOSISDATE DIAGNOSISID SITETYPE DXSITE STRATUM);
rename MRN=ID;
set Patientcharacterstics;
set Demographics;
run;
proc sort data=newdemo;run;

proc print data=newdemo;
run;
proc sort data=newdemo;
   by ID;
run;
proc sort data=os08PedsQL4;
   by ID;
run;
data pedsql4;
   merge newdemo os08PedsQL4;
   by ID;
run;
proc print data=pedsql4;
run;

data newpedsql4 (drop=PATIENTID ID MRN1 Age T1_Pre_therapy T2_Week_10 T3_Week_20 T4_End_of_Therapy T5_6_months_off_therapy T6_18_months_off_therapy  );
set pedsql4;
run;

proc print data=newpedsql4;
run;


proc sort data=OS08PedsQLcancer;
   by ID;
run;
data pedsql(drop=PATIENTID ID MRN1 Age T1_Pre_therapy T2_Week_10 T3_Week_20 T4_End_of_Therapy T5_6_months_off_therapy T6_18_months_off_therapy  );
   merge newdemo OS08PedsQLcancer;
   by ID;
run;
proc print data=pedsql;
run;

proc sort data=OS2008Symptoms;
   by ID;
run;
data Symptoms(drop=PATIENTID MRN1 ID Age T1_Pre_therapy T2_Week_10 T3_Week_20 T4_End_of_Therapy T5_6_months_off_therapy T6_18_months_off_therapy  );
   merge newdemo OS2008Symptoms;
   by ID;
run;
proc print data=Symptoms;
run;


data newdemo(drop=PATIENTID MRN1 ID);
set newdemo;
run;
/*save sas dataset permanently*/

data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\Demographics'; set newdemo;
run;


data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\os08PedsQL4'; set newpedsql4;
run;

data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\OS08PedsQLcancer'; set pedsql;
run;
data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\OOS2008Symptoms'; set Symptoms;
run;
