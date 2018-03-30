/* c3s1d1: Data Exploration */

options nodate nonumber;

libname mban5110 'c:\Schulich\mban5110';

/* Part A */
title1 'Partial Listing of the Fitness Data';
proc print data=mban5110.fitness(obs=15);
    var Name RunTime Age Gender Weight Run_Pulse Rest_Pulse Maximum_Pulse 
       Performance Oxygen_Consumption;
run;

/* Part B */
ods graphics / reset=all imagemap;

title1 'Correlations and Scatter Plots with Oxygen_Consumption';
proc corr data=mban5110.fitness rank
          plots(only)=scatter(nvar=all ellipse=none);
    var RunTime Age Weight Run_Pulse
        Rest_Pulse Maximum_Pulse Performance;
    with Oxygen_Consumption;
    id name;
run;

/* Part C */

title1 'Scatter Plot Matrix and Correlation of Fitness Predictors';
proc corr data=mban5110.fitness nosimple 
          plots=matrix(nvar=all histogram);
    var RunTime Age Weight Run_Pulse
         Rest_Pulse Maximum_Pulse Performance;
run;
