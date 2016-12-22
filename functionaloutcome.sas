ods html close; /* close previous */
ods html; /* open new */
PROC IMPORT OUT= key1 DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\keyOS2008_01262015.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print data=key1;
run;
proc sort data=key1;
   by MRN;
run;
proc print data=key1;
run;

proc sort data=fma;
   by MRN;
run;
proc print data=fma;
run;
proc sort data=Mstsquestions;
   by MRN;
run;
proc print;
run;
proc sort data=Strength_measurements;
   by MRN;
run;
proc print;
run;
proc sort data=Promarom;
   by MRN;
run;
proc print;
run;

data Nfma(drop=Onstudydate);
merge key1 fma;
by MRN;
run;
proc print data=Nfma;
run;
data NMstsquestions(drop=Onstudydate);
merge key1 Mstsquestions;
by MRN;
run;
proc print data=NMstsquestions;
run;

data NStrength_measurements(drop=Onstudydate);
merge key1 Strength_measurements;
by MRN;
run;
proc print data=NStrength_measurements;
run;

data NPromarom(drop=Onstudydate);
merge key1 Promarom;
by MRN;
run;
proc print data=NPromarom;
run;


proc export data=fma outfile='C:\Users\nboateng\Desktop\st jude\OS08 DATA\fma.csv' dbms = csv replace;
run;


proc export data=Mstsquestions outfile='C:\Users\nboateng\Desktop\st jude\OS08 DATA\Mstsquestions.csv' dbms = csv replace;
run;

proc export data=Strength_measurements outfile='C:\Users\nboateng\Desktop\st jude\OS08 DATA\Strength_measurements.csv' dbms = csv replace;
run;

proc export data=Promarom outfile='C:\Users\nboateng\Desktop\st jude\OS08 DATA\Promarom.csv' dbms = csv replace;
run;


PROC IMPORT OUT=nfma  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\nfma.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print ;
run;


PROC IMPORT OUT=nMstsquestions  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\nMstsquestions.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print ;
run;



PROC IMPORT OUT=nPromarom  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\nPromarom.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print ;
run;



PROC IMPORT OUT=nStrength_measurements  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\nStrength_measurements.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
proc print ;
run;



/****************************************************/
/***********saving permanent SAS files***************/
data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\functionaloutcomefma'; set nfma;
run;

data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\functionaloutcomeMstsquestions '; set nMstsquestions ;
run;


data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\functionaloutcomePromarom'; set nPromarom;
run;



data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\functionaloutcomeStrength'; set nStrength_measurements;
run;
