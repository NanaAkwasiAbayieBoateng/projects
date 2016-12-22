libname os08lib ODBC user="dm_os2008" password="os2008" dsn="ora_os2008";

/***************************************************************/
/*********** exporting sas data set from library to work directory*****************/
/************************************************************************************/

data Bonegrowth;
 set os08lib.Bonegrowth;

run;

data weight;
 set os08lib.Np;

run;
data WeightanHeight;
 set os08lib.Os08_roadmap;

run;

data Sexualdevparams;
 set os08lib.Sexualdevparams;

run;


/***************************************************************************************/
/***************permanently save a sas data set***************************************/
/**************** Using the full path name with the Data Step to create a permanent SAS dataset*/
/***********Patientstatus is in the working directory******/

data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\Bonegrowth'; set Bonegrowth;
run;

data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\weight'; set weight;
run;

data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\WeightanHeight'; set WeightanHeight;
run;

data 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\Sexualdevparams'; set Sexualdevparams;
run;
