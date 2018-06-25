function [bg] = processBackgroundData(filename)
% This function reads the background file and returns the 
%datas from the background and the wavelengths
if nargin < 1
    [file,pathname] = uigetfile('*.csv','Select Background File');
end
dt = csvread([pathname file]);
bg.bg = dt(:,2)';
bg.obs_lambda = dt(:,1)';
bg_sort = sort(bg.bg);
bg.cut =bg_sort(round(numel(bg_sort)*0.75));
bg.quiet = bg.bg < bg.cut;
end

