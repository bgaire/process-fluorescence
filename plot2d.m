[x,y] = meshgrid(background.obs_lambda,excitation_wavelength);
surf(x,y,zeros(size(x)),S,'FaceColor','interp','EdgeColor','none');
view(2);