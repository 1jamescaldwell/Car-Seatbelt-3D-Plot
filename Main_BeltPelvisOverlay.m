%% Autoliv Belt Pull - Pelvis-Belt Overlay Plots
% Written by Rachel Richardson, Jeesoo Shin, James Caldwell 
% UVA CAB
% Last modified: 10/26/23

%The purpose of this script is to create a 3D view of the Pelvis in the
%test space with a visual overlay of where the belt laid in relation to the
%pelvis. The Pelvis is imported as an STL in the Romer (CMM) reference
%frame using this process: \\cab-fs07.mae.virginia.edu\NewData\Autoliv\2022-Pelvis\1Data-RAW\D2056\ROMER\How to put Pelvis into Romer CS.mp4
%The belt overlay comes from Vicon motion tracking with additional Romer
%points plotted for verification

% To run this script:
    %Have the correct stl in the directory
    %Have Autoliv_BP struct loaded
        %\\cab-fs07.mae.virginia.edu\NewData\Autoliv\2022-Pelvis\1Data-ANALYZED\Autoliv_BP.mat
    %Change DSDRun to one of the two runs, D2054 or D2056

clearvars -except Autoliv_BP
close all

DSDRun = 'D2054'; %or 'D2056'

if strcmp(DSDRun, 'D2054')
    F1 = stlread('D2054_transformed_initial2.stl');
else
    F1 = stlread('D2056_transformed_initial.stl');
end

%% Vicon Belt Markers
%Assigns the belt marker data from Autoliv_BP to variables 

t0 = 1;
t1 = 15;

if strcmp(DSDRun, 'D2054') %2054 had 11, but 2056 only had 9
    B11_x = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt11wrtglobal.x(t0:t1));
    B10_x = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt10wrtglobal.x(t0:t1));
    B11_y = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt11wrtglobal.y(t0:t1));
    B10_y = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt10wrtglobal.y(t0:t1));
    B11_z = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt11wrtglobal.z(t0:t1));
    B10_z = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt10wrtglobal.z(t0:t1));
end

B9_x = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt9wrtglobal.x(t0:t1));
B8_x = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt8wrtglobal.x(t0:t1));
B7_x = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt7wrtglobal.x(t0:t1));
B6_x = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt6wrtglobal.x(t0:t1));
B5_x = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt5wrtglobal.x(t0:t1));
B4_x = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt4wrtglobal.x(t0:t1));
B3_x = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt3wrtglobal.x(t0:t1));
B2_x = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt2wrtglobal.x(t0:t1));
B1_x = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt1wrtglobal.x(t0:t1));

B9_y = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt9wrtglobal.y(t0:t1));
B8_y = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt8wrtglobal.y(t0:t1));
B7_y = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt7wrtglobal.y(t0:t1));
B6_y = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt6wrtglobal.y(t0:t1));
B5_y = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt5wrtglobal.y(t0:t1));
B4_y = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt4wrtglobal.y(t0:t1));
B3_y = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt3wrtglobal.y(t0:t1));
B2_y = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt2wrtglobal.y(t0:t1));
B1_y = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt1wrtglobal.y(t0:t1));

B9_z = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt9wrtglobal.z(t0:t1));
B8_z = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt8wrtglobal.z(t0:t1));
B7_z = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt7wrtglobal.z(t0:t1));
B6_z = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt6wrtglobal.z(t0:t1));
B5_z = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt5wrtglobal.z(t0:t1));
B4_z = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt4wrtglobal.z(t0:t1));
B3_z = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt3wrtglobal.z(t0:t1));
B2_z = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt2wrtglobal.z(t0:t1));
B1_z = mean(Autoliv_BP.(DSDRun).VICON_Processed.belt1wrtglobal.z(t0:t1));

%% Generate STL Plot

stlPlot(F1.Points,F1.ConnectivityList,DSDRun)
p = patch('faces',F1.ConnectivityList,'vertices',F1.Points,'FaceColor',[0.8 0.8 0.8],'EdgeColor',[0.8 0.8 0.8]);
ax1a = niceaxes; hold on 

%Limits for view of Pelvis/Belt
if strcmp(DSDRun, 'D2054')
    xlim([-1500 -900])
    ylim([-400 200])
    zlim([-800 -200])
else %For D2056
    xlim([-1400 -600])
    ylim([-500 200])
    zlim([-1100 -400])
end

%Limits for view from Pelvis to origin base plate at front of DSD rig
%Uncomment to verify if Romer and Vicon match for base plate markers
% xlim([-1500 500])
% ylim([-400 200])
% zlim([-800 200])

hold on
xlabel('X (mm)','fontname','calibri')
ylabel('Y')
zlabel('Z (mm)','fontname','calibri')

%%
%Created variable section to change markers more easily if different orders happen

LeftorRight = 0;
%The default orientation is looking at the Right view of the pelvis.
%Right is 0, Left is 1

if LeftorRight == 1
    M1_x = B1_x;
    M1_y = B7_y;
    M1_z = B7_z;

    M2_x = B8_x;
    M2_y = B8_y;
    M2_z = B8_z;
    
    M3_x = B9_x;
    M3_y = B9_y;
    M3_z = B9_z;
    
    M4_x = B10_x;
    M4_y = B10_y;
    M4_z = B10_z;
    
    M5_x = B11_x;
    M5_y = B11_y;
    M5_z = B11_z;
else
    M1_x = B1_x;
    M1_y = B1_y;
    M1_z = B1_z;
    
    M2_x = B2_x;
    M2_y = B2_y;
    M2_z = B2_z;
    
    M3_x = B3_x;
    M3_y = B3_y;
    M3_z = B3_z;
    
    M4_x = B4_x;
    M4_y = B4_y;
    M4_z = B4_z;
    
    M5_x = B5_x;
    M5_y = B5_y;
    M5_z = B5_z;
end

% Calculate the lines connecting the vicon markers and 
alpha1 = 90 - atand(abs((M1_z(1)-M2_z(1)))/abs((M1_x(1)-M2_x(1))));
alpha2 = 90 - atand(abs((M2_z(1)-M3_z(1)))/abs((M2_x(1)-M3_x(1))));
alpha3 = 90 - atand(abs((M3_z(1)-M4_z(1)))/abs((M3_x(1)-M4_x(1))));
alpha4 = 90 - atand(abs((M4_z(1)-M5_z(1)))/abs((M4_x(1)-M5_x(1))));
plot3([M1_x(1)+cosd(alpha1)*22.225 M2_x(1)+cosd(alpha1)*22.225],[M1_y(1) M2_y(1)],[M1_z(1)+sind(alpha1)*22.225 M2_z(1)+sind(alpha1)*22.225],'k--','Linewidth',1); hold on 
plot3([M1_x(1)-cosd(alpha1)*22.225 M2_x(1)-cosd(alpha1)*22.225],[M1_y(1) M2_y(1)],[M1_z(1)-sind(alpha1)*22.225 M2_z(1)-sind(alpha1)*22.225],'k--','Linewidth',1); hold on 
plot3([M2_x(1)+cosd(alpha2)*22.225 M3_x(1)+cosd(alpha2)*22.225],[M2_y(1) M3_y(1)],[M2_z(1)+sind(alpha2)*22.225 M3_z(1)+sind(alpha2)*22.225],'k--','Linewidth',1); hold on 
plot3([M2_x(1)-cosd(alpha2)*22.225 M3_x(1)-cosd(alpha2)*22.225],[M2_y(1) M3_y(1)],[M2_z(1)-sind(alpha2)*22.225 M3_z(1)-sind(alpha2)*22.225],'k--','Linewidth',1); hold on 
plot3([M3_x(1)+cosd(alpha3)*22.225 M4_x(1)+cosd(alpha3)*22.225],[M3_y(1) M4_y(1)],[M3_z(1)+sind(alpha3)*22.225 M4_z(1)+sind(alpha3)*22.225],'k--','Linewidth',1); hold on 
plot3([M3_x(1)-cosd(alpha3)*22.225 M4_x(1)-cosd(alpha3)*22.225],[M3_y(1) M4_y(1)],[M3_z(1)-sind(alpha3)*22.225 M4_z(1)-sind(alpha3)*22.225],'k--','Linewidth',1); hold on 
plot3([M4_x(1)+cosd(alpha4)*22.225 M5_x(1)+cosd(alpha4)*22.225],[M4_y(1) M5_y(1)],[M4_z(1)+sind(alpha4)*22.225 M5_z(1)+sind(alpha4)*22.225],'k--','Linewidth',1); hold on 
plot3([M4_x(1)-cosd(alpha4)*22.225 M5_x(1)-cosd(alpha4)*22.225],[M4_y(1) M5_y(1)],[M4_z(1)-sind(alpha4)*22.225 M5_z(1)-sind(alpha4)*22.225],'k--','Linewidth',1); hold on 
plot3([ M1_x(1) M2_x(1) M3_x(1) M4_x(1) M5_x(1)],[ M1_y(1) M2_y(1) M3_y(1) M4_y(1) M5_y(1)],[M1_z(1) M2_z(1) M3_z(1) M4_z(1) M5_z(1)],'k','Linewidth',3); hold on 
plot3([50.0 302.1], [0 0], [-61.8 -129.6], 'LineWidth',5,'Color',[0.6 0.6 0.6])
% plot3([Seatpan4_x(6) Seatpan6_x(6)],[0 0],[Seatpan4_z(6) Seatpan6_z(6)], 'LineWidth',3,'Color',[0.2 0.2 0.2])

title(DSDRun,'Color','#E57200')
grid off
set(gca,'Xdir','reverse')
% set(gca,'Ydir','reverse')
set(gca,'Zdir','reverse')
view(180,0)

%% Adding Raw Romer/Vicon Points to verify transformations
%Adding the raw romer points to doublecheck that the transformation is right
%For 2054, there was an issue with the pelvis not aligning with the belt
%This section was written to doublecheck that Vicon and Romer data agreed (which it did)
% -> Issue was with the STL orientation 

troubleshooting = 1;

if troubleshooting == 1

%Belt + Base Plate Romer
BIndex = find(contains(Autoliv_BP.(DSDRun).Romer.Name,'Belt') | contains(Autoliv_BP.(DSDRun).Romer.Name,'Base Plate')); %Finds the index of all the romer points with "Belt" in the name
for i = 1:length(BIndex)
    RomX = Autoliv_BP.(DSDRun).Romer.PositionX(BIndex(i));
    RomY = Autoliv_BP.(DSDRun).Romer.PositionY(BIndex(i));
    RomZ = Autoliv_BP.(DSDRun).Romer.PositionZ(BIndex(i));
    plot3(RomX,RomY,RomZ,'+k','MarkerSize',10)

end

ABPFieldnames = fieldnames(Autoliv_BP.(DSDRun).VICON_Processed);
baseIdx = contains(ABPFieldnames,'base');

Base1x = Autoliv_BP.(DSDRun).VICON_Processed.base1wrtglobal.x(1); 
Base1y = Autoliv_BP.(DSDRun).VICON_Processed.base1wrtglobal.y(1);
Base1z = Autoliv_BP.(DSDRun).VICON_Processed.base1wrtglobal.z(1);
plot3(Base1x,Base1y,Base1z,'*b','MarkerSize',10)

Base2x = Autoliv_BP.(DSDRun).VICON_Processed.base2wrtglobal.x(1); 
Base2y = Autoliv_BP.(DSDRun).VICON_Processed.base2wrtglobal.y(1);
Base2z = Autoliv_BP.(DSDRun).VICON_Processed.base2wrtglobal.z(1);
plot3(Base2x,Base2y,Base2z,'*b','MarkerSize',10)

Base3x = Autoliv_BP.(DSDRun).VICON_Processed.base3wrtglobal.x(1); 
Base3y = Autoliv_BP.(DSDRun).VICON_Processed.base3wrtglobal.y(1);
Base3z = Autoliv_BP.(DSDRun).VICON_Processed.base3wrtglobal.z(1);
plot3(Base3x,Base3y,Base3z,'*b','MarkerSize',10)

Base4x = Autoliv_BP.(DSDRun).VICON_Processed.base4wrtglobal.x(1); 
Base4y = Autoliv_BP.(DSDRun).VICON_Processed.base4wrtglobal.y(1);
Base4z = Autoliv_BP.(DSDRun).VICON_Processed.base4wrtglobal.z(1);
plot3(Base4x,Base4y,Base4z,'*b','MarkerSize',10)

end

%% Save the figure as a .png and a .fig

save = 0;
if save == 1
    disp('starting save')
    savelocation = '\\cab-fs07.mae.virginia.edu\NewData\Autoliv\2022-Pelvis\1Data-ANALYZED\Vicon Processing';
    fig_name = strcat(savelocation,'\',DSDRun,'.fig');
    png_name = strrep(fig_name,'fig','png');
    saveas(gcf,fig_name);
    saveas(gcf,png_name);
    disp('save finished')
end 
