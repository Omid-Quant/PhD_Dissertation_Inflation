

%to use in figures after estimation
save variables var1 var2 var3 var4 var5 var6 var1_name...
    var2_name var3_name var4_name var5_name var6_name
% endogenous variables; must be a single string, with variable names separated by a space
varendo=[var1 ' ' var2 ' ' var3 ' ' var4 ' '  var5 ' ' var6];
% exogenous variables, if any; must be a single string, with variable names separated by a space
varexo='';
%some cleaning
clear var1 var2 var3 var4 var5 var6 var7 var1_name...
    var2_name var3_name var4_name var5_name var6_name


%set the path of estimation
path_hakan=pwd;
%save estimation settings
save(['files/' 'varendo'],'varendo','startdate','enddate','varexo','path_hakan')
run files/bear_toolbox_main_code;
save results
post_analysis

