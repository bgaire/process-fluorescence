%% For comparision between Neon vs Argon Growth
close all;
bg = processBackgroundData();
[flDataAr,wvl] = processFluorescence();
flDataNe = processFluorescence();
[powerIn,excitationWvl] = powerMeterMeasurement();
for kk = 1:length(flDataAr)
    clear t;
    goodflDataAr = abs(flDataAr(kk).fluorescence - bg);
    goodflDataNe = abs(flDataNe(kk).fluorescence - bg);
    fnn = strsplit(flDataAr(kk).fns, '_');
    t = sprintf('Excitation Wavelength %d nm', sscanf(fnn{2},'%d'));
    figure;
    semilogy(wvl,goodflDataAr);
    hold on;
    semilogy(wvl,goodflDataNe);
    title(t);
    legend('In Argon', 'In Neon');
end

%% During the growth, compare and plot the two growths


%% Plot a growth with Neon/Argon normalized by power data
close all;
bgNe = processBackgroundData();
[flDt,wvl] = processFluorescence();
powerIn = input('Input Dye Laser Power = ');
cleanDt = abs(bgNe - flDt);
normalizedDt = cleanDt/PowerIn;

