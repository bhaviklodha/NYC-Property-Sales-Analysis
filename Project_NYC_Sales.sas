/*Project : Price Prediction of New York Property sales*/
/*Varibles Used: Borough, Zip_Code, Total_units, Land_Square_Feet, 
Gross_Square_Feet, Year_Built, Sale_Price, Date_Sale*/

/*Borough 1*/

/* Step 1: Data Cleaning - Filter the data */

	data nyc_all_s1;
	set nyc_all;
	if sale_price>999 and total_units>0 and gross_square_feet>0 and land_square_feet>0;
	gross_squr= input(gross_square_feet,best.);
  	land_squr=input(land_square_feet,best.);
	run;

/* Step 2 : Keep the required fields of the entire dataset */

	data nyc_all_s2;
	keep borough zip_code total_units land_squr gross_squr sale_price;
	set nyc_all_s1;
	run;

/* Step 3: Filter data for borough 1 */ 

	data nyc_all_s2_b1;
	set nyc_all_s2;
	if borough=1;
	run;

/* Step 4: Apply Mutiple Regression on the dependent variable to verify outliers */

	proc reg data = nyc_all_s2_b1;
	    model Sale_price = total_units gross_squr land_squr / dwProb VIF selection=stepwise; /*stepwise */
	run;

/* Step 5: Apply univariate analysis to identify and remove outliers */

	proc univariate data = nyc_all_s2_b1 ;
	var Sale_price total_units gross_squr land_squr;
	HISTOGRAM / NORMAL (COLOR=RED);
	run;


data nyc_all_s2_del_b1;
	set nyc_all_s2_b1;
	if land_squr > 66825 then delete;
	if gross_squr > 555954 then delete;

	keep borough zip_code total_units land_squr gross_squr sale_price;
	
run;


data nyc_all_bor_1;
	set nyc_all_s2_del_b1;
if zip_code=10001  then ZipCode_1=1;
   		else ZipCode_1=0;
	if zip_code=10002  then ZipCode_2=1;
   		else ZipCode_2=0;
	if zip_code=10003  then ZipCode_3=1;
   		else ZipCode_3=0;
	if zip_code=10004  then ZipCode_4=1;
   		else ZipCode_4=0;
	if zip_code=10005  then ZipCode_5=1;
   		else ZipCode_5=0;
	if zip_code=10006  then ZipCode_6=1;
   		else ZipCode_6=0;
	if zip_code=10007  then ZipCode_7=1;
   		else ZipCode_7=0;
	if zip_code=10009  then ZipCode_8=1;
   		else ZipCode_8=0;
	if zip_code=10010  then ZipCode_9=1;
   		else ZipCode_9=0;
	if zip_code=10011  then ZipCode_10=1;
   		else ZipCode_10=0;
	if zip_code=10012  then ZipCode_11=1;
   		else ZipCode_11=0;
	if zip_code=10013  then ZipCode_12=1;
   		else ZipCode_12=0;
	if zip_code=10014  then ZipCode_13=1;
   		else ZipCode_13=0;
	if zip_code=10016  then ZipCode_14=1;
   		else ZipCode_14=0;
	if zip_code=10017  then ZipCode_15=1;
   		else ZipCode_15=0;
	if zip_code=10018  then ZipCode_16=1;
   		else ZipCode_16=0;
	if zip_code=10019  then ZipCode_17=1;
   		else ZipCode_17=0;
	if zip_code=10021  then ZipCode_18=1;
   		else ZipCode_18=0;
	if zip_code=10022  then ZipCode_19=1;
   		else ZipCode_19=0;
	if zip_code=10023  then ZipCode_20=1;
   		else ZipCode_20=0;
	if zip_code=10024  then ZipCode_21=1;
   		else ZipCode_21=0;
	if zip_code=10025  then ZipCode_22=1;
   		else ZipCode_22=0;
	if zip_code=10026  then ZipCode_23=1;
   		else ZipCode_23=0;
	if zip_code=10027 then ZipCode_24=1;
  		else ZipCode_24=0;
	if zip_code=10028 then ZipCode_25=1;
   		else ZipCode_25=0;
	if zip_code=10029 then ZipCode_26=1;
   		else ZipCode_26=0;
	if zip_code=10030 then ZipCode_27=1;
   		else ZipCode_27=0;
	if zip_code=10031 then ZipCode_28=1;
   		else ZipCode_28=0;
	if zip_code=10032 then ZipCode_29=1;
   		else ZipCode_29=0;
	if zip_code=10033 then ZipCode_30=1;
   		else ZipCode_30=0;
	if zip_code=10034 then ZipCode_31=1;
   		else ZipCode_31=0;
	if zip_code=10035 then ZipCode_32=1;
   		else ZipCode_32=0;
	if zip_code=10036 then ZipCode_33=1;
   		else ZipCode_33=0;
	if zip_code=10037 then ZipCode_34=1;
   		else ZipCode_34=0;
	if zip_code=10039 then ZipCode_35=1;
   		else ZipCode_35=0;
	if zip_code=10040 then ZipCode_36=1;
   		else ZipCode_36=0;
	if zip_code=10040 then ZipCode_37=1;
   		else ZipCode_37=0;
	if zip_code=10044 then ZipCode_38=1;
   		else ZipCode_38=0;
	if zip_code=10065 then ZipCode_39=1;
   		else ZipCode_39=0;
	if zip_code=10069 then ZipCode_40=1;
   		else ZipCode_40=0;
	if zip_code=10075 then ZipCode_41=1;
   		else ZipCode_41=0;
	if zip_code=10105 then ZipCode_42=1;
   		else ZipCode_42=0;
	if zip_code=10128 then ZipCode_43=1;
   		else ZipCode_43=0;
	if zip_code=10167 then ZipCode_44=1;
   		else ZipCode_44=0;
	if zip_code=10280 then ZipCode_44=1;
   		else ZipCode_44=0;
	if zip_code=10282 then ZipCode_45=1;
   		else ZipCode_45=0;
	if zip_code=10463 then ZipCode_46=1;
   		else ZipCode_46=0;
run;


proc sort data=nyc_all_bor_1;
	by zip_code;
run;


proc reg data=nyc_all_bor_1;

	model sale_price= total_units gross_squr land_squr Zipcode_1 --Zipcode_46 /VIF selection=stepwise slentry=0.05;;

run;

proc princomp data =nyc_all_bor_1 out=nyc_all_bor_1_pca;
    var gross_squr zipcode_1 zipcode_4 zipcode_5 zipcode_6 zipcode_9 zipcode_10 zipcode_11 zipcode_12 zipcode_13 zipcode_17
		zipcode_19 zipcode_34;
run;


proc reg data=nyc_all_bor_1_pca PLOTS(MAXPOINTS=10000 );

	model sale_price= gross_squr zipcode_1 zipcode_4 zipcode_5 zipcode_6 zipcode_9 zipcode_17 zipcode_34;
	
run;


/*-----------------------------------------------------------------------------------------*/


/*Borough 2*/

	data nyc_all;
	set nyc;
	if sale_price>999 and total_units>0 and gross_square_feet>0 and land_square_feet>0;
	gross_squr= input(gross_square_feet,best.);
  	land_squr=input(land_square_feet,best.);
	run;

	data nyc_normal_all;
	keep borough zip_code total_units land_squr gross_squr sale_price  ;
	set nyc_all;
	run;


	proc standard data=nyc_normal_all mean=0 std=1 out=nyc_normalized_all; /*normalized  data in nyc_normal*/
	Var total_units land_squr gross_squr sale_price ;
	
	run;


	data Nyc_zipcode_Normal_B2;

 	set nyc_normalized_all;

	if borough=2;
  		
   	if zip_code=0 then delete;
	if zip_code=10457 then v_zip_code_1=1;
           else v_zip_code_1=0;
	if zip_code=10458 then v_zip_code_2=1;
           else v_zip_code_2=0;
	if zip_code=10451 then v_zip_code_3=1;
           else v_zip_code_3=0;
	if zip_code=10456 then v_zip_code_4=1;
           else v_zip_code_4=0;
	if zip_code=10469 then v_zip_code_5=1;
           else v_zip_code_5=0;
	if zip_code=10466 then v_zip_code_6=1;
           else v_zip_code_6=0;
	if zip_code=10475 then v_zip_code_7=1;
           else v_zip_code_7=0;
	if zip_code=10468 then v_zip_code_8=1;
           else v_zip_code_8=0;
	if zip_code=10467 then v_zip_code_9=1;
           else v_zip_code_9=0;
	if zip_code=10473 then v_zip_code_10=1;
           else v_zip_code_10=0;
	if zip_code=10472 then v_zip_code_11=1;
           else v_zip_code_11=0;
	if zip_code=10464 then v_zip_code_12=1;
           else v_zip_code_12=0;
	if zip_code=10462 then v_zip_code_13=1;
           else v_zip_code_13=0;
	if zip_code=10803 then v_zip_code_14=1;
           else v_zip_code_14=0;
	if zip_code=10465 then v_zip_code_15=1;
           else v_zip_code_15=0;
	if zip_code=10459 then v_zip_code_16=1;
           else v_zip_code_16=0;
	if zip_code=10471 then v_zip_code_17=1;
           else v_zip_code_17=0;
	if zip_code=10453 then v_zip_code_18=1;
           else v_zip_code_18=0;
	if zip_code=10452 then v_zip_code_19=1;
           else v_zip_code_19=0;
	if zip_code=10454 then v_zip_code_20=1;
           else v_zip_code_20=0;
	if zip_code=10474 then v_zip_code_21=1;
           else v_zip_code_21=0;
	if zip_code=10455 then v_zip_code_22=1;
           else v_zip_code_22=0;
	if zip_code=10463 then v_zip_code_23=1;
           else v_zip_code_23=0;
	if zip_code=10461 then v_zip_code_24=1;
           else v_zip_code_24=0;
	if zip_code=10470 then v_zip_code_25=1;
           else v_zip_code_25=0;
	if zip_code=10467 then v_zip_code_26=1;
           else v_zip_code_26=0;
run;


proc sort data=Nyc_zipcode_Normal_B2;
	by zip_code;
run;

proc reg data=Nyc_zipcode_Normal_B2;

	model sale_price= total_units gross_squr land_squr v_zip_code_1 --v_zip_code_26 /VIF selection=stepwise slentry=0.05;

	run;

	
proc reg data=Nyc_zipcode_Normal_B2;

	model sale_price= total_units  gross_squr land_squr v_zip_code_3 v_zip_code_8 v_zip_code_23 ;

	run;




/*-----------------------------------------------------------------------------------------*/

/* Borough 3*/

/* Step 1: Filter the data */
data nyc_all_s1;
	set nyc_all;
	if sale_price>999 and total_units>0 and gross_square_feet>0 and land_square_feet>0;
	gross_squr= input(gross_square_feet,best.);
  	land_squr=input(land_square_feet,best.);
	run;

/* Step 2 : Keep the required fields */
	data nyc_all_s2;
	keep borough zip_code total_units land_squr gross_squr sale_price;
	set nyc_all_s1;
	run;

/* Step 3: Normalize the data */
	proc standard data=nyc_all_s2 mean=0 std=1 out=nyc_all_normal; 
	Var total_units land_squr gross_squr sale_price;
	run;

/* Step 4: Segregate data for borough 3 and delete all rows with 0 as zipcode and create n columns for n distinct zipcodes in a 
	       borough */
data nyc_all_bor_3;
	set nyc_all_normal;

if borough=3;
if zip_code=0 then delete;

if zip_code=11228 then v_zip_code_1=1;
           else v_zip_code_1=0;
if zip_code=11214 then v_zip_code_2=1;
           else v_zip_code_2=0;
if zip_code=11220 then v_zip_code_3=1;
           else v_zip_code_3=0;
if zip_code=11209 then v_zip_code_4=1;
           else v_zip_code_4=0;
if zip_code=11219 then v_zip_code_5=1;
           else v_zip_code_5=0;
if zip_code=11221 then v_zip_code_6=1;
           else v_zip_code_6=0;
if zip_code=11233 then v_zip_code_7=1;
           else v_zip_code_7=0;
if zip_code=11213 then v_zip_code_8=1;
           else v_zip_code_8=0;
if zip_code=11206 then v_zip_code_9=1;
           else v_zip_code_9=0;
if zip_code=11216 then v_zip_code_10=1;
           else v_zip_code_10=0;
if zip_code=11205 then v_zip_code_11=1;
           else v_zip_code_11=0;
if zip_code=11238 then v_zip_code_12=1;
           else v_zip_code_12=0;
if zip_code=11226 then v_zip_code_13=1;
           else v_zip_code_13=0;
if zip_code=11204 then v_zip_code_14=1;
           else v_zip_code_14=0;
if zip_code=11234 then v_zip_code_15=1;
           else v_zip_code_15=0;
if zip_code=11217 then v_zip_code_16=1;
           else v_zip_code_16=0;
if zip_code=11201 then v_zip_code_17=1;
           else v_zip_code_17=0;
if zip_code=11218 then v_zip_code_18=1;
           else v_zip_code_18=0;
if zip_code=11232 then v_zip_code_19=1;
           else v_zip_code_19=0;
if zip_code=11230 then v_zip_code_20=1;
           else v_zip_code_20=0;
if zip_code=11235 then v_zip_code_21=1;
           else v_zip_code_21=0;
if zip_code=11212 then v_zip_code_22=1;
           else v_zip_code_22=0;
if zip_code=11237 then v_zip_code_23=1;
           else v_zip_code_23=0;
if zip_code=11207 then v_zip_code_24=1;
           else v_zip_code_24=0;
if zip_code=11236 then v_zip_code_25=1;
           else v_zip_code_25=0;
if zip_code=11239 then v_zip_code_26=1;
           else v_zip_code_26=0;
if zip_code=11231 then v_zip_code_27=1;
           else v_zip_code_27=0;
if zip_code=11249 then v_zip_code_28=1;
           else v_zip_code_28=0;
if zip_code=11224 then v_zip_code_29=1;
           else v_zip_code_29=0;
if zip_code=11225 then v_zip_code_30=1;
           else v_zip_code_30=0;
if zip_code=11208 then v_zip_code_31=1;
           else v_zip_code_31=0;
if zip_code=11210 then v_zip_code_32=1;
           else v_zip_code_32=0;
if zip_code=11203 then v_zip_code_33=1;
           else v_zip_code_33=0;
if zip_code=11229 then v_zip_code_34=1;
           else v_zip_code_34=0;
if zip_code=11215 then v_zip_code_35=1;
	   else v_zip_code_35=0;
if zip_code=11223 then v_zip_code_36=1;
	   else v_zip_code_36=0;
if zip_code=11222 then v_zip_code_37=1;
	   else v_zip_code_37=0;
if zip_code=11211 then v_zip_code_38=1;
 	   else v_zip_code_38=0;
run;

/* Step 5: Sort the data as per zip-code */
proc sort data=nyc_all_bor_3;
	by zip_code;
run;

/* Step 6:Run regression on the sorted dataset */
proc reg data=nyc_all_bor_3;

	model sale_price= total_units gross_squr land_squr v_zip_code_1 --v_zip_code_38 /VIF selection=stepwise slentry=0.05;;

run;

/* Step 7: Perform regression analysis on the variables which have a variance of less than 5% */

proc reg data=nyc_all_bor_3 PLOTS(MAXPOINTS=10000 );

	model sale_price= gross_squr v_zip_code_11 v_zip_code_12 v_zip_code_13 v_zip_code_16 v_zip_code_17 v_zip_code_22 
					  v_zip_code_27 v_zip_code_28 v_zip_code_31 v_zip_code_35 v_zip_code_38;
	
run;


/* R-Square: 36% */



/*-----------------------------------------------------------------------------------------*/

/*Borough 4*/
data nyc_all_s1;
	set nyc;
	if sale_price>999 and total_units>0 and gross_square_feet>0 and land_square_feet>0;
	gross_squr= input(gross_square_feet,best.);
  	land_squr=input(land_square_feet,best.);
	run;

/* Step 2 : Keep the required fields of the entire dataset */

	data nyc_all_s2;
	keep borough zip_code total_units land_squr gross_squr sale_price;
	set nyc_all_s1;
	run;

/* Step 3: Filter data for borough 1 */ 

	data nyc_all_s2_b1;
	set nyc_all_s2;
	if borough=4;
	run;

/* Step 4: Segregate data for borough 3 and delete all rows with 0 as zipcode and create n columns for n distinct zipcodes in a 
	       borough */
data nyc_all_bor_4;
	set nyc_all_s2_b1;

if zip_code=0 then delete;

if zip_code=11001  then ZipCode_1=1;
   		else ZipCode_1=0;
	if zip_code=11004  then ZipCode_2=1;
   		else ZipCode_2=0;
	if zip_code=11005  then ZipCode_3=1;
   		else ZipCode_3=0;
	if zip_code=11040  then ZipCode_4=1;
   		else ZipCode_4=0;
	if zip_code=11101  then ZipCode_5=1;
   		else ZipCode_5=0;
	if zip_code=11102  then ZipCode_6=1;
   		else ZipCode_6=0;
	if zip_code=11103  then ZipCode_7=1;
   		else ZipCode_7=0;
	if zip_code=11104  then ZipCode_8=1;
   		else ZipCode_8=0;
	if zip_code=11105  then ZipCode_9=1;
   		else ZipCode_9=0;
	if zip_code=11106  then ZipCode_10=1;
   		else ZipCode_10=0;
	if zip_code=11109  then ZipCode_11=1;
   		else ZipCode_11=0;
	if zip_code=11354  then ZipCode_12=1;
   		else ZipCode_12=0;
	if zip_code=11355  then ZipCode_13=1;
   		else ZipCode_13=0;
	if zip_code=11356  then ZipCode_14=1;
   		else ZipCode_14=0;
	if zip_code=11357  then ZipCode_15=1;
   		else ZipCode_15=0;
	if zip_code=11358  then ZipCode_16=1;
   		else ZipCode_16=0;
	if zip_code=11360  then ZipCode_17=1;
   		else ZipCode_17=0;
	if zip_code=11361  then ZipCode_18=1;
   		else ZipCode_18=0;
	if zip_code=11362  then ZipCode_19=1;
   		else ZipCode_19=0;
	if zip_code=11363  then ZipCode_20=1;
   		else ZipCode_20=0;
	if zip_code=11364  then ZipCode_21=1;
   		else ZipCode_21=0;
	if zip_code=11365  then ZipCode_22=1;
   		else ZipCode_22=0;
	if zip_code=11366  then ZipCode_23=1;
   		else ZipCode_23=0;
	if zip_code=11367 then ZipCode_24=1;
  		else ZipCode_24=0;
	if zip_code=11368 then ZipCode_25=1;
   		else ZipCode_25=0;
	if zip_code=11369 then ZipCode_26=1;
   		else ZipCode_26=0;
	if zip_code=11370 then ZipCode_27=1;
   		else ZipCode_27=0;
	if zip_code=11372 then ZipCode_28=1;
   		else ZipCode_28=0;
	if zip_code=11373 then ZipCode_29=1;
   		else ZipCode_29=0;
	if zip_code=11374 then ZipCode_30=1;
   		else ZipCode_30=0;
	if zip_code=11375 then ZipCode_31=1;
   		else ZipCode_31=0;
	if zip_code=11377 then ZipCode_32=1;
   		else ZipCode_32=0;
	if zip_code=11378 then ZipCode_33=1;
   		else ZipCode_33=0;
	if zip_code=11379 then ZipCode_34=1;
   		else ZipCode_34=0;
	if zip_code=11385 then ZipCode_35=1;
   		else ZipCode_35=0;
	if zip_code=11411 then ZipCode_36=1;
   		else ZipCode_36=0;
	if zip_code=11412 then ZipCode_37=1;
   		else ZipCode_37=0;
	if zip_code=11413 then ZipCode_38=1;
   		else ZipCode_38=0;
	if zip_code=11414 then ZipCode_39=1;
   		else ZipCode_39=0;
	if zip_code=11415 then ZipCode_40=1;
   		else ZipCode_40=0;
	if zip_code=11416 then ZipCode_41=1;
   		else ZipCode_41=0;
	if zip_code=11417 then ZipCode_42=1;
   		else ZipCode_42=0;
	if zip_code=11418 then ZipCode_43=1;
   		else ZipCode_43=0;
	if zip_code=11419 then ZipCode_44=1;
   		else ZipCode_44=0;
	if zip_code=11420 then ZipCode_45=1;
   		else ZipCode_45=0;
	if zip_code=11421 then ZipCode_46=1;
   		else ZipCode_46=0;
	if zip_code=11422 then ZipCode_47=1;
   		else ZipCode_47=0;
	if zip_code=11423 then ZipCode_48=1;
   		else ZipCode_48=0;
	if zip_code=11426 then ZipCode_49=1;
   		else ZipCode_49=0;
	if zip_code=11427 then ZipCode_50=1;
   		else ZipCode_50=0;
	if zip_code=11428 then ZipCode_51=1;
   		else ZipCode_51=0;
	if zip_code=11429 then ZipCode_52=1;
   		else ZipCode_52=0;
	if zip_code=11432 then ZipCode_53=1;
   		else ZipCode_53=0;
	if zip_code=11433 then ZipCode_54=1;
   		else ZipCode_54=0;
	if zip_code=11434 then ZipCode_55=1;
   		else ZipCode_55=0;
	if zip_code=11435 then ZipCode_56=1;
   		else ZipCode_56=0;
	if zip_code=11436 then ZipCode_57=1;
   		else ZipCode_57=0;
	if zip_code=11691 then ZipCode_58=1;
   		else ZipCode_58=0;
	if zip_code=11692 then ZipCode_59=1;
   		else ZipCode_59=0;
	if zip_code=11693 then ZipCode_60=1;
   		else ZipCode_60=0;
	if zip_code=11694 then ZipCode_61=1;
   		else ZipCode_61=0;
run;

/* Step 5: Sort the data as per zip-code */
proc sort data=nyc_all_bor_4;
	by zip_code;
run;

/* Step 6:Run regression on the sorted dataset */
proc reg data=nyc_all_bor_4 PLOTS(MAXPOINTS=11000 );

	model sale_price= total_units gross_squr land_squr ZipCode_1 --ZipCode_61 /VIF selection=stepwise slentry=0.05;;

run;

/* Step 7: Perform regression analysis on the variables which have a variance of less than 5% */

proc reg data=nyc_all_bor_4 PLOTS(MAXPOINTS=11000 );

	model sale_price= TOTAL_UNITS gross_squr land_squr ZipCode_3 ZipCode_5 ZipCode_6 ZipCode_10 ZipCode_13 ZipCode_29 ZipCode_30
					  ZipCode_58;
	
run;

/* R-square : 48.92%*/



/*-----------------------------------------------------------------------------------------*/

/* Borough 5*/

data nyc_all_s1;
	set nyc;
	if sale_price>999 and total_units>0 and gross_square_feet>0 and land_square_feet>0;
	gross_squr= input(gross_square_feet,best.);
  	land_squr=input(land_square_feet,best.);
	run;

/* Step 2 : Keep the required fields of the entire dataset */

	data nyc_all_s2;
	keep borough zip_code total_units land_squr gross_squr sale_price;
	set nyc_all_s1;
	run;

/* Step 3: Filter data for borough 1 */ 

	data nyc_all_s2_b5;
	set nyc_all_s2;
	if borough=5;
	run;

/* Step 4: Segregate data for borough 3 and delete all rows with 0 as zipcode and create n columns for n distinct zipcodes in a 
	       borough */
data nyc_all_bor_5;
	set nyc_all_s2_b5;

if zip_code=0 then delete;

if zip_code=10301  then ZipCode_1=1;
   		else ZipCode_1=0;
	if zip_code=10302  then ZipCode_2=1;
   		else ZipCode_2=0;
	if zip_code=10303  then ZipCode_3=1;
   		else ZipCode_3=0;
	if zip_code=10304  then ZipCode_4=1;
   		else ZipCode_4=0;
	if zip_code=10305  then ZipCode_5=1;
   		else ZipCode_5=0;
	if zip_code=10306  then ZipCode_6=1;
   		else ZipCode_6=0;
	if zip_code=10307  then ZipCode_7=1;
   		else ZipCode_7=0;
	if zip_code=10308  then ZipCode_8=1;
   		else ZipCode_8=0;
	if zip_code=10309  then ZipCode_9=1;
   		else ZipCode_9=0;
	if zip_code=10310  then ZipCode_10=1;
   		else ZipCode_10=0;
	if zip_code=10312  then ZipCode_11=1;
   		else ZipCode_11=0;
	if zip_code=10314  then ZipCode_12=1;
   		else ZipCode_12=0;
run;

/* Step 5: Sort the data as per zip-code */
proc sort data=nyc_all_bor_5;
	by zip_code;
run;

/* Step 6:Run regression on the sorted dataset */
proc reg data=nyc_all_bor_5;

	model sale_price= total_units gross_squr land_squr ZipCode_1 --ZipCode_12 /VIF selection=stepwise slentry=0.05;;

run;

/* Step 7: Perform regression analysis on the variables which have a variance of less than 5% */

proc reg data=nyc_all_bor_5 PLOTS(MAXPOINTS=11000 );

	model sale_price= TOTAL_UNITS gross_squr land_squr ZipCode_2 ZipCode_3 ZipCode_7 ZipCode_10 ZipCode_12;
	
run;

/* R-square : 49% */




/*-----------------------------------------------------------------------------------------*/


/*Cluster*/



data Nyc1; /* Data cleaning for Borough 1 */;
	keep borough zip_code total_units land_square_feet gross_square_feet sale_price land_feet gross_feet;
    set Nyc;
   
   if borough=1 and 
		sale_price>999 and 
		total_units>0 and 
		gross_square_feet>0 and zip_code>0 and land_square_feet>0;

	gross_feet= input(gross_square_feet,best.);
  	land_feet=input(land_square_feet,best.);
	  
run;

proc sort data=nyc1;
	by zip_code;
run;

/*Code for summation of values of Sale Price, Gross Sqaure Feet and Land Sqaure Feet 
according to each Zip Code*/

proc summary data=nyc1 nway;
  var sale_price land_feet gross_feet;
  class zip_code;
  output out=Nyc_Clust_1(drop=borough total_units )
             sum=  sum_sale_price sum_gross_squr sum_land_squr;
		
run;
/*To calculate the average sale price of land as per Zip Code*/
data Nyc_clust_1_1;
	keep zip_code _freq_ sum_sale_price avg_sale_price;
	set Nyc_clust_1;
	avg_sale_price=sum_sale_price/_Freq_ ;
run;

/*plotting the point of average sale price with Zip code*/
proc sgplot data=Nyc_clust_1_1;
	scatter y=zip_code x=avg_sale_price;
run;

/*Clustering the Data into 3 groups for High Medium Low Sale Price according to Zip Code*/
proc fastclus data=Nyc_clust_1_1  
      maxclusters=3 out=nyc_clust_plot_1;
var zip_code avg_sale_price ;
run;

proc sort data=nyc_clust_plot_1;
	by cluster avg_sale_price;
run;


/*End*/