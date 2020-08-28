% INPUT:
%       - Ipart
%       - sig_clock
%       - Q_total
%       - filename

function [] = create_laserinput (Ipart, sig_clock, Q_total, filename)
    % step size from file (in [um])
    dx = 1.6631;
    dy = 3.2239;
    data = dlmread('laser.txt', ',', 1, 1);

    f = data(:,1:2);
    f = f./max(f);

    nd = size(data,1);
    x  = linspace(-nd*dx, nd*dx, nd);
    y  = linspace(-nd*dy, nd*dy, nd);

    % use 4n samples at a time
    n   = 100;
    rho = NaN(2,Ipart);

    tic;
    np = 0;
    % NEEDS TO BE CHECKED
    while (np < Ipart)
        % [x,fx,y,fy]
        R        = rand(4*n,4);
        R(:,1)   = max(x)*R(:,1);
        % 2^nd and 3^rd quadrant
        R(n+1:3*n,1) = -R(n+1:3*n,1);
        R(:,3)   = max(y)*R(:,3);
        % 3^rd and 4^th quadrant
        R(2*n+1:4*n,3) = -R(2*n+1:4*n,3);
        for i=1:4*n
            [~, ix] = min(abs(x-R(i,1)));
            [~, iy] = min(abs(y-R(i,3)));
            % (only secondary maxima in x-direction)
            if (R(i,2) <= f(ix) && R(i,4) <= f(iy) && abs(y(iy)) < 2.5e3)
                np += 1;
                rho(:,np) = [R(i,1); R(i,3)];
                if (np == Ipart)
                    break;
                end
            end
        end
    end
    fprintf('\ncreate_laserinput: %d s with Ipart=%d\n', toc, Ipart);

    % temporal distribution
    tau = normrnd(0, sig_clock, 1, Ipart);

    write_laserinput(Q_total, Ipart, filename, rho*1e-6, tau);
end
