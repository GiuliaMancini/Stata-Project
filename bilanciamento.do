* Bilanciamento

drop if dummy_obs1==1

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

* female, age, family_economic_conditions, student
sort treat
by treat: sum female

regress female YesDomNoMem NoDomPosMem YesDomPosMem NoDomNegMem YesDomNegMem, robust

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


sort treat
by treat: sum age

regress age YesDomNoMem NoDomPosMem YesDomPosMem NoDomNegMem YesDomNegMem, robust

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


sort treat
by treat: sum family_economic_conditions

regress family_economic_conditions YesDomNoMem NoDomPosMem YesDomPosMem NoDomNegMem YesDomNegMem, robust

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


sort treat
by treat: sum student

regress student YesDomNoMem NoDomPosMem YesDomPosMem NoDomNegMem YesDomNegMem, robust

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
