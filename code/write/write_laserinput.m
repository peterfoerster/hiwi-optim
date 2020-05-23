function [] = write_laserinput (Q_total, Ipart, filename, rho, tau)
    q = -Q_total/Ipart;

    generator = [rho' zeros(Ipart,4) tau' q*ones(Ipart,1) ones(Ipart,1) -1*ones(Ipart,1)];

    % add reference particle
    generator = [zeros(1,7) q 1 -1; generator];
    dlmwrite(filename, generator, 'delimiter', '  ', 'precision', '%E');
end
