[filenames,pathname] = uigetfile('*.csv','Select the csv files','MultiSelect','on');
specs = [];
for idx = 1: length(filenames)
    dt = csvread([pathname filenames{idx}]);
    specs(idx,:) = dt(:,2)' - bg.bg';
    spk = 10*log(specs)/log(10);
    spk = real(spk);
end
    