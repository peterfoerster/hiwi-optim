% INPUT:
%       - filename:
%       - z:

function [] = plot_astra (filename, z)
    astra = dlmread([filename '.Xemit.001']);
    x  = [astra(:,1), astra(:,4), astra(:,6)*pi];
    ix = find(x(:,1) <= z);
    x  = x(1:ix(end), :);

    write_dat1D([filename '_xrms.dat'], x(:,1), x(:,2));
    write_dat1D([filename '_xeps.dat'], x(:,1), x(:,3));

    astra = dlmread([filename '.Yemit.001']);
    y  = [astra(:,1), astra(:,4), astra(:,6)*pi];
    iy = find(y(:,1) <= z);
    y  = y(1:iy(end), :);

    write_dat1D([filename '_yrms.dat'], y(:,1), y(:,2));
    write_dat1D([filename '_yeps.dat'], y(:,1), y(:,3));

    hold on;
    plot(x(:,1), x(:,2), y(:,1), y(:,2));
    plot(x(:,1), x(:,3), y(:,1), y(:,3));
    hold off;
    legend('x_{rms}', '\epsilon');
    xlabel('z in m');
    hold off;
end
