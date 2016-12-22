* Written by R;
*  write.foreign(mydata, "C:/Users/nboateng/Desktop/OS08 DATA/Demographics OS08 deidentified.csv",  ;

PROC FORMAT;
value ID 
     1 = "A" 
     2 = "AA" 
     3 = "B" 
     4 = "BB" 
     5 = "C" 
     6 = "CC" 
     7 = "D" 
     8 = "DD" 
     9 = "E" 
     10 = "F" 
     11 = "FF" 
     12 = "G" 
     13 = "GG" 
     14 = "H" 
     15 = "HH" 
     16 = "I" 
     17 = "II" 
     18 = "J" 
     19 = "JJ" 
     20 = "K" 
     21 = "KK" 
     22 = "L" 
     23 = "LL" 
     24 = "M" 
     25 = "MM" 
     26 = "N" 
     27 = "NN" 
     28 = "O" 
     29 = "OO" 
     30 = "P" 
     31 = "PP" 
     32 = "Q" 
     33 = "R" 
     34 = "S" 
     35 = "T" 
     36 = "U" 
     37 = "V" 
     38 = "W" 
     39 = "X" 
     40 = "Y" 
     41 = "Z" 
;

value Age 
     1 = "Child" 
     2 = "Teen" 
     3 = "Young Child" 
;

value T1_Pr_th 
     1 = "yes" 
;

value T2_Wk_10 
     1 = "Off study" 
     2 = "parent only" 
     3 = "yes" 
;

value T3_Wk_20 
     1 = "" 
     2 = "." 
     3 = "Off study" 
     4 = "yes" 
;

value T4_En__T 
     1 = "" 
     2 = "." 
     3 = "Off study" 
     4 = "yes" 
;

value T5_6_m__ 
     1 = "" 
     2 = "." 
     3 = "Off study" 
     4 = "yes" 
;

value T6_18___ 
     1 = "" 
     2 = "off study" 
     3 = "Off study" 
     4 = "yes" 
;

DATA  demodata ;
INFILE  "C:/Users/nboateng/Desktop/OS08 DATA/Demographics OS08 deidentified.csv" 
     DSD 
     LRECL= 20 ;
INPUT
 ID
 Age
 T1_Pre_therapy
 T2_Week_10
 T3_Week_20
 T4_End_of_Therapy
 T5_6_months_off_therapy
 T6_18_months_off_therapy
;
LABEL  T1_Pre_therapy = "T1.Pre.therapy" ;
LABEL  T2_Week_10 = "T2.Week.10" ;
LABEL  T3_Week_20 = "T3.Week.20" ;
LABEL  T4_End_of_Therapy = "T4.End.of.Therapy" ;
LABEL  T5_6_months_off_therapy = "T5.6.months.off.therapy" ;
LABEL  T6_18_months_off_therapy = "T6.18.months.off.therapy" ;
FORMAT ID ID. ;
FORMAT Age Age. ;
FORMAT T1_Pre_therapy T1_Pr_th. ;
*FORMAT T2_Week_10 T2_Wk_10. ;
*FORMAT T3_Week_20 T3_Wk_20. ;
FORMAT T4_End_of_Therapy T4_En__T. ;
FORMAT T5_6_months_off_therapy T5_6_m__. ;
FORMAT T6_18_months_off_therapy T6_18___. ;
RUN;


proc print DATA = demodata;
run;
