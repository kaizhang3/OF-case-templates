clear all; close all; clc;
addpath('/home/kz239/MatlabCodes/');


% Define global constants
% freqInLift = [0.17 0.34 0.51];      % frequency list determined from lift coefficients

dT = 0.2;       % write down interval

t_start = 200.2;    % start time of snapshots collection
t_end = 300;        % end time of snapshots collection

dx = 0.04;      % resolution of the interpolated flow -- x direction
dy = 0.04;      % resolution of the interpolated flow -- y direction
x =  1.5:dx:20;
y =  -5:dy:5;
[xx, yy] = meshgrid(x, y);



%% Get Flow field data
idx = 0;
vortAll = [];
for t = t_start : dT : t_end
    idx = idx + 1;
    data = readData(['postProcessing/sampleDict/' num2str(t) '/vorticity_midPlane.raw'], 2, 6);
    vort2D = griddata(data(:,1), data(:,2), data(:,6), xx, yy);
    vortAll(:,idx) = reshape(vort2D, [length(x)*length(y), 1]);
    fprintf(['DMD: Processing time = ' num2str(t) '... \n' ]);    
end
fprintf('Flow field data extracted ...\n');

%% Do DMD
H1 = vortAll(:,1:end-1);
H2 = vortAll(:,2:end);
clear vortAll;
[U,S,V] = svd(H1, 'econ');
Atilde = U'*H2*V*inv(S);
[W,eigs] = eig(Atilde);
clear H1; 
clear H2;
phi = U*W;
ee = diag(eigs);
gr = real(log(ee)/dT); fr = imag(log(ee)/dT)/(2*pi);
save('postProcessing/forceCoeffs/Modes', 'gr', 'fr', 'phi', 'xx', 'yy', '-v7.3');
fprintf('DMD done ...\n');


% %% Plot DMD modes
% Range = [-realmax -0.01:0.0003:0.01 realmax];
% for i = 1:length(freqInLift)
%     [v, idm] = min(abs(fr - freqInLift(i))); 
%     figure('visible','off');
%     contourf(xx, yy, reshape(imag(phi(:,idm)),size(xx)), Range, 'LineColor', 'None'); colorbar;
%     colormap(flipud(customcmap));hold on;
%     caxis([-0.01 0.01])
%     xlabel('$x$', 'Interpreter', 'Latex');
%     ylabel('$y$', 'Interpreter', 'Latex');
%     daspect([1 1 1]);
%     grid on;
%     print(gcf,'-dpng',['Mode' num2str(freqInLift(i)/0.1675) '.png']);   % save the pic as .png   
%     close;
% end







