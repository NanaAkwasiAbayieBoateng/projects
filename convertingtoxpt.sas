ods pdf file="C:\Users\nboateng\Desktop\st jude\OS08 DATA\sascodeoutput.pdf";
ods html close; /* close previous */
ods html; /* open new */

/******************************************************************************************************/
/*************** accessing permanent sas dataset  *******************************************************/
/*************  Accessing a permanent SAS dataset using the full pathname********************************/
/* libname location of file*/
/* file created is new,old called is treatgroupdata*/
LIBNAME os08 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife';

  DATA demo;
     SET os08.qoldemographics;
    rename Accessionnbr=A_nbr;
    rename T1_Pre_therapy=Ptherapy;
	rename  T2_Week_10=Week_10;
	rename T3_Week_20=Week_20;
    rename T4_End_of_Therapy=Etherapy;
	rename T5_6_months_off_therapy=sixther;
	rename T6_18_months_off_therapy=_18ther;

RUN;
proc print;run;
  
  DATA pedsql4;
     SET os08.qolos08pedsql4;
    rename Accessionnbr=A_nbr;
	rename age_group=agegroup;
	rename Time_Period=Period;
	rename Walking_More_Than_One_Block=oneblock;
     rename Hard_For_Me_To_Run=Hard;
     rename Participating_Sports_Activity=sports;
     rename Lifting_Something_Heavy=Heavy;
	 rename Taking_Bath_Shower_By_Oneself=Bath;
	 rename Doing_Chore=chores;
	 rename I_Hurt_Or_Ache=Ache;
	 rename I_Have_Low_Energy=Energy;
	 rename I_Feel_Afraid_Or_Scared=Scared;
	 rename I_Feel_Sad_Or_Blue=Sad;
	 rename I_Feel_Angry=Angry;
	 rename I_Have_Trouble_Sleeping=Sleeping;
	 rename Worry_What_Will_Happen=What;
	 rename Getting_Along_With_Others=GetAlong;
	 rename Others_Not_Wanting_To_Be_Friend=NoFriend;
	  rename Other_Teens_Tease_Me=Tease;
	  rename Not_Able_To_Do_Things=DoThings;
	  rename Keeping_Up_With_Peers=Peers;
	  rename Pay_Attention_In_Class=Attent;
	  rename I_Forget_Things=Forget;
	   rename Keeping_Up_With_Schoolwork=Schwork;
	   rename Miss_School_Not_Feeling_Well=MissSch;
	   rename Miss_School_To_Go_To_Doctor=Doctor;
	   rename Physical_Functioning=PhyFunc;
	   rename Emotional_Functioning=EmoFunct;
	   rename Social_Functioning=SocFunct;
	    rename School_Functioning=SchFunct;
		rename Psychosocial_Health_Summary_Scor=PsyHlth;
		rename Physical_Health_Summary_Score=PhyHlth;
		rename Total_Score=TotalSc;
RUN;
proc print;run;

   DATA symptons;
     SET os08.qolos2008symptoms;
        rename Accessionnbr=A_nbr;
	rename Time_Frame=Period;
	rename How_You_Feel_About_Your_Appearan=Appearan;
	rename How_Much_You_Are_Able_To_Get_Aro=Around;
     rename How_Tired_You_Are_Feeling_Today=Tired;
     rename How_Well_You_Slept_Last_Night=sleep;
     rename How_You_Are_Feeling_At_The_Momen=Feeling;
	 rename How_Much_Pain_You_Are_Having_At=Pain;
	 rename How_Good_Your_Appetite_Is_Today=Appetite;
	 rename How_Much_Nausea_You_Have_At_The=Nausea;
	 rename How_Regular_Your_Bowels_Are_Work=Bowels;
	 rename How_Well_You_Are_Able_To_Concent=conc;
	 
  RUN;
  proc print;run;


   DATA cancer;
     SET os08.qolpedsqlcancer;
	  rename Accessionnbr=A_nbr;
	rename Age_Group=AgeGroup;
	rename Time_Period=Period;
	rename I_Ache_Or_Hurt_In_My_Joints_And_=Ache;
     rename I_Hurt_A_Lot=Hurt;
     rename I_Become_Sick_To_My_Stomach_When=stomach;
     rename Food_Does_Not_Taste_Very_Good_To=Food;
	 rename I_Get_Sick_To_My_Stomach_When_I=stomach2;
	 rename I_Don_T_Feel_Hungry=Hungry;
	 rename Some_Foods_And_Smells_Make_My_St=Fdsmell;
	 rename Needle_Sticks___I_E__Injections_=Needle;
	 rename I_Get_Scared_When_I_Have_To_Have=Scared;
    rename I_Get_Scared_About_Having_Needle=ScaredN;
	rename I_Get_Scared_When_I_Am_Waiting_T=ScaredW;
	rename I_Get_Scared_When_I_Have_To_Go_T=scared2;
     rename I_Get_Scared_When_I_Have_To_Go_1=Scared3;
     rename I_Worry_About_Side_Effects_From=Worry;
     rename I_Worry_About_Whether_Or_Not_My=worry2;
	 rename I_Worry_That_My_Cancer_Will_Come=worry3;
	 rename It_Is_Hard_For_Me_To_Figure_Out=Hard;
	 rename I_Have_Trouble_Solving_Math_Prob=Math;
	 rename I_Have_Trouble_Writing_School_Pa=Writing;
	 rename It_Is_Hard_Fro_Me_To_Pay_Attenti=Attent;
	rename It_Is_Hard_For_Me_To_Remember_Wh=Remember;
	 rename I_Feel_I_Am_Not_Good_Looking=Looks;
	 rename I_Don_T_Like_Other_People_To_See=Peoplec;
	 rename I_Am_Embarassed_When_Others_See=Embrrss;
	 rename It_Is_Hard_For_Me_To_Tell_The_Do=Hard2;
    rename It_Is_Hard_For_Me_To_Ask_The_Doc=Hard3;
	rename It_Is_Hard_For_Me_To_Explain_My=Hard4;
	rename Pain_and_Hurt=Pain;
     rename Procedural_anxiety=Anxiety;
     rename Treatment_Anxiety=TAnxiety;
     rename Cognitive_Problems=Cogni;
	 rename Perceived_Physical_Appearance=Appear;
	 rename Total_Score=Score;
	 rename Worry=Worry1;
	 rename Communication= Communic;
RUN;
  proc print data=cancer;
  run;



 /*******************************************************
*Create a .xpt file from a SAS dataset using Proc Copy
  In the preceding example, the libref SOURCE points to 
  the original location of the data set that is on the 
  source operating environment. The libref XPORTOUT points 
  to a new location where the transport file will be created. 
  The XPORT engine in this LIBNAME statement specifies that the 
  data set is to be created in transport format. The SET statement 
  reads the data set GRADES and re-creates it in transport format at
  the location specified in the DATA statement.
;
/*********************************************************************/
 
libname source 'SAS-data-library';
libname xportout xport 'transport-file';
data xportout.grades;
   set source.grades;
run;
proc print;run;


  /***********************************************************************************************
way 1: using data step;
***********************************************************************************************
In the preceding example, the libref os08 points to the original location of the data set 
that is on the os08 operating environment. The libref XPORTOUT points to a new location where 
the transport file will be created. The XPORT engine in this LIBNAME statement specifies that the
data set is to be created in transport format. The SET statement reads the data set qolpedsqlcancer
and re-creates it in transport format at the location specified in the DATA statement.*/
  /***********************************************************************************************
***********************************************************************************************/



libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife\demo.xpt';
data xportout.demo;
   set demo;
run;



libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife\ pedsql4.xpt';
data xportout.pedsql4;
   set  pedsql4;
run;



libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife\ symptons.xpt';
data xportout.symptons;
   set  symptons;
run;


libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife\ cancer.xpt';
data xportout.cancer;
   set  cancer;
run;


  /***********************************************************************************************
way 1: Using PROC COPY to Create a Transport File for One or More Data Sets ;
***********************************************************************************************/




libname os08 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife';
libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife\demo.xpt';
proc copy in=os08 out=xportout memtype=data; 
   select demo;
run;

libname os08 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife';
libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife\pedsql4.xpt';
proc copy in=os08 out=xportout memtype=data; 
   select pedsql4;
run;
libname os08 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife';
libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife\symptons.xpt';
proc copy in=os08 out=xportout memtype=data; 
 select symptons;  
run;
libname os08 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife';
libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife\cancer.xpt';
proc copy in=os08 out=xportout memtype=data; 
 select cancer;  
run;





  /***********************************************************************************************
way 1: Using PROC COPY to Create a  sas file from .xpt ;
***********************************************************************************************/

libname sasfile 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife';
libname xptfile xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife\demo.xpt' access=readonly;
proc copy inlib=xptfile outlib=sasfile;
run;


libname sasfile 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife';
libname xptfile xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife\pedsql4.xpt' access=readonly;
proc copy inlib=xptfile outlib=sasfile;
run;




libname sasfile 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife';
libname xptfile xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife\symptons.xpt' access=readonly;
proc copy inlib=xptfile outlib=sasfile;
run;



libname sasfile 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife';
libname xptfile xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\qualityoflife\cancer.xpt' access=readonly;
proc copy inlib=xptfile outlib=sasfile;
run;




/******************************************************************************************************/
/*************** accessing permanent sas dataset  *******************************************************/
/*************  Accessing a permanent SAS dataset using the full pathname********************************/
/* libname location of file*/
/* file created is new,old called is treatgroupdata*/
libname function 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\functional outcome';



 data fma;
     set  function.functionaloutcomefma;
	rename Accessionnbr_=A_nbr;
    rename TIME_FRAME=Period;
    rename SATISFACTION=Satisfy;
	rename  TUG_TIME=TUGTIME;
	rename TUDS_TIME=TUDSTIME;
    rename NINE_MINUTES_DISTANCE=Distance;
	rename NINE_MINUTES_HR=Hour;
	rename NINE_MINUTES_RPE=RPE;
    rename NINE_MINUTES_PCI=PCI;
    rename PARTICIPATION=PARTICTN;
	run;
proc print;run;

 data msts;
     set  function.functionaloutcomemstsquestions;
	rename Accessionnbr_=A_nbr;
    rename TIME_FRAME=Period;
    rename EVALUATION_DATE=EVALDATE;
	rename  MSTS_PAIN_DESCRIPTION=PAIN;
	rename MSTS_FUNCTION=FUNCTION;
    rename MSTS_EMOTIONAL_ACCEPTANCE=ACCEPT;
	rename MSTS_SUPPORTS=SUPPORTS;
	rename MSTS_WALKING=WALKING;
    rename MSTS_GAIT=MSTSGAIT;
run;
proc print;run;
 data promarom;
     set  function.functionaloutcomepromarom;
	rename Accessionnbr_=A_nbr;
    rename TIME_PERIOD=Period;
    rename EVALUATION_DATE=EVALDATE;
	rename  LEFT_HIP_FLEXION_PROM=LEFT1;
	rename RIGHT_HIP_FLEXION_PROM=RIGHT1;
    rename LEFT_HIP_EXTENSION_PROM=LEFT2;
	rename RIGHT_HIP_EXTENSION_PROM=RIGHT2;
	rename LEFT_ABDUCTION_PROM=LEFT3;
    rename RIGHT_ABDUCTION_PROM=RIGHT3;
	rename LEFT_ADDUCTION_PROM=LEFT4;
    rename RIGHT_ADDUCTION_PROM=RIGHT4;
    rename LEFT_INTERNAL_ROTATION_PROM=LEFT5;
	rename RIGHT_INTERNAL_ROTATION_PROM=RIGHT5;
	rename LEFT_EXTERNAL_ROTATION_PROM=LEFT6;
    rename RIGHT_EXTERNAL_ROTATION_PROM=RIGHT6;
	rename LEFT_KNEE_EXTENSION_PROM=LEFT7;
	rename RIGHT_KNEE_EXTENSION_PROM=RIGHT7;
    rename LEFT_KNEE_FLEXION_PROM=LEFT8;
    rename RIGHT_KNEE_FLEXION_PROM=RIGHT8;
    rename LEFT_PLANTARFLEXION_PROM=LEFT9;
    rename RIGHT_PLANTARFLEXION_PROM=RIGHT9;
	rename  LEFT_DORSIFLEXION_PROM=LEFT10;
	rename RIGHT_DORSIFLEXION_PROM=RIGHT10;
    rename LEFT_HIP_FLEXION_AROM=LEFT11;
	rename RIGHT_HIP_FLEXION_AROM=RIGHT11;
	rename LEFT_HIP_EXTENSION_AROM=LEFT12;
    rename RIGHT_HIP_EXTENSION_AROM=RIGHT12;
	rename LEFT_ABDUCTION_AROM=LEFT13;
    rename RIGHT_ABDUCTION_AROM=RIGHT13;
    rename LEFT_ADDUCTION_AROM=LEFT14;
	rename RIGHT_ADDUCTION_AROM=RIGHT14;
	rename LEFT_INTERNAL_ROTATION_AROM=LEFT15;
    rename RIGHT_INTERNAL_ROTATION_AROM=RIGHT15;
	rename LEFT_EXTERNAL_ROTATION_AROM=LEFT16;
	rename RIGHT_EXTERNAL_ROTATION_AROM=RIGHT16;
    rename LEFT_KNEE_EXTENSION_AROM=LEFT17;
    rename RIGHT_KNEE_EXTENSION_AROM=RIGHT17;
	rename  LEFT_KNEE_FLEXION_AROM=LEFT18;
	rename RIGHT_KNEE_FLEXION_AROM=RIGHT18;
    rename LEFT_PLANTARFLEXION_AROM=LEFT19;
	rename RIGHT_PLANTARFLEXION_AROM=RIGHT19;
	rename LEFT_DORSIFLEXION_AROM=LEFT20;
    rename RIGHT_DORSIFLEXION_AROM=RIGHT20;

run;
proc print;run;

data strength;
     set  function.functionaloutcomestrength;
	 rename Accessionnbr_=A_nbr;
    rename TIME_FRAME=Period;
    rename ASSESSMENT_DATE=ASDATE;
	rename  LEFT_HIP_FLEXION=LEFT1;
	rename RIGHT_HIP_FLEXION=RIGHT1;
    rename LEFT_KNEE_EXTENSION=LEFT2;
	rename RIGHT_KNEE_EXTENSION=RIGHT2;
	rename LEFT_DORSIFLEXION=LEFT3;
    rename RIGHT_DORSIFLEXION=RIGHT3;
run;


proc print;run;

  /***********************************************************************************************
way 1: using data step;
***********************************************************************************************
In the preceding example, the libref os08 points to the original location of the data set 
that is on the os08 operating environment. The libref XPORTOUT points to a new location where 
the transport file will be created. The XPORT engine in this LIBNAME statement specifies that the
data set is to be created in transport format. The SET statement reads the data set qolpedsqlcancer
and re-creates it in transport format at the location specified in the DATA statement.*/
  /***********************************************************************************************
***********************************************************************************************/



libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\functional outcome\fma.xpt';
data xportout.fma;
   set fma;
run;


libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\functional outcome\msts.xpt';
data xportout.msts;
   set msts;
run;


libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\functional outcome\promarom.xpt';
data xportout.promarom;
   set promarom;
run;


libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\functional outcome\strength.xpt';
data xportout.strength;
   set strength;
run;

  /***********************************************************************************************
way 1: Using PROC COPY to Create a  sas file from .xpt ;
***********************************************************************************************/

libname sasfile 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\functional outcome';
libname xptfile xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\functional outcome\fma.xpt' access=readonly;
proc copy inlib=xptfile outlib=sasfile;
run;


libname sasfile 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\functional outcome';
libname xptfile xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\functional outcome\msts.xpt' access=readonly;
proc copy inlib=xptfile outlib=sasfile;
run;




libname sasfile 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\functional outcome';
libname xptfile xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\functional outcome\promarom.xpt' access=readonly;
proc copy inlib=xptfile outlib=sasfile;
run;



libname sasfile 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\functional outcome';
libname xptfile xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\functional outcome\strength.xpt' access=readonly;
proc copy inlib=xptfile outlib=sasfile;
run;


/******************************************************************************************************/
/*************** accessing permanent sas dataset  *******************************************************/
/*************  Accessing a permanent SAS dataset using the full pathname********************************/
/* libname location of file*/
/* file created is new,old called is treatgroupdata*/
libname others 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others';



 data Ademo;
     set  others.accrualdemographics;
    rename Accessionnbr_=A_nbr;
    rename ONSTUDYDATE=DATE;
    rename ENROLLINGINSTITUTION=INST;
	rename  BIRTHDATE=BDATE;
	rename CURRENT_AGE=AGE;
	run;
proc print;run;

 data Mdemo;
     set  others.mergedemographics;
    rename Accessionnbr=A_nbr;
    rename T1_Pre_therapy=Therapy1;
    rename T2_Week_10=Week10;
	rename T3_Week_20=Week20;
	rename T4_End_of_Therapy=Therapy2;
	rename T5_6_months_off_therapy=Therapy3;
    rename T6_18_months_off_therapy=Therapy4;
    rename BIRTHDATE=BDATE;
	rename  DATEFIRSTSEEN=DATE;
	rename CURRENT_AGE=C_AGE;
	run;
proc print;run;


data bgrowth;
     set  others.os2008bonegrowth;
    rename Accessionnbr_=A_nbr;
    rename TIMEFRAME=Period;
    rename XRAY_DATE=XRAYDATE;
	rename GROWTH_STATUS=STATUS;
	rename GROWTH_ABNORMALITY=ABNORMAL;
	rename GROWTH_ABNORMALITY_DESCRIPTION=DESCPT;
	run;
proc print;run;




data labdata;
     set  others.os2008labdata;
    rename Accessionnbr_=A_nbr;
    rename ONSTUDYDATE=DATE;
    rename ENROLLINGINSTITUTION=INST;
    rename BIRTHDATE=BDATE;
	rename DATE_ON_STUDY=DATESTUD;
	rename CURRENT_AGE=C_AGE;
	run;
proc print;run;

data Pdemo;
     set  others.os2008patient_demographics;
    rename Accessionnbr_=A_nbr;
    rename DATEFIRSTSEEN=DATE;
    rename BIRTHDATE=BDATE;
	rename CURRENT_AGE=C_AGE;
	run;
proc print;run;

data Paccrual;
     set  others.os2008patientaccrual;
    rename Accessionnbr_=A_nbr;
    rename ONSTUDYDATE=DATE;
    rename ENROLLINGINSTITUTION=INST;;
	run;
proc print;run;

data sexdev;
     set  others.os2008sexualdevparams;
    rename Accessionnbr_=A_nbr;
    rename EVALUATION_DATE=DATE;
    rename TIME_FRAME=TIME;
    rename TANNER_STAGE=TANNER;
	rename DATE_OF_MENARCHE=MENARCHE;
	rename DATE_OF_LAST_MENSES=MENSES;
    rename TAKE_ESTROGEN=ESTROGEN;
    rename TAKE_PROGESTERONE=PROGEST;
    rename LEFT_TESTICULAR_VOLUME=LEFT_T;
    rename RIGHT_TESTICULAR_VOLUME=RIGHT_T;
	rename SPERM_COUNT=SPERM_C;
	run;
proc print;run;


data wheight;
     set  others.os2008weigthheight;
    rename Accessionnbr_=A_nbr;
    rename CYCLE_START_DATE=DATE1;
    rename CYCLE_STOP_DATE=DATE2;
	rename COURSE_DISPOSITION=DISPSITN;
	rename COURSE_EVALUABILITY=EVALUABILITY;
	run;
proc print;run;


data shormone;
     set  others.sexhormonelevels;
    rename Accessionnbr_=A_nbr;
    rename TESTING_TIME=TIME;
    rename TESTOSTERONE=TESTOSTE;
	rename ESTRADIOL_LVL=E_LEVEL;
	run;
proc print;run;




libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\Ademo.xpt';
data xportout.Ademo;
   set Ademo;
run;


libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\Mdemo.xpt';
data xportout.Mdemo;
   set Mdemo;
run;

libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\bgrowth.xpt';
data xportout.bgrowth;
   set bgrowth;
run;

libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\labdata.xpt';
data xportout.labdata;
   set labdata;
run;


libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\Pdemo.xpt';
data xportout.Pdemo;
   set Pdemo;
run;


libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\sexdev.xpt';
data xportout.sexdev;
   set sexdev;
run;

libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\wheight.xpt';
data xportout.wheight;
   set wheight;
run;

libname xportout xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\shormone.xpt';
data xportout.shormone;
   set shormone;
run;


  /***********************************************************************************************
way 1: Using PROC COPY to Create a  sas file from .xpt ;
***********************************************************************************************/

libname sasfile 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others';
libname xptfile xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\Ademo.xpt' access=readonly;
proc copy inlib=xptfile outlib=sasfile;
run;

libname sasfile 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others';
libname xptfile xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\Mdemo.xpt' access=readonly;
proc copy inlib=xptfile outlib=sasfile;
run;


libname sasfile 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others';
libname xptfile xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\bgrowth.xpt' access=readonly;
proc copy inlib=xptfile outlib=sasfile;
run;

libname sasfile 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others';
libname xptfile xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\labdata.xpt' access=readonly;
proc copy inlib=xptfile outlib=sasfile;
run;

libname sasfile 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others';
libname xptfile xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\Mdemo.xpt' access=readonly;
proc copy inlib=xptfile outlib=sasfile;
run;


libname sasfile 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others';
libname xptfile xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\Pdemo.xpt' access=readonly;
proc copy inlib=xptfile outlib=sasfile;
run;

libname sasfile 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others';
libname xptfile xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\sexdev.xpt' access=readonly;
proc copy inlib=xptfile outlib=sasfile;
run;

libname sasfile 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others';
libname xptfile xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\wheight.xpt' access=readonly;
proc copy inlib=xptfile outlib=sasfile;
run;

libname sasfile 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others';
libname xptfile xport 'C:\Users\nboateng\Desktop\st jude\OS08 DATA\others\shormone.xpt' access=readonly;
proc copy inlib=xptfile outlib=sasfile;
run;


ods pdf close;
