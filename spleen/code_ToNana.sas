
libname s 'D:\NANA\st jude\Spleen Project';

PROC IMPORT DATAFILE= "D:\NANA\st jude\Spleen Project\SpleenComplete 9-9-13.xls" 
out=s.spleen
replace;
getnames=yes; 
sheet="_4_10_13SpleenComplete";
RUN;
proc print; run;

data spleen1;
 set s.spleen;
 vol=Length*Width*Thickness*3.14159/6;
* keep mrn vol B_sx;
 if vol=. then delete;
 depoist_ind=1;
 if Focal_lesion_number=" " then depoist_ind=0; /* with focal_lesion_number means had spleen deposits or splenic involement*/ 
 if mrn=13555 then depoist_ind=0; /* per email between Monika and Sue: Definitely count the spleen for 13555 as NEG*/
 race2=race;
 if race not in ('W' 'B') then race2='O';
 if mrn=18304 then delete; /*Actually he needs to be excluded, since he only came for the CT one time and never returned!
He did not get treatment here - Monika email*/
 if mrn=28733 then delete; /*She came here after therapy and was evlauated only once and never came back!
The imaging we have on her where after end of therapy - Monika email.*/
 if mrn=28735 then delete; /*Based on Monika 9/9/13 eamil 
 In the process I identified 2 more patients that are really not eligible for our study, 
 since they came after having been treated elsewhere and therefore we do not have their info at diagnosis*/
 age_Dx=((Dx_date-DOB)/365.25)*12;   /*/age in months conversion*/;
 Length=Length*10;/* change length from cm to mm*/
 if B_sx='A' then B_sx_dum=0;
 if B_sx='B' then  B_sx_dum=1;
 if spleen_involvement=" " then spleen_involvement="no";
run;
proc print; run;

proc export data=spleen1 outfile="D:\NANA\st jude\Spleen Project\spleen1.csv" dbms = csv replace;
run;

data 'D:\NANA\st jude\Spleen Project\spleen1'; set spleen1;
run;
proc freq data=spleen1;
 tables Sex Race Race2 Stage  B_sx  Histology Risk  Tx_Mnemonic  depoist_ind spleen_involvement;
run;

 



libname cox 'H:\Nana\Spleen Project';

PROC IMPORT DATAFILE= "H:\Nana\Spleen Project\data4.xlsx" 
out=spleens
replace;
getnames=yes; 
sheet="sheet1";
RUN;
proc print; run;

PROC LIFETEST DATA=spleens  plots=survival(cb);
TIME EFS_TIME_months*status(0);
strata enlarged/TEST=(LOGRANK WILCOXON PETO);
run;
