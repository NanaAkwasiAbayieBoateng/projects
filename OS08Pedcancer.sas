* Written by R;
*  write.foreign(mydata, "C:/Users/nboateng/Desktop/st jude/OS08 DATA/OS08 PedsQL cancer module all ages deidentified.csv",  ;

DATA  rdata ;
INFILE  "C:/Users/nboateng/Desktop/st jude/OS08 DATA/OS08 PedsQL cancer module all ages deidentified.csv" 
     DSD 
     LRECL= 31 ;
INPUT
 X3
 X5
 X2
 X1
 X2_1
 X2_2
 X2_3
 X2_4
 X2_5
 X2_6
 X2_7
 X2_8
 X10
;
LABEL  X2_1 = "X2.1" ;
LABEL  X2_2 = "X2.2" ;
LABEL  X2_3 = "X2.3" ;
LABEL  X2_4 = "X2.4" ;
LABEL  X2_5 = "X2.5" ;
LABEL  X2_6 = "X2.6" ;
LABEL  X2_7 = "X2.7" ;
LABEL  X2_8 = "X2.8" ;
RUN;
