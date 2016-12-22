proc import datafile="C:\Users\nboateng\Desktop\gastro.csv"
     out=mydata
     dbms=csv
     replace;
     getnames=yes;
run;

proc print;
run;
