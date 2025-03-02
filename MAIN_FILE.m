

clear all
close all
clc


% sample start date; 
startdate='2003m1';
% sample end date; 
enddate='2023m9';
% variables in order:
var1='gpr';
var2='oil';
var3='ip';
var4='ner';
var5='policy';
var6='inflation';
%one of the following: headline, energy, food, core
% variable names in the same order:
var1_name='Geopolitical Risk';
var2_name='Global Oil Price';
var3_name='Industrial Production';
var4_name='Nominal Exchange Rate';
var5_name='Policy Rate';
var6_name='Inflation rate';















estimate;