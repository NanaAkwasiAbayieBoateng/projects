ods html close; /* close previous */
ods html; /* open new */


/*PROC IMPORT OUT= WORK.gastro DATAFILE= "C:\Users\nboateng\Desktop\Dr. Wu\gastrostomydatan.xlsx" 

PROC IMPORT OUT= WORK.gastro DATAFILE= "C:\Users\nboateng\Desktop\gastro.xlsx" 
            DBMS=xlsx REPLACE;
    
     GETNAMES=YES;
RUN;*/

PROC IMPORT OUT= WORK.auto1 DATAFILE= "\\tsclient\C\Users\nboateng\Desktop\gastro.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
RUN;
/*proc print data=WORK.auto1;
run;
/*

proc freq data=WORK.auto1 order=data;
  tables Gender*Complications_Y_N/chisq agree ;  
run;


proc freq data=WORK.gastro order=data;
  tables Gender;  
  tables Complications_Y_N; 
  tables Type_of_Gastrostomy; 
   tables Device__button_vs_tube_; 
   tables Short_or_Long_term; 
   tables Complications_Y_N*Short_or_Long_term; 
   tables Gender*Complications_Y_N;
run;
*/





