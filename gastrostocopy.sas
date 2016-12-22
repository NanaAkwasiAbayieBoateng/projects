

PROC IMPORT OUT= WORK.auto1 DATAFILE= "C:\Users\nboateng\Desktop\Dr. Wu\gastrostomydata.xlsx" 
            DBMS=xlsx REPLACE;
    
     GETNAMES=YES;
RUN;
proc freq data=WORK.auto1 order=data;
 
run;


proc freq data=WORK.auto1 order=data;
  tables Gender*Complications_Y_N;  
run;
