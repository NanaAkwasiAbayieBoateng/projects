* Written by R;
*  write.foreign(mydata, "C:/Users/nboateng/Desktop/OS08 DATA/OS2008 Symptoms Distress Scale deidentified.csv",  ;

PROC FORMAT;
value Mrn 
     1 = "A" 
     2 = "AA" 
     3 = "B" 
     4 = "BB" 
     5 = "CC" 
     6 = "D" 
     7 = "DD" 
     8 = "E" 
     9 = "F" 
     10 = "FF" 
     11 = "G" 
     12 = "GG" 
     13 = "H" 
     14 = "HH" 
     15 = "I" 
     16 = "II" 
     17 = "J" 
     18 = "JJ" 
     19 = "K" 
     20 = "KK" 
     21 = "L" 
     22 = "LL" 
     23 = "M" 
     24 = "MM" 
     25 = "NN" 
     26 = "O" 
     27 = "OO" 
     28 = "P" 
     29 = "PP" 
     30 = "Q" 
     31 = "R" 
     32 = "S" 
     33 = "T" 
     34 = "U" 
     35 = "V" 
     36 = "W" 
     37 = "X" 
     38 = "Y" 
     39 = "Z" 
;

value Time_Frm 
     1 = "End of therapy" 
     2 = "Follow-up Month 06" 
     3 = "Follow-up Month 18" 
     4 = "Pre-therapy" 
     5 = "Week 10" 
     6 = "Week 20/21/22" 
;

value Apprnc_T 
     1 = "." 
     2 = "1" 
     3 = "2" 
     4 = "3" 
     5 = "4" 
     6 = "5" 
;

value Tird_Tdy 
     1 = "." 
     2 = "1" 
     3 = "2" 
     4 = "3" 
     5 = "4" 
     6 = "5" 
;

value Slpt_L_N 
     1 = "." 
     2 = "1" 
     3 = "2" 
     4 = "3" 
     5 = "4" 
     6 = "5" 
;

value Flng_Mmn 
     1 = "." 
     2 = "1" 
     3 = "2" 
     4 = "3" 
     5 = "4" 
     6 = "5" 
;

value Pn__Mmnt 
     1 = "." 
     2 = "1" 
     3 = "2" 
     4 = "3" 
     5 = "4" 
     6 = "5" 
;

value AppttTdy 
     1 = "." 
     2 = "1" 
     3 = "2" 
     4 = "3" 
     5 = "4" 
     6 = "5" 
;

value Ns__Mmnt 
     1 = "." 
     2 = "1" 
     3 = "2" 
     4 = "3" 
     5 = "4" 
;

value BwlsWr_T 
     1 = "." 
     2 = "1" 
     3 = "2" 
     4 = "3" 
     5 = "4" 
     6 = "5" 
;

value Cncntr_T 
     1 = "." 
     2 = "1" 
     3 = "2" 
     4 = "3" 
     5 = "4" 
     6 = "5" 
;

DATA  rdata ;
INFILE  "C:/Users/nboateng/Desktop/OS08 DATA/OS2008 Symptoms Distress Scale deidentified.csv" 
     DSD 
     LRECL= 31 ;
INPUT
 Mrn
 Time_Frame
 Appearance_Tdy
 Get_Arnd_Tdy
 Tired_Tdy
 Slept_Last_Ngt
 Feeling_Moment
 Pain__Moment
 AppetiteToday
 Nausea__Moment
 BowelsWorking_Tdy
 Concentrate_Tdy
 Total
;
LABEL  Time_Frame = "Time.Frame" ;
LABEL  Appearance_Tdy = "Appearance.Tdy" ;
LABEL  Get_Arnd_Tdy = "Get.Arnd.Tdy" ;
LABEL  Tired_Tdy = "Tired.Tdy" ;
LABEL  Slept_Last_Ngt = "Slept.Last.Ngt" ;
LABEL  Feeling_Moment = "Feeling.Moment" ;
LABEL  Pain__Moment = "Pain..Moment" ;
LABEL  Nausea__Moment = "Nausea..Moment" ;
LABEL  BowelsWorking_Tdy = "BowelsWorking.Tdy" ;
LABEL  Concentrate_Tdy = "Concentrate.Tdy" ;
FORMAT Mrn Mrn. ;
FORMAT Time_Frame Time_Frm. ;
FORMAT Appearance_Tdy Apprnc_T. ;
FORMAT Tired_Tdy Tird_Tdy. ;
FORMAT Slept_Last_Ngt Slpt_L_N. ;
FORMAT Feeling_Moment Flng_Mmn. ;
FORMAT Pain__Moment Pn__Mmnt. ;
FORMAT AppetiteToday AppttTdy. ;
FORMAT Nausea__Moment Ns__Mmnt. ;
FORMAT BowelsWorking_Tdy BwlsWr_T. ;
FORMAT Concentrate_Tdy Cncntr_T. ;
RUN;
proc print data=rdata;
run;
