set more off

log using "C:\Users\luca.corazzini\OneDrive\Desktop\giulia\analis_giulia.smcl", replace

use "C:\Users\luca.corazzini\OneDrive\Desktop\giulia\database_giulia_mancini.dta", clear


drop if dummy_obs1==1

sort treat
by treat: sum life_satisfaction


* confronto LS senza ricordi tra trattamento senza domini e trattamento con domini
ranksum life_satisfaction if treat==1 | treat==2, by(treat)

* confronto LS con ricordi positivi tra trattamento senza domini e trattamento con domini
ranksum life_satisfaction if treat==3 | treat==4, by(treat)

* confronto LS con ricordi negativi tra trattamento senza domini e trattamento con domini
ranksum life_satisfaction if treat==5 | treat==6, by(treat)



* confronto LS senza domini tra trattamento senza ricordi e trattamento con ricordi positivi
ranksum life_satisfaction if treat==1 | treat==3, by(treat)

* confronto LS senza domini tra trattamento senza ricordi e trattamento con ricordi negativi
ranksum life_satisfaction if treat==1 | treat==5, by(treat)

* confronto LS senza domini tra trattamento con ricordi positivi e trattamento con ricordi negativi
ranksum life_satisfaction if treat==3 | treat==5, by(treat)



* confronto LS con domini tra trattamento senza ricordi e trattamento con ricordi positivi
ranksum life_satisfaction if treat==2 | treat==4, by(treat)

* confronto LS con domini tra trattamento senza ricordi e trattamento con ricordi negativi
ranksum life_satisfaction if treat==2 | treat==6, by(treat)

* confronto LS con domini tra trattamento con ricordi positivi e trattamento con ricordi negativi
ranksum life_satisfaction if treat==4 | treat==6, by(treat)



generate NoDomNoMem=0
replace NoDomNoMem=1 if treat==1

generate YesDomNoMem=0
replace YesDomNoMem=1 if treat==2

generate NoDomPosMem=0
replace NoDomPosMem=1 if treat==3

generate YesDomPosMem=0
replace YesDomPosMem=1 if treat==4

generate NoDomNegMem=0
replace NoDomNegMem=1 if treat==5

generate YesDomNegMem=0
replace YesDomNegMem=1 if treat==6


oprobit life_satisfaction YesDomNoMem NoDomPosMem YesDomPosMem NoDomNegMem YesDomNegMem, robust

test YesDomNoMem=NoDomPosMem
test YesDomNoMem=YesDomPosMem
test YesDomNoMem=NoDomNegMem
test YesDomNoMem=YesDomNegMem

test NoDomPosMem=YesDomPosMem
test NoDomPosMem=NoDomNegMem
test NoDomPosMem=YesDomNegMem

test YesDomPosMem=NoDomNegMem
test YesDomPosMem=YesDomNegMem

test NoDomNegMem=YesDomNegMem


oprobit life_satisfaction YesDomNoMem NoDomPosMem YesDomPosMem NoDomNegMem YesDomNegMem female age i.work i.study_title family_economic_conditions minutes_to_social was_positive vaccinated marked_effects_covid number_acquaintances_had_covid dummy_center dummy_south dummy_islands abroad, robust


test YesDomNoMem=NoDomPosMem
test YesDomNoMem=YesDomPosMem
test YesDomNoMem=NoDomNegMem
test YesDomNoMem=YesDomNegMem

test NoDomPosMem=YesDomPosMem
test NoDomPosMem=NoDomNegMem
test NoDomPosMem=YesDomNegMem

test YesDomPosMem=NoDomNegMem
test YesDomPosMem=YesDomNegMem

test NoDomNegMem=YesDomNegMem


* Dalle regressioni risulta che, rispetto al baseline senza domini e senza ricordi, i ricordi negativi non hanno effetto su LS, i ricordi positivi aumentano LS e lo spacchettamento aumenta LS. 


*TO DO:
* 1) Istogrammi per rappresentare le distribuzioni di LS nei diversi trattamenti.
* 2) bilanciamento: le popolazioni assegnate ai differenti trattamenti sono bilanciate rispetto alle principali variabili socio-demografiche?
* 3) Ruolo dei domini? come cambia il loro effetto al variare delle condizioni di ricordi?  

oprobit life_satisfaction satisfaction_economic satisfaction_family satisfaction_job_career satisfaction_friend satisfaction_sentimental_rel satisfaction_health if YesDomNoMem==1, robust
oprobit life_satisfaction satisfaction_economic satisfaction_family satisfaction_job_career satisfaction_friend satisfaction_sentimental_rel satisfaction_health female age i.work i.study_title family_economic_conditions minutes_to_social was_positive vaccinated marked_effects_covid number_acquaintances_had_covid dummy_center dummy_south dummy_islands abroad if YesDomNoMem==1, robust

oprobit life_satisfaction satisfaction_economic satisfaction_family satisfaction_job_career satisfaction_friend satisfaction_sentimental_rel satisfaction_health if YesDomPosMem==1, robust
oprobit life_satisfaction satisfaction_economic satisfaction_family satisfaction_job_career satisfaction_friend satisfaction_sentimental_rel satisfaction_health female age i.work i.study_title family_economic_conditions minutes_to_social was_positive vaccinated marked_effects_covid number_acquaintances_had_covid dummy_center dummy_south dummy_islands abroad if YesDomPosMem==1, robust

oprobit life_satisfaction satisfaction_economic satisfaction_family satisfaction_job_career satisfaction_friend satisfaction_sentimental_rel satisfaction_health if YesDomNegMem==1, robust
oprobit life_satisfaction satisfaction_economic satisfaction_family satisfaction_job_career satisfaction_friend satisfaction_sentimental_rel satisfaction_health female age i.work i.study_title family_economic_conditions minutes_to_social was_positive vaccinated marked_effects_covid number_acquaintances_had_covid dummy_center dummy_south dummy_islands abroad if YesDomNegMem==1, robust



* 4) Aspettattive

sort treat
by treat: sum expectations_life_satisfaction


* confronto expectations senza ricordi tra trattamento senza domini e trattamento con domini
ranksum expectations_life_satisfaction if treat==1 | treat==2, by(treat)

* confronto expectations con ricordi positivi tra trattamento senza domini e trattamento con domini
ranksum expectations_life_satisfaction if treat==3 | treat==4, by(treat)

* confronto expectations con ricordi negativi tra trattamento senza domini e trattamento con domini
ranksum expectations_life_satisfaction if treat==5 | treat==6, by(treat)



* confronto expectations senza domini tra trattamento senza ricordi e trattamento con ricordi positivi
ranksum expectations_life_satisfaction if treat==1 | treat==3, by(treat)

* confronto expectations senza domini tra trattamento senza ricordi e trattamento con ricordi negativi
ranksum expectations_life_satisfaction if treat==1 | treat==5, by(treat)

* confronto expectations senza domini tra trattamento con ricordi positivi e trattamento con ricordi negativi
ranksum expectations_life_satisfaction if treat==3 | treat==5, by(treat)



* confronto expectations con domini tra trattamento senza ricordi e trattamento con ricordi positivi
ranksum expectations_life_satisfaction if treat==2 | treat==4, by(treat)

* confronto expectations con domini tra trattamento senza ricordi e trattamento con ricordi negativi
ranksum expectations_life_satisfaction if treat==2 | treat==6, by(treat)

* confronto expectations con domini tra trattamento con ricordi positivi e trattamento con ricordi negativi
ranksum expectations_life_satisfaction if treat==4 | treat==6, by(treat)





oprobit expectations_life_satisfaction YesDomNoMem NoDomPosMem YesDomPosMem NoDomNegMem YesDomNegMem, robust

test YesDomNoMem=NoDomPosMem
test YesDomNoMem=YesDomPosMem
test YesDomNoMem=NoDomNegMem
test YesDomNoMem=YesDomNegMem

test NoDomPosMem=YesDomPosMem
test NoDomPosMem=NoDomNegMem
test NoDomPosMem=YesDomNegMem

test YesDomPosMem=NoDomNegMem
test YesDomPosMem=YesDomNegMem

test NoDomNegMem=YesDomNegMem


oprobit expectations_life_satisfaction YesDomNoMem NoDomPosMem YesDomPosMem NoDomNegMem YesDomNegMem female age i.work i.study_title family_economic_conditions minutes_to_social was_positive vaccinated marked_effects_covid number_acquaintances_had_covid dummy_center dummy_south dummy_islands abroad, robust

test YesDomNoMem=NoDomPosMem
test YesDomNoMem=YesDomPosMem
test YesDomNoMem=NoDomNegMem
test YesDomNoMem=YesDomNegMem

test NoDomPosMem=YesDomPosMem
test NoDomPosMem=NoDomNegMem
test NoDomPosMem=YesDomNegMem

test YesDomPosMem=NoDomNegMem
test YesDomPosMem=YesDomNegMem

test NoDomNegMem=YesDomNegMem

clear

log close

