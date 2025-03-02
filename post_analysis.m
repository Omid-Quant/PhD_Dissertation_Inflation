clear all
close all
clc

load results

load variables
v_gpr=find(contains(endo,var1));
v_oil=find(contains(endo,var2)); 
v_ip=find(contains(endo,var3));
v_ner=find(contains(endo,var4)); 
v_policy=find(contains(endo,var5)); 
v_inf=find(contains(endo,var6)); 



%FIGURE 1
%descriptive statistics
% gpr_growth	gsc	oil	interest	inflation	energy	food	core
data_descriptive = readmatrix('data.xlsx','Sheet','data','Range','B2:G250');
N = 5; 
C = linspecer(N);
xx0=(datetime(2003,1,1) + calmonths(0:length(data_descriptive)-1))';
figure
subplot(4,2,1)
plot(xx0,data_descriptive(:,1),'color',C(1,:),'linewidth',3);
title('Global Geopolitical Risk')
subplot(4,2,2)
plot(xx0,data_descriptive(:,2),'color',C(1,:),'linewidth',3);
title('Global Oil Prices')
subplot(4,2,3)
plot(xx0,data_descriptive(:,3),'color',C(1,:),'linewidth',3);
title('Industrial Production')
subplot(4,2,4)
plot(xx0,data_descriptive(:,4),'color',C(1,:),'linewidth',3);
title('Nominal Exchange Rate')
subplot(4,2,5)
plot(xx0,data_descriptive(:,5),'color',C(1,:),'linewidth',3);
title('Policy Rate')
subplot(4,2,6)
plot(xx0,data_descriptive(:,6),'color',C(1,:),'linewidth',3);
title('Inflation Rate')

sgtitle('') 



% lags and dic
dic=[1 4815.06
2 4749.14
3 4707.28
4 4667.11
5 4644.81
6 4632.05
7 4623.78
8 4604.26
9 4592.96
10 4580.24
11 4561.58
12 4557.74
13 4612.56
14 4608.07
15 4611.72
16 4598.93
17 4592.13
18 4609.91
19 4608.28
20 4605.66
21 4614.55
22 4632.91
23 4665.92
24 4719.86];


%FIGURE 2
% DIC versus lags
N=5;
C = linspecer(N);
figure
plot(dic(:,1),dic(:,2),'color',C(2,:),'linewidth',2)
xlim([1 max(dic(:,1))])
xlabel('Lags')
title('Lag Selection (DIC): Based on Inflation Rate')







%FIGURE 3

%FIGURES SHOWING THE EFFECTS OF OTHER VARIABLES ON INFLATION
%FIGURES SHOWING THE EFFECTS OF OTHER VARIABLES ON INFLATION
%FIGURES SHOWING THE EFFECTS OF OTHER VARIABLES ON INFLATION
%FIGURES SHOWING THE EFFECTS OF OTHER VARIABLES ON INFLATION
%FIGURES SHOWING THE EFFECTS OF OTHER VARIABLES ON INFLATION
%variable of interest (response)
response=v_inf;


%IRFs
elasticity=cumsum(struct_irf_record{response,v_gpr},2);
eleasticity_median=prctile(elasticity,50);
eleasticity_low=prctile(elasticity,84);
eleasticity_up=prctile(elasticity,16);
figure
subplot(3,2,1)
xx=length(eleasticity_low);
N = 5; 
C = linspecer(N);
hh=[eleasticity_low 
    eleasticity_median 
    eleasticity_up];
plot(1:xx,hh([1 3],:),'--','color',C(2,:),'linewidth',2);
hold on
plot(1:xx,hh([2],:),'color',C(1,:),'linewidth',3);
hold on
plot([1 xx],[0 0],'r')
xlim([0 60])
xlabel('Months')
title(var1_name)
table_irf_1=[eleasticity_median(4) min(eleasticity_low(4),eleasticity_up(4)) max(eleasticity_low(4),eleasticity_up(4))
    eleasticity_median(13) min(eleasticity_low(13),eleasticity_up(13)) max(eleasticity_low(13),eleasticity_up(13))
    eleasticity_median(61) min(eleasticity_low(61),eleasticity_up(61)) max(eleasticity_low(61),eleasticity_up(61))];


%IRFs
elasticity=cumsum(struct_irf_record{response,v_oil},2);
eleasticity_median=prctile(elasticity,50);
eleasticity_low=prctile(elasticity,84);
eleasticity_up=prctile(elasticity,16);
subplot(3,2,2)
xx=length(eleasticity_low);
N = 5; 
C = linspecer(N);
hh=[eleasticity_low 
    eleasticity_median 
    eleasticity_up];
plot(1:xx,hh([1 3],:),'--','color',C(2,:),'linewidth',2);
hold on
plot(1:xx,hh([2],:),'color',C(1,:),'linewidth',3);
hold on
plot([1 xx],[0 0],'r')
xlim([0 60])
xlabel('Months')
title(var2_name)
table_irf_2=[eleasticity_median(4) min(eleasticity_low(4),eleasticity_up(4)) max(eleasticity_low(4),eleasticity_up(4))
    eleasticity_median(13) min(eleasticity_low(13),eleasticity_up(13)) max(eleasticity_low(13),eleasticity_up(13))
    eleasticity_median(61) min(eleasticity_low(61),eleasticity_up(61)) max(eleasticity_low(61),eleasticity_up(61))];




%IRFs
elasticity=cumsum(struct_irf_record{response,v_ip},2);
eleasticity_median=prctile(elasticity,50);
eleasticity_low=prctile(elasticity,84);
eleasticity_up=prctile(elasticity,16);
subplot(3,2,3)
xx=length(eleasticity_low);
N = 5; 
C = linspecer(N);
hh=[eleasticity_low 
    eleasticity_median 
    eleasticity_up];
plot(1:xx,hh([1 3],:),'--','color',C(2,:),'linewidth',2);
hold on
plot(1:xx,hh([2],:),'color',C(1,:),'linewidth',3);
hold on
plot([1 xx],[0 0],'r')
xlim([0 60])
xlabel('Months')
title(var3_name)
table_irf_3=[eleasticity_median(4) min(eleasticity_low(4),eleasticity_up(4)) max(eleasticity_low(4),eleasticity_up(4))
    eleasticity_median(13) min(eleasticity_low(13),eleasticity_up(13)) max(eleasticity_low(13),eleasticity_up(13))
    eleasticity_median(61) min(eleasticity_low(61),eleasticity_up(61)) max(eleasticity_low(61),eleasticity_up(61))];



%IRFs
elasticity=cumsum(struct_irf_record{response,v_ner},2);
eleasticity_median=prctile(elasticity,50);
eleasticity_low=prctile(elasticity,84);
eleasticity_up=prctile(elasticity,16);
subplot(3,2,4)
xx=length(eleasticity_low);
N = 5; 
C = linspecer(N);
hh=[eleasticity_low 
    eleasticity_median 
    eleasticity_up];
plot(1:xx,hh([1 3],:),'--','color',C(2,:),'linewidth',2);
hold on
plot(1:xx,hh([2],:),'color',C(1,:),'linewidth',3);
hold on
plot([1 xx],[0 0],'r')
xlim([0 60])
xlabel('Months')
title(var4_name)
table_irf_4=[eleasticity_median(4) min(eleasticity_low(4),eleasticity_up(4)) max(eleasticity_low(4),eleasticity_up(4))
    eleasticity_median(13) min(eleasticity_low(13),eleasticity_up(13)) max(eleasticity_low(13),eleasticity_up(13))
    eleasticity_median(61) min(eleasticity_low(61),eleasticity_up(61)) max(eleasticity_low(61),eleasticity_up(61))];

%IRFs
elasticity=cumsum(struct_irf_record{response,v_policy},2);
eleasticity_median=prctile(elasticity,50);
eleasticity_low=prctile(elasticity,84);
eleasticity_up=prctile(elasticity,16);
subplot(3,2,5)
xx=length(eleasticity_low);
N = 5; 
C = linspecer(N);
hh=[eleasticity_low 
    eleasticity_median 
    eleasticity_up];
plot(1:xx,hh([1 3],:),'--','color',C(2,:),'linewidth',2);
hold on
plot(1:xx,hh([2],:),'color',C(1,:),'linewidth',3);
hold on
plot([1 xx],[0 0],'r')
xlim([0 60])
xlabel('Months')
title(var5_name)
table_irf_5=[eleasticity_median(4) min(eleasticity_low(4),eleasticity_up(4)) max(eleasticity_low(4),eleasticity_up(4))
    eleasticity_median(13) min(eleasticity_low(13),eleasticity_up(13)) max(eleasticity_low(13),eleasticity_up(13))
    eleasticity_median(61) min(eleasticity_low(61),eleasticity_up(61)) max(eleasticity_low(61),eleasticity_up(61))];

sgtitle(['Cumulative Response of ' var6_name]) 


%historical decomposition 
%variable of interest (for its historical decomposition)
voi=v_inf;
%figure
figure;
N = 5; 
C = linspecer(N);
xx=(datetime(fix(decimaldates1(1)),1,1) + calmonths(0:length(decimaldates1)-1))';
for ii=1:6
    if ii==1
        subplot(3,2,1)
        hh=hd_estimates{voi,v_gpr};
    elseif ii==2
        subplot(3,2,2)
        hh=hd_estimates{voi,v_oil};
    elseif ii==3
        subplot(3,2,3)
        hh=hd_estimates{voi,v_ip};
    elseif ii==4
        subplot(3,2,4)
        hh=hd_estimates{voi,v_ner};
    elseif ii==5
        subplot(3,2,5)
        hh=hd_estimates{voi,v_policy};
      
    end
    plot(xx,hh([1 3],:),'--','color',C(2,:),'linewidth',2);
    hold on
    plot(xx,hh([2],:),'color',C(1,:),'linewidth',3);
    hold on
    xlim([min(xx) max(xx)])
    %ylabel('Relative Price Variability')
    if ii==1
        title([var1_name])
    elseif ii==2
        title([var2_name])
    elseif ii==3
        title([var3_name])
    elseif ii==4
        title([var4_name])
    elseif ii==5
        title([var5_name]) 
       
    end
    
    %ylimits
    y2=max(max([hd_estimates{voi,v_gpr}
    hd_estimates{voi,v_oil}
    hd_estimates{voi,v_ip}
    hd_estimates{voi,v_ner}
    hd_estimates{voi,v_policy}]));
    
    y1=min(min([hd_estimates{voi,v_gpr}
    hd_estimates{voi,v_oil}
    hd_estimates{voi,v_ip}
    hd_estimates{voi,v_ner}
    hd_estimates{voi,v_policy}]));

    ylim([y1 y2])


end

sgtitle(['Historical Decomposition of ' var6_name]) 

%fig = gcf;
%fig.InnerPosition = [645,214,641,774];
%fig.OuterPosition = [637,206,657,867];
%saveas(fig,'figure3','epsc')




%order of variables in figures
oif=[v_gpr,v_oil,v_ip,v_ner,v_policy,v_inf];

%FEVD
for r=1:n %number of response variables
    bars=[];
    for s=1:n %number of shock variables

        %responses of variable r to shock s
        re=fevd_estimates{r,oif(s)};

        %fevd of inflation after:
        %3 months, 1year, 2years, 5years
        bars=[bars
            re(2,4) re(2,13) re(2,61) ];

    end
    bars_save(:,:,r)=100*bars./repmat(sum(bars),n,1);
end

%table for FEVD of inflation
table_FEVD=bars_save(:,:,v_inf);

%CIRF table
table_irf=[table_irf_1
    table_irf_2
    table_irf_3
    table_irf_4
    table_irf_5];
clear table_irf_1     table_irf_2     table_irf_3     table_irf_4   table_irf_5


format short g
table_irf=round(table_irf,3);
%write CIRF table
writematrix(table_irf,'tables.xlsx','Sheet',...
    'CIRF_of_Inflation','Range','J4:L18');
table_FEVD=round(table_FEVD,3);
%write CIRF table
writematrix(table_FEVD,'tables.xlsx','Sheet',...
    'FEVD_of_Inflation','Range','K4:M9');


