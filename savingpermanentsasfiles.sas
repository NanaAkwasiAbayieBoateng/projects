ods html close; /* close previous */
ods html; /* open new */
libname diss 'C:\Users\nboateng\Desktop\st jude\OS08 DATA';
PROC IMPORT OUT= diss.OS2008Symptoms DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\OS2008 Symptoms Distress Scale deidentified.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
*proc print data=mydata;
*run;


ods html close; /* close previous */
ods html; /* open new */
libname diss 'C:\Users\nboateng\Desktop\st jude\OS08 DATA';
PROC IMPORT OUT= diss.OS08PedsQL  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\OS08 PedsQL cancer module all ages deidentified.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;

ods html close; /* close previous */
ods html; /* open new */
libname diss 'C:\Users\nboateng\Desktop\st jude\OS08 DATA';
PROC IMPORT OUT= diss.OS08PedsQL4  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\OS08 PedsQL 4 deidentified.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;


ods html close; /* close previous */
ods html; /* open new */
libname diss 'C:\Users\nboateng\Desktop\st jude\OS08 DATA';
PROC IMPORT OUT= diss.Demographics  DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\Demographics OS08 deidentified.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;
