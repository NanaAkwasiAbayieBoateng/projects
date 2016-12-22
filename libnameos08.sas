libname os08lib ODBC user="dm_os2008" password="os2008" dsn="ora_os2008";

/***************************************************************/
/*********** exporting sas data set from library to work directory*****************/
/************************************************************************************/

data Adverseeventsv3;
 set os08lib.Adverseeventsv3;

run;
data Bonegrowth;
 set os08lib.Bonegrowth;

run;
data Changedstrata;
 set os08lib.Changedstrata;

run;
data Events;
 set os08lib.Events;

run;
data Fma;
 set os08lib.Fma;

run;

data Histologicresponse;
 set os08lib.Histologicresponse;

run;
data Labdata;
 set os08lib.Labdata;

run;
data Mstsquestions;
 set os08lib.Mstsquestions;

run;
data Np;
 set os08lib.Np;

run;
data Npmedications;
 set os08lib.Npmedications;

run;
data Os08_roadmap;
 set os08lib.Os08_roadmap;

run;
data Patientaccrual;
 set os08lib.Patientaccrual;

run;

data Patientcharacterstics;
 set os08lib.Patientcharacterstics;

run;
data Patientstatus;
 set os08lib.Patientstatus;

run;
data Patient_demographics;
 set os08lib.Patient_demographics;

run;
data Promarom;
 set os08lib.Promarom;

run;
data Sexualdevparams;
 set os08lib.Sexualdevparams;

run;
data Strength_measurements;
 set os08lib.Strength_measurements;

run;
data Surgery;
 set os08lib.Surgery;

run;
data Woundcomp;
 set os08lib.Woundcomp;

run;
/***************************************************************************************/
/***************permanently save a sas data set***************************************/
/**************** The LIBNAME statement and Data step to create a permanent SAS dataset**/

libname os08 'C:\Users\nboateng\Desktop\st jude\OS08 DATA';
data os08.Woundcomp; set Woundcomp;
run;
libname os08 'C:\Users\nboateng\Desktop\st jude\OS08 DATA';
data os08.Surgery; set Surgery;
run;
/***************************************************************************************/
/***************permanently save a sas data set***************************************/
/**************** Using the full path name with the Data Step to create a permanent SAS dataset*/
/***********Patientstatus is in the working directory******/

data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\Patientstatus'; set Patientstatus;
run;



data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\Patientcharacterstics'; set Patientcharacterstics;
run;



data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\Patientaccrual'; set Patientaccrual;
run;




data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\Npmedications'; set Npmedications;
run;




data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\Np'; set Np;
run;



data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\Histologicresponse'; set Histologicresponse;
run;

data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\Labdata'; set Labdata;
run;

data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\Events'; set Events;
run;



data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\Adverseeventsv3'; set Adverseeventsv3;
run;








ods html close; /* close previous */
ods html; /* open new */
libname diss 'C:\Users\nboateng\Desktop\st jude\OS08 DATA';
PROC IMPORT OUT= diss.OS2008Symptoms DATAFILE= "C:\Users\nboateng\Desktop\st jude\OS08 DATA\OS2008 Symptoms Distress Scale deidentified.xlsx" 
            DBMS=xlsx REPLACE;
  
   GETNAMES=YES;
 
RUN;

/******************************************************************************************************/
/*************** accessing permanent sas dataset********************************************************/
/*************Accessing a permanent SAS dataset using the full pathname********************************/
/* libname location of file*/
/* file created is new,old called is treatgroupdata*/
LIBNAME os08 'C:\Users\nboateng\Desktop\st jude\PPTPmouse';

  DATA new;
     SET os08.treatmentgroupdata;
    
  RUN;
  proc print data=new;
  run;
/******************************************************************************************************/
/*************** export sas data set into excel********************************************************/
 PROC EXPORT DATA =new
   DBMS=excel
   OUTFILE="C:\Users\nboateng\Desktop\st jude\PPTPmouse\new.xlsx"
   REPLACE;
   sheet='Sheet1';  
 RUN;
/*************************************************************************************************/
/******************sas macro to export data*****************************************************/
/*
%macro export(inlib,intbl,outpath,outfile);
  proc export data=&inlib..&intbl  
    outfile= "&outpath\&outfile..xls"       
    dbms=xls label replace;
    putnames=yes;
  run;
%mend;

%let outpath=c:\excel_files;
%let inpath=c:\sas_files;
libname source "&inpath";
data _null_;
  set sashelp.vstable (where=(libname='SOURCE'));
  call execute(cats('%nrstr(%export)('
                   ,catx(',',libname,memname,'&outpath',memname)
                   ,')'));
run;
*/
