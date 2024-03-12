*********************************************
         Strategic interaction code

*********************************************

cd ""

use Strategic interaction.dta, clear	
xtset citycode year

*==========================================
           Table 1: baseline model
*==========================================


*************W1(Table 1 column1)**************
spatwmat using"Wd.dta",name(w1) standardize

******SDM model*******
**random effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate , wmat(w1) model(sdm) type(both) nolog effects re r
est sto sdm_re_w1
**fixed effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate , wmat(w1) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_fe_both_w1

**hausman test
qui xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate , wmat(w1) fe type(both) model(sdm) nsim(500) nolog r

est sto fe1

qui xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate , wmat(w1) model(sdm) type(both) nolog re r

est sto re1

hausman fe1 re1,eq(1:1 2:2 3:3) 

******SAR model*******
**random effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate , wmat(w1) model(sar) type(both) nolog effects re r
est sto sar_re_w1
**fixed effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate , wmat(w1) fe type(both) model(sar) nsim(500) nolog effect r
est sto sar_fe_both_w1

******SEM model*******
**random effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, emat(w1) model(sem) type(both) nolog effects re r
est sto sem_re
**fixed effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, emat(w1) fe type(both) model(sem) nsim(500) nolog effect r

est sto sem_fe_both_w1

***Wald test for sar and sem***
test [Wx]lnpergdp2=[Wx]lnpergdp=[Wx]tradeopen=[Wx]Secondstructure=[Wx]lnpatent=[Wx]lnFixed=[Wx]fiscal_de=[Wx]urbanizationrate=[Wx]education=[Wx]major=[Wx]tenure=[Wx]age=[Wx]hometown=0

testnl ([Wx]lnpergdp2=-[Spatial]rho*[Main]lnpergdp2)([Wx]lnpergdp=-[Spatial]rho*[Main]lnpergdp) ([Wx]tradeopen=-[Spatial]rho*[Main]tradeopen) ([Wx]Secondstructure=-[Spatial]rho*[Main]Secondstructure) ([Wx]lnpatent=-[Spatial]rho*[Main]lnpatent) ([Wx]lnFixed=-[Spatial]rho*[Main]lnFixed) ([Wx]fiscal_de=-[Spatial]rho*[Main]fiscal_de) ([Wx]urbanizationrate=-[Spatial]rho*[Main]urbanizationrate) ([Wx]education=-[Spatial]rho*[Main]education) ([Wx]major=-[Spatial]rho*[Main]major) ([Wx]tenure=-[Spatial]rho*[Main]tenure) ([Wx]age=-[Spatial]rho*[Main]age) ([Wx]hometown=-[Spatial]rho*[Main]hometown) 

***LR test for sar and sem***
quietly xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w1) fe type(both) model(sdm) nsim(500) nolog 
estimates store sdm

quietly xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w1) fe type(both) model(sar) nsim(500) nolog
estimates store sar

quietly xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate,emat(w1) fe type(both) model(sem) nsim(500) nolog  
estimates store sem 

lrtest  sdm  sar
lrtest  sdm  sem  
drop _est_sdm _est_sar _est_sem


*************W2(Table 1 column2)**************

spatwmat using"We.dta",name(w2) standardize
******SDM model*******
**random effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w2) model(sdm) type(both) nolog effects re r
est sto sdm_re
**fixed effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w2) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_fe_both 

**hausman test
qui xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w2) fe type(both) model(sdm) nsim(500) nolog r
est sto fe1
qui xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w2) model(sdm) type(both) nolog re r
est sto re1

hausman fe1 re1,eq(1:1 2:2 3:3) 

******SAR model*******
**random effect
xsmle  lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w2) model(sar) type(both) nolog effects re r
est sto sar_re
**fixed effect
xsmle  lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w2) fe type(both) model(sar) nsim(500) nolog effect r
est sto sar_fe_both


******SEM model*******
**random effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, emat(w2) model(sem) type(both) nolog effects re r
est sto sem_re
**fixed effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, emat(w2) fe type(both) model(sem) nsim(500) nolog effect r
est sto sem_fe_both

***Wald test for sar and sem***
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w2) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_fe_both

test [Wx]lnpergdp2=[Wx]lnpergdp=[Wx]tradeopen=[Wx]Secondstructure=[Wx]lnpatent=[Wx]lnFixed=[Wx]fiscal_de=[Wx]urbanizationrate=[Wx]education=[Wx]major=[Wx]tenure=[Wx]age=[Wx]hometown=0

testnl ([Wx]lnpergdp2=-[Spatial]rho*[Main]lnpergdp2)([Wx]lnpergdp=-[Spatial]rho*[Main]lnpergdp) ([Wx]tradeopen=-[Spatial]rho*[Main]tradeopen) ([Wx]Secondstructure=-[Spatial]rho*[Main]Secondstructure) ([Wx]lnpatent=-[Spatial]rho*[Main]lnpatent) ([Wx]lnFixed=-[Spatial]rho*[Main]lnFixed) ([Wx]fiscal_de=-[Spatial]rho*[Main]fiscal_de) ([Wx]urbanizationrate=-[Spatial]rho*[Main]urbanizationrate) ([Wx]education=-[Spatial]rho*[Main]education) ([Wx]major=-[Spatial]rho*[Main]major) ([Wx]tenure=-[Spatial]rho*[Main]tenure) ([Wx]age=-[Spatial]rho*[Main]age) ([Wx]hometown=-[Spatial]rho*[Main]hometown) 

***LR test for sar and sem***
quietly xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w2) fe type(both) model(sdm) nsim(500) nolog 
estimates store sdm

quietly xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w2) fe type(both) model(sar) nsim(500) nolog
estimates store sar

quietly xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate,emat(w2) fe type(both) model(sem) nsim(500) nolog  
estimates store sem 

lrtest  sdm  sar
lrtest  sdm  sem  
drop _est_sdm _est_sar _est_sem


*************W3(Table 1 column3)**************
spatwmat using"Wde3.dta",name(w3) standardize

******SDM model*******
**random effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w3) model(sdm) type(both) nolog effects re r
est sto sdm_re
**fixed effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w3) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_fe_both

**hausman test
qui xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w3) fe type(both) model(sdm) nsim(500) nolog r
est sto fe3
qui xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w3) model(sdm) type(both) nolog re r
est sto re3

hausman fe3 re3,eq(1:1 2:2 3:3) 

******SAR model*******
**random effect
xsmle  lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w3) model(sar) type(both) nolog effects re r
est sto sar_re
**fixed effect
xsmle  lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w3) fe type(both) model(sar) nsim(500) nolog effect r
est sto sar_fe_both

******SEM model*******
**random effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, emat(w3) model(sem) type(both) nolog effects re r
est sto sem_re
**fixed effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, emat(w3) fe type(both) model(sem) nsim(500) nolog effect r
est sto sem_fe_both
esttab sem_fe_time sem_fe_ind sem_fe_both using CI_sem.rtf,se mtitles star(* 0.1 ** 0.05 *** 0.01) b(%4.3f) se(%4.3f) r2(%4.3f) 

***Wald test for sar and sem***

xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w3) fe type(both) model(sdm) nsim(500) nolog effect r

est sto sdm_fe_both

test [Wx]lnpergdp2=[Wx]lnpergdp=[Wx]tradeopen=[Wx]Secondstructure=[Wx]lnpatent=[Wx]lnFixed=[Wx]fiscal_de=[Wx]urbanizationrate=[Wx]education=[Wx]major=[Wx]tenure=[Wx]age=[Wx]hometown=0

testnl ([Wx]lnpergdp2=-[Spatial]rho*[Main]lnpergdp2)([Wx]lnpergdp=-[Spatial]rho*[Main]lnpergdp) ([Wx]tradeopen=-[Spatial]rho*[Main]tradeopen) ([Wx]Secondstructure=-[Spatial]rho*[Main]Secondstructure) ([Wx]lnpatent=-[Spatial]rho*[Main]lnpatent) ([Wx]lnFixed=-[Spatial]rho*[Main]lnFixed) ([Wx]fiscal_de=-[Spatial]rho*[Main]fiscal_de) ([Wx]urbanizationrate=-[Spatial]rho*[Main]urbanizationrate)([Wx]education=-[Spatial]rho*[Main]education) ([Wx]major=-[Spatial]rho*[Main]major) ([Wx]tenure=-[Spatial]rho*[Main]tenure) ([Wx]age=-[Spatial]rho*[Main]age) ([Wx]hometown=-[Spatial]rho*[Main]hometown) 

***LR test for sar and sem***
quietly xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w3) fe type(both) model(sdm) nsim(500) nolog 
estimates store sdm

quietly xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w3) fe type(both) model(sar) nsim(500) nolog
estimates store sar

quietly xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate,emat(w3) fe type(both) model(sem) nsim(500) nolog  
estimates store sem 

lrtest  sdm  sar
lrtest  sdm  sem  
drop _est_sdm _est_sar _est_sem

*************W4(Table 1 column4)**************
spatwmat using"Wad.dta",name(w4) standardize

******SDM model*******
**random effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w4) model(sdm) type(both) nolog effects re r
est sto sdm_re
**fixed effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w4) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_fe_both

**hausman test
qui xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w4) fe type(both) model(sdm) nsim(500) nolog r
est sto fe4
qui xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w4) model(sdm) type(both) nolog re r
est sto re4

hausman fe4 re4,eq(1:1 2:2 3:3) 

******SAR model*******
**random effect
xsmle  lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w4) model(sar) type(both) nolog effects re r
est sto sar_re
**fixed effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w4) fe type(both) model(sar) nsim(500) nolog effect r
est sto sar_fe_both
esttab sar_re sar_fe_time sar_fe_ind sar_fe_both using CI_sar.rtf,se mtitles star(* 0.1 ** 0.05 *** 0.01) b(%4.3f) se(%4.3f) r2(%4.3f) 

******SEM model*******
**random effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, emat(w4) model(sem) type(both) nolog effects re r
est sto sem_re
**fixed effect
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, emat(w4) fe type(both) model(sem) nsim(500) nolog effect r
est sto sem_fe_both
esttab sem_fe_time sem_fe_ind sem_fe_both using CI_sem.rtf,se mtitles star(* 0.1 ** 0.05 *** 0.01) b(%4.3f) se(%4.3f) r2(%4.3f) 


***Wald test for sar and sem***
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w4) fe type(both) model(sdm) nsim(500) nolog effect r

test [Wx]lnpergdp2=[Wx]lnpergdp=[Wx]tradeopen=[Wx]Secondstructure=[Wx]lnpatent=[Wx]lnFixed=[Wx]fiscal_de=[Wx]urbanizationrate=[Wx]education=[Wx]major=[Wx]tenure=[Wx]age=[Wx]hometown=0

testnl ([Wx]lnpergdp2=-[Spatial]rho*[Main]lnpergdp2)([Wx]lnpergdp=-[Spatial]rho*[Main]lnpergdp) ([Wx]tradeopen=-[Spatial]rho*[Main]tradeopen) ([Wx]Secondstructure=-[Spatial]rho*[Main]Secondstructure) ([Wx]lnpatent=-[Spatial]rho*[Main]lnpatent) ([Wx]lnFixed=-[Spatial]rho*[Main]lnFixed)([Wx]fiscal_de=-[Spatial]rho*[Main]fiscal_de)([Wx]urbanizationrate=-[Spatial]rho*[Main]urbanizationrate)([Wx]education=-[Spatial]rho*[Main]education) ([Wx]major=-[Spatial]rho*[Main]major) ([Wx]tenure=-[Spatial]rho*[Main]tenure) ([Wx]age=-[Spatial]rho*[Main]age) ([Wx]hometown=-[Spatial]rho*[Main]hometown) 

***LR test for sar and sem***
quietly xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w4) fe type(both) model(sdm) nsim(500) nolog 
estimates store sdm

quietly xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w4) fe type(both) model(sar) nsim(500) nolog
estimates store sar

quietly xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate,emat(w4) fe type(both) model(sem) nsim(500) nolog  
estimates store sem 

lrtest  sdm  sar
lrtest  sdm  sem  
drop _est_sdm _est_sar _est_sem

esttab sdm_fe_both_w1 sdm_fe_both_w2 sdm_fe_both_w3 sdm_fe_both_w4 using CI_table1.rtf,se mtitles star(* 0.1 ** 0.05 *** 0.01) b(%4.3f) se(%4.3f) r2(%4.3f) 

*--end



*============================================================
       Table 2:  SDM, (Direct, indirect, and total effects)
*============================================================
spatwmat using"Wde.dta",name(w3) standardize 
use strategic interaction.dta, clear	
xtset citycode year
quietly xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, fe model(sdm) wmat(w3) nolog effects type(both)
est store both

esttab sdm_ using CI_sem.rtf,se mtitles star(* 0.1 ** 0.05 *** 0.01) b(%4.3f) se(%4.3f) r2(%4.3f) 

*--end

*============================================================
                    Table E5: Robust test
*============================================================

******replace dependent variable (Column 1)
use strategic interaction.dta, clear	
spatwmat using"Wde_energy.dta",name(w) standardize 
xtset citycode year
xsmle EI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, fe model(sdm) wmat(w) nolog effects type(both)
est store EI_both

******replace dependent variable (Column 2)
spatwmat using"Wde.dta",name(w3) standardize 
xtset citycode year
xsmle DCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, fe model(sdm) wmat(w3) nolog effects type(both)
est store DCI_both

******consider lag term (Column 3)
xtreg lnCI CI_lag2  education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate Secondstructure_ρ tradeopen_ρ education_ρ major_ρ tenure_ρ age_ρ hometown_ρ lnpatent_ρ lnpergdp_ρ lnFixed_ρ fiscal_de_ρ lnpergdp2_ρ urbanizationrate_ρ i.year, fe
est sto fe_lag

xtreg lnCI CI_lag2  education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate Secondstructure_ρ tradeopen_ρ education_ρ major_ρ tenure_ρ age_ρ hometown_ρ lnpatent_ρ lnpergdp_ρ lnFixed_ρ fiscal_de_ρ lnpergdp2_ρ urbanizationrate_ρ  , re
est sto re_lag

hausman fe_lag re_lag

******replace spatial model (Column 4)
spatwmat using"Wde.dta",name(w3) standardize 
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate, wmat(w3) dlag(2) fe type(both) model(sdm) durbin(  )  eff nsim(500) r nolog   
est sto sdm_fe_da2

esttab EI_both DCI_both fe_lag sdm_fe_da2 using robust.rtf,se mtitles star(* 0.1 ** 0.05 *** 0.01) b(%4.3f) se(%4.3f) r2(%4.3f) 

*--end


*============================================================
  Figure 1. Heterogeneity analysis of spatio-temporal interaction effects.
*============================================================

****Figure1a
clear
use strategic interaction.dta, clear	
xtset citycode year
spatwmat using "Wd_100c.dta",name(w100) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w100) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w100

spatwmat using "Wd_200c.dta",name(w200) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w200) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w200

spatwmat using "Wd_300c.dta",name(w300) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w300) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w300

spatwmat using "Wd_400c.dta",name(w400) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w400) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w400

spatwmat using "Wd_500c.dta",name(w500) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w500) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w500

spatwmat using "Wd_600c.dta",name(w600) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w600) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w600

spatwmat using "Wd_700c.dta",name(w700) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w700) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w700

spatwmat using "Wd_800c.dta",name(w800) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w800) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w800

spatwmat using "Wd_900c.dta",name(w900) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w900) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w900

spatwmat using "Wd_1000c.dta",name(w1000) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w1000) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w1000

spatwmat using "Wd_1100c.dta",name(w1100) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w1100) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w1100

spatwmat using "Wd_1200c.dta",name(w1200) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w1200) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w1200

spatwmat using "Wd_1300c.dta",name(w1300) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w1300) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w1300

spatwmat using "Wd_1400c.dta",name(w1400) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w1400) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w1400

spatwmat using "Wd_1500c.dta",name(w1500) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w1500) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w1500

spatwmat using "Wd_1600c.dta",name(w1600) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w1600) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w1600

spatwmat using "Wd_1700c.dta",name(w1700) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w1700) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w1700

spatwmat using "Wd_1800c.dta",name(w1800) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w1800) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w1800

spatwmat using "Wd_1900c.dta",name(w1900) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w1900) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w1900

spatwmat using "Wd_2000c.dta",name(w2000) standardize 
xsmle lnCI lnpergdp2 lnpergdp tradeopen second_third lnpatent lnFixed fiscal_de urbanizationrate windspeed precipitation humidity education major tenure age hometown, wmat(w2000) fe type(both) model(sdm) nsim(500) nolog effect r
est sto sdm_w2000

esttab sdm_w100 sdm_w200  sdm_w300 sdm_w400 sdm_w500 sdm_w600 sdm_w700 sdm_w800 sdm_w900 sdm_w1000 sdm_w1100 sdm_w1200 sdm_w1300 sdm_w1400  sdm_w1500  sdm_w1600  sdm_w1700   sdm_w1800  sdm_w1900 sdm_w2000 using heter_distance.rtf,se mtitles star(* 0.1 ** 0.05 *** 0.01) b(%4.3f) se(%4.3f) r2(%4.3f) 


global distance "sdm_w100 sdm_w200 sdm_w300 sdm_w400 sdm_w500 sdm_w600 sdm_w700 sdm_w800 sdm_w900 sdm_w1000 sdm_w1100 sdm_w1200 sdm_w1300 sdm_w1400 sdm_w1500 sdm_w1600 sdm_w1700 sdm_w1800  sdm_w1900  sdm_w2000" 
  
  coefplot ($distance), drop(_cons) keep(rho) aseq swapnames vertical  xlabel(1 `"{fontface "STsong":100}"' 2 `"{fontface "STsong":200}"' 3 `"{fontface "STsong":300}"' 4 `"{fontface "STsong":400}"' 5 `"{fontface "STsong":500}"' 6 `"{fontface "STsong":600}"' 7 `"{fontface "STsong":700}"' 8 `"{fontface "STsong":800}"' 9 `"{fontface "STsong":900}"' 10 `"{fontface "STsong":1000}"' 11 `"{fontface "STsong":1100}"' 12 `"{fontface "STsong":1200}"' 13 `"{fontface "STsong":1300}"' 14 `"{fontface "STsong":1400}"' 15 `"{fontface "STsong":1500}"', labsize(*0.78)) ciopt(recast(rcap) lcolor(black)) ylabel(-1(0.5)1,nogrid labsize(*0.78))  xtitle(`"{fontface "STsong":distance:km}"') addplot(line @b @at, lp(shortdash) lcolor(black)) mcolor(black) yline(0, lp(dot) lcolor(black)) yline(-186.842, lp(dash) lcolor(black)) ytitle(`"{fontface "STsong":Strategic interaction }"') graphregion(color(white)) plotregion(lcolor(black) lpattern(blank)) scheme(s1mono)  xline(14.5, noextend lcolor(red)) 
   gr export "distance_CI.png", replace width(2000)
   
  save data_distance_CI,replace
*--end


*******Figure1b
clear
use strategic interaction.dta, clear	
xtset citycode year
spatwmat using"Wde.dta",name(w3) standardize 

***2001-2005 
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate if year<=2005&year>=2001 , wmat(w3) fe type(both) model(sdm) nsim(500) nolog effect r  
est sto sdm_10FYP

***2006-2010
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate if year<=2010&year>=2006, wmat(w3) fe type(both) model(sdm) nsim(500) nolog effect r  
est sto sdm_11FYP

***2011-2015
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate if year>=2011&year<=2015, wmat(w3) fe type(both) model(sdm) nsim(500) nolog effect r  
est sto sdm_12FYP

***2016-2020
xsmle lnCI education major tenure age hometown lnpergdp2 lnpergdp tradeopen Secondstructure lnpatent lnFixed fiscal_de urbanizationrate if year>=2016&year<=2019, wmat(w3) fe type(both) model(sdm) nsim(500) nolog effect r 
est sto sdm_13FYP

esttab sdm_10FYP  sdm_11FYP sdm_12FYP  sdm_13FYP using FYP.rtf,se mtitles star(* 0.1 ** 0.05 *** 0.01) b(%4.3f) se(%4.3f) r2(%4.3f) 


*--end
 
*===========================================================================
Tips: Figure 2 and Figure 3 please see file "strategic interaction_code.m" )
*===========================================================================
          
 
 


          
 
 

