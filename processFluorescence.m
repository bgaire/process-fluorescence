function [datas,ex_wavelength] = processFluorescence()
% Input files names/pathnames
% Output the fluorescence datas read from the csv files
[files,pathname] = uigetfile('*.csv','Select the fluorescence datas',...
        'MultiSelect','on');
datas = [];
ex_wavelength = zeros(size(files));
for kk = 1:length(files)
    dt = csvread([pathname files{kk}]);
    fns = strsplit(files{kk},'.');
    fns= fns{1};
    datas(kk,:) = dt(:,2)';
    exWv = strsplit(fns,'_');
    exWv = sscanf(exWv{2},'%f');
    ex_wavelength(kk) = exWv;    
end
end


    