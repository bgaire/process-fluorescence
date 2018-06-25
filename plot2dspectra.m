function  []= plot2dspectra(range)
if nargin < 1
    range  = input('Enter the range: ');
end
background = processBackgroundData();
wavelengths = background.obs_lambda;
% This gives the bg data and the wavelengths
[fluorescenceData,excitation_wvl] = processFluorescence();
% This one gets all the fluorescence data in form of a struct
fluorescenceData = 10*log(fluorescenceData)/log(10);
fluorescenceData = fluorescenceData - background.bg;
plot_range = background.quiet & (wavelengths > range(1)) & ...
   ( wavelengths < range(2));
% I need excitation lambdas
[x,y] = meshgrid(wavelengths(plot_range),excitation_wvl);
surf(x,y,zeros(size(x)),fluorescenceData(:,plot_range),'FaceColor','interp','EdgeColor','none');
view(2);
colorbar;
end
