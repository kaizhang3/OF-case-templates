clear all; close all; clc;
addpath('/home/kz239/MatlabCodes/');


% Define global constants
% freqInLift = [0.17 0.34 0.51];      % frequency list determined from lift coefficients

dT = 0.2;       % write down interval

t_start = 200.2;    % start time of snapshots collection
t_end = 300;        % end time of snapshots collection

dx = 0.03;      % resolution of the interpolated flow -- x direction
dy = 0.03;      % resolution of the interpolated flow -- y direction
x =  -3:dx:30;
y =  -5:dy:5;
[X, Y] = meshgrid(x, y);



%% Get Flow field data
idx = 0;
vortAll = [];
for t = t_start : dT : t_end
    idx = idx + 1;
    data = readData(['postProcessing/sampleDict/' num2str(t) '/vorticity_midPlane.raw'], 2, 6);
    vort2D = griddata(data(:,1), data(:,2), data(:,6), X, Y);
    vort(:,idx) = reshape(vort2D, [length(x)*length(y), 1]);
    fprintf(['Collecting snapshots: Processing time = ' num2str(t) '... \n' ]);    
end
save('postProcessing/forceCoeffs/vort', 'vort', 'X', 'Y')
fprintf('Flow field data extracted ...\n');




