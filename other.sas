ods html close; /* close previous */
ods html; /* open new */

proc print data=key1;
run;

proc sort data=Bonegrowth;
   by MRN;
run;
proc print data=Bonegrowth;
run;
proc sort data=Patient_demographics;
   by MRN;
run;
proc print;
run;
proc sort data=Patientaccrual;
   by MRN;
run;
proc print;
run;
proc sort data=Sexualdevparams;
   by MRN;
run;
proc print;
run;
proc sort data=Os08_roadmap;
   by MRN;
run;
proc print;
run;
proc sort data=Labdata;
   by MRN;
run;
proc print;
run;




PROC IMPORT OUT= key1 DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\keyOS2008_01262015.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print data=key1;
run;

proc sort data=key1;
   by MRN;
run;
data NNBonegrowth(drop=Onstudydate);

set Bonegrowth key1;
*set key1;
by MRN;
run;
proc print;
run;
data NBonegrowth(drop=Onstudydate);
merge  Bonegrowth  key1;
by MRN;
run;
proc print data=NBonegrowth;
run;
proc append base=Bonegrowth  data=key1;
run;

proc print data=master;
run;
proc print data=NBonegrowth;
run;






data NBonegrowth(drop=Onstudydate);
merge key1 Bonegrowth;
by MRN;
run;
proc print data=NBonegrowth;
run;
data NPatient_demographics(drop=Onstudydate);
merge key1 Patient_demographics;
by MRN;
run;
proc print data=NPatient_demographics;
run;

data NPatientaccrual(drop=Onstudydate);
merge key1 Patientaccrual;
by MRN;
run;
proc print data=NPatientaccrual;
run;

data NSexualdevparams(drop=Onstudydate);
merge key1 Sexualdevparams;
by MRN;
run;
proc print data=NSexualdevparams;
run;

data NOs08_roadmap(drop=Onstudydate);
merge key1 Os08_roadmap;
by MRN;
run;
proc print data=NOs08_roadmap;
run;

data NLabdata(drop=Onstudydate);
merge key1 Labdata;
by MRN;
run;
proc print data=NLabdata;
run;





proc export data=Bonegrowth outfile='C:\Users\nboateng\Desktop\st jude\OS08 DATA\Bonegrowth.csv' dbms = csv replace;
run;


proc export data=Patient_demographics outfile='C:\Users\nboateng\Desktop\st jude\OS08 DATA\Patient_demographics.csv' dbms = csv replace;
run;

proc export data=Patientaccrual outfile='C:\Users\nboateng\Desktop\st jude\OS08 DATA\Patientaccrual.csv' dbms = csv replace;
run;

proc export data=Sexualdevparams outfile='C:\Users\nboateng\Desktop\st jude\OS08 DATA\Sexualdevparams.csv' dbms = csv replace;
run;

proc export data=Os08_roadmap outfile='C:\Users\nboateng\Desktop\st jude\OS08 DATA\weigthheight.csv' dbms = csv replace;
run;

proc export data=Labdata outfile='C:\Users\nboateng\Desktop\st jude\OS08 DATA\Labdata.csv' dbms = csv replace;
run;






PROC IMPORT OUT=nBonegrowth  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\nBonegrowth.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print ;
run;



PROC IMPORT OUT=nPatient_demographics  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\nPatient_demographics.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print ;
run;



PROC IMPORT OUT=nPatientaccrual  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\nPatientaccrual.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print ;
run;



PROC IMPORT OUT=nSexualdevparams  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\nSexualdevparams.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print ;
run;



PROC IMPORT OUT=nweigthheight  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\nweigthheight.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print ;
run;


PROC IMPORT OUT=nLabdata  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\nLabdata.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print ;
run;


/****************************************************************
/*reading into SAS  merged patient demographics and QOL demographics data*******
/********************************************************************/

PROC IMPORT OUT=mergedemographics  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\mergedemographics.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print ;
run;
data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\mergedemographics '; set mergedemographics ;
run;


/****************************************************/
/***********saving permanent SAS files***************/
data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\OS2008Bonegrowth'; set nBonegrowth;
run;



/***********saving permanent SAS files***************/
data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\OS2008Patient_demographics'; set nPatient_demographics ;
run;


data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\OS2008Patientaccrual'; set nPatientaccrual;
run;



data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\OS2008Sexualdevparams'; set nSexualdevparams;
run;


data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\OS2008weigthheight'; set nweigthheight;
run;



data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\OS2008Labdata'; set nLabdata;
run;



/****************************************************************
/************************reccomendations*******
/********************************************************************/

PROC IMPORT OUT=Accrualdemographics  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\Accrualdemographics.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print ;
run;


PROC IMPORT OUT=SexHormoneLevels  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\Sex Hormone Levels.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print ;
run;


data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\SexHormoneLevels'; set SexHormoneLevels;
run;


data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\Accrualdemographics'; set Accrualdemographics;
run;
