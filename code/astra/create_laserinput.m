function [rho, tau] = create_laserinput(Ipart, sig_clock, Q_total, filename)
    % step size from file (in [mu m])
    dx = 1.6631;
    data = dlmread('laser.txt', ',', 1, 1);

    f = data(:,1);
    f = f/max(f);

    nd = size(data,1);
    x  = linspace(-nd*dx, nd*dx, 2000);

    % use 2*100 samples at a time
    n   = 100;
    rho = NaN(1,2*Ipart);

    tic;
    np    = 0;
    while (np < 2*Ipart)
        R        = rand(2*n,2);
        R(:,1)   = max(x)*R(:,1);
        R(1:n,1) = -R(1:n,1);

        for i=1:2*n
            [~, ix] = min(abs(x-R(i,1)));
            if (R(i,2) <= f(ix))
                np += 1;
                rho(np) = R(i,1);
                if (np == 2*Ipart)
                    break;
                end
            end
        end
    end
    fprintf('\nsample creation: %d s for Ipart = %d\n', toc, Ipart);

    rho = [rho(1:Ipart/2), rho(Ipart+1:Ipart+Ipart/2); rho(Ipart/2+1:Ipart), rho(Ipart+Ipart/2+1:end)];

    % temporal distribution
    tau = normrnd(0, sig_clock, 1, Ipart);

    write_laserinput(Q_total, Ipart, filename, rho*1e-6, tau);
end
