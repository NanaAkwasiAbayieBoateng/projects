* Written by R;
*  write.foreign(mydata, "C:/Users/nboateng/Desktop/OS08 DATA/OS08 PedsQL 4 deidentified.csv",  ;

PROC FORMAT;
value Mrn 
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

value Age_Grop 
     1 = "child" 
     2 = "teen" 
     3 = "young child" 
;

value Time_Prd 
     1 = "" 
     2 = "End of therapy" 
     3 = "Follow-up Month 18" 
     4 = "Follow-up Month 6" 
     5 = "Pre-therapy" 
     6 = "Week 10" 
     7 = "Week 20/21/22" 
;

value Ac__H_JM 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value I_Hr_A_L 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value SckSt_M_ 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value FdNtTstG 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value S_S_T_M_ 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value I_D_T_F_ 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value F_A_S_S_ 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value N_S___I_ 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value Scr__B_T 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value Wr_E__MT 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value Wrr_MT_W 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value WrryC__R 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value Bothrs_M 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value Slvn_M_P 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value Wr_SPO_R 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value Attntn_T 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value Hrd_Rm_R 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value Nt_Gd_Lk 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value S_My_Scr 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value Embrss_B 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value D_N_H_I_ 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value Dc_A_N_Q 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value Expl_I_P 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "50" 
     6 = "75" 
;

value Nausea 
     1 = "." 
     2 = "10" 
     3 = "100" 
     4 = "15" 
     5 = "20" 
     6 = "25" 
     7 = "30" 
     8 = "31.25" 
     9 = "35" 
     10 = "37.5" 
     11 = "40" 
     12 = "43.75" 
     13 = "45" 
     14 = "5" 
     15 = "50" 
     16 = "55" 
     17 = "60" 
     18 = "62.5" 
     19 = "65" 
     20 = "68.75" 
     21 = "70" 
     22 = "75" 
     23 = "80" 
     24 = "81.25" 
     25 = "83.33" 
     26 = "85" 
     27 = "87.5" 
     28 = "90" 
     29 = "91.67" 
     30 = "95" 
;

value Worry 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "16.67" 
     5 = "25" 
     6 = "33.33" 
     7 = "37.5" 
     8 = "41.67" 
     9 = "50" 
     10 = "58.33" 
     11 = "66.67" 
     12 = "75" 
     13 = "8.33" 
     14 = "83.33" 
     15 = "87.5" 
     16 = "91.67" 
;

value Cgntv_Pr 
     1 = "." 
     2 = "100" 
     3 = "20" 
     4 = "25" 
     5 = "30" 
     6 = "35" 
     7 = "37.5" 
     8 = "40" 
     9 = "45" 
     10 = "50" 
     11 = "55" 
     12 = "60" 
     13 = "62.5" 
     14 = "65" 
     15 = "66.67" 
     16 = "70" 
     17 = "75" 
     18 = "80" 
     19 = "81.25" 
     20 = "85" 
     21 = "87.5" 
     22 = "90" 
     23 = "95" 
;

value Commnctn 
     1 = "." 
     2 = "0" 
     3 = "100" 
     4 = "25" 
     5 = "33.33" 
     6 = "37.5" 
     7 = "41.67" 
     8 = "50" 
     9 = "58.33" 
     10 = "66.67" 
     11 = "75" 
     12 = "8.33" 
     13 = "83.33" 
     14 = "91.67" 
;

DATA  rdata ;
INFILE  "C:/Users/nboateng/Desktop/OS08 DATA/OS08 PedsQL 4 deidentified.csv" 
     DSD 
     LRECL= 111 ;
INPUT
 Mrn
 Age_Group
 Time_Period
 Ache_or_Hurt_JM
 I_Hurt_A_Lot
 SickStomach_Med_reat
 FoodNotTasteGood
 Sick_Stomach_Think_Med_Treat
 I_Don_T_Feel_Hungry
 Foods_And_Smells_Stomach_Upset
 Ndl_Stcks___I_E__I__B_T__I_S___H
 Scared__Blood_Tests
 Scrd_Ndl_St___I_E__I__B_T__I_S__
 Scared_SeeDoctor
 ScaredGotoDoctor
 Scared_GotoHospital
 Worry_Effects__MedTrts
 Worry_tMedtTrts_Working
 WorryCancer__Relapse
 Bothers_Me
 Solving_Math_Pro
 Writing_SchPprsOr_Rpt
 Attention_Things
 Hard_Rem_Read
 Not_Good_Looking
 See_My_Scars
 Embarassed_Body
 Doctor_Nurses_How_I_Feel
 Doctors_And_Nurses_Ques
 Explain_Illness_People
 Pain_and_Hurt
 Nausea
 Procedural_anxiety
 TrtAnxiety
 Worry
 Cognitive_Pro
 Perceived_Phy_Apprc
 Communication
 Total_Score
;
LABEL  Age_Group = "Age.Group" ;
LABEL  Time_Period = "Time.Period" ;
LABEL  Ache_or_Hurt_JM = "Ache.or.Hurt.JM" ;
LABEL  I_Hurt_A_Lot = "I.Hurt.A.Lot" ;
LABEL  SickStomach_Med_reat = "SickStomach.Med.reat" ;
LABEL  Sick_Stomach_Think_Med_Treat = "Sick.Stomach.Think.Med.Treat" ;
LABEL  I_Don_T_Feel_Hungry = "I.Don.T.Feel.Hungry" ;
LABEL  Foods_And_Smells_Stomach_Upset = "Foods.And.Smells.Stomach.Upset" ;
LABEL  Ndl_Stcks___I_E__I__B_T__I_S___H = "Ndle.Sticks...I.E..Injections..Bld.Tests..Iv.S...Hurt" ;
LABEL  Scared__Blood_Tests = "Scared..Blood.Tests" ;
LABEL  Scrd_Ndl_St___I_E__I__B_T__I_S__ = "Scared.Ndle.Sticks...I.E..Injs..Bld.Tests..Iv.S.." ;
LABEL  Scared_SeeDoctor = "Scared.SeeDoctor" ;
LABEL  Scared_GotoHospital = "Scared.GotoHospital" ;
LABEL  Worry_Effects__MedTrts = "Worry.Effects..MedTrts" ;
LABEL  Worry_tMedtTrts_Working = "Worry.tMedtTrts.Working" ;
LABEL  WorryCancer__Relapse = "WorryCancer..Relapse" ;
LABEL  Bothers_Me = "Bothers.Me" ;
LABEL  Solving_Math_Pro = "Solving.Math.Pro" ;
LABEL  Writing_SchPprsOr_Rpt = "Writing.SchPprsOr.Rpt" ;
LABEL  Attention_Things = "Attention.Things" ;
LABEL  Hard_Rem_Read = "Hard.Rem.Read" ;
LABEL  Not_Good_Looking = "Not.Good.Looking" ;
LABEL  See_My_Scars = "See.My.Scars" ;
LABEL  Embarassed_Body = "Embarassed.Body" ;
LABEL  Doctor_Nurses_How_I_Feel = "Doctor.Nurses.How.I.Feel" ;
LABEL  Doctors_And_Nurses_Ques = "Doctors.And.Nurses.Ques" ;
LABEL  Explain_Illness_People = "Explain.Illness.People" ;
LABEL  Pain_and_Hurt = "Pain.and.Hurt" ;
LABEL  Procedural_anxiety = "Procedural.anxiety" ;
LABEL  Cognitive_Pro = "Cognitive.Pro" ;
LABEL  Perceived_Phy_Apprc = "Perceived.Phy.Apprc" ;
LABEL  Total_Score = "Total.Score" ;
FORMAT Mrn Mrn. ;
FORMAT Age_Group Age_Grop. ;
FORMAT Time_Period Time_Prd. ;
FORMAT Ache_or_Hurt_JM Ac__H_JM. ;
FORMAT I_Hurt_A_Lot I_Hr_A_L. ;
FORMAT SickStomach_Med_reat SckSt_M_. ;
FORMAT FoodNotTasteGood FdNtTstG. ;
FORMAT Sick_Stomach_Think_Med_Treat S_S_T_M_. ;
FORMAT I_Don_T_Feel_Hungry I_D_T_F_. ;
FORMAT Foods_And_Smells_Stomach_Upset F_A_S_S_. ;
FORMAT Ndl_Stcks___I_E__I__B_T__I_S___H N_S___I_. ;
FORMAT Scared__Blood_Tests Scr__B_T. ;
FORMAT Worry_Effects__MedTrts Wr_E__MT. ;
FORMAT Worry_tMedtTrts_Working Wrr_MT_W. ;
FORMAT WorryCancer__Relapse WrryC__R. ;
FORMAT Bothers_Me Bothrs_M. ;
FORMAT Solving_Math_Pro Slvn_M_P. ;
FORMAT Writing_SchPprsOr_Rpt Wr_SPO_R. ;
FORMAT Attention_Things Attntn_T. ;
FORMAT Hard_Rem_Read Hrd_Rm_R. ;
FORMAT Not_Good_Looking Nt_Gd_Lk. ;
FORMAT See_My_Scars S_My_Scr. ;
FORMAT Embarassed_Body Embrss_B. ;
FORMAT Doctor_Nurses_How_I_Feel D_N_H_I_. ;
FORMAT Doctors_And_Nurses_Ques Dc_A_N_Q. ;
FORMAT Explain_Illness_People Expl_I_P. ;
FORMAT Nausea Nausea. ;
FORMAT Worry Worry. ;
FORMAT Cognitive_Pro Cgntv_Pr. ;
FORMAT Communication Commnctn. ;
RUN;

proc print data=rdata;
run;
