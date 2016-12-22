* Written by R;
*  write.foreign(mydata, "C:/Users/nboateng/Desktop/st jude/OS08 DATA/Demographics OS08 deidentified.csv",  ;

DATA  rdata ;
INFILE  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/Demographics OS08 deidentified.csv" 
     DSD 
     LRECL= 31 ;
INPUT
 X1
 X6
 X2
 X2_1
 X3
 X3_1
 X3_2
 X2_2
 X3_3
 X2_3
 X2_4
 X2_5
 X15
;
LABEL  X2_1 = "X2.1" ;
LABEL  X3_1 = "X3.1" ;
LABEL  X3_2 = "X3.2" ;
LABEL  X2_2 = "X2.2" ;
LABEL  X3_3 = "X3.3" ;
LABEL  X2_3 = "X2.3" ;
LABEL  X2_4 = "X2.4" ;
LABEL  X2_5 = "X2.5" ;
RUN;
