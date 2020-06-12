function [] = write_iges (filename, geometry)
    display = 1;
    % electrode
    iptc = [6 7 8 9 10 14 15 16 17 18 19 19 24 28 29 29 29 30 31 31 32];
    ibnd = [5 5 5 5  5  5  3  3  3  6  6  3  6  4  5  4  6  6  6  3  6];

    % outer insulator
    % iptc = [24 24 25 25 25 24];
    % ibnd = [ 4  5  5  3  6  6];

    % inner insulator
    % iptc = [32 35 35 34 33 32];
    % ibnd = [ 4  3  6  6  6  6];

    % anode ring insulator
    % iptc = [5 5 5 5];
    % ibnd = [4 5 3 6];

    % anode ring
    % iptc = [5 3 4 7 8 9 10 13];
    % ibnd = [3 6 6 4 4 4  4  1];

    % vacuumchamber
    % iptc = [1 1 5 11 11 11 12 13 15 16 17 20 21 21 23 25 26 35];
    % ibnd = [4 6 4  5  4  6  6  6  5  6  6  6  6  3  3  3  3  3];

    for ii=1:length(iptc)
        nurbs = geometry(iptc(ii)).nurbs;
        pnt   = [0 0 0];
        ext   = [1 0 0];
        nurbs = nrbrevolve(nurbs, pnt, ext, 2*pi);
        nurbs = nrbextract(nurbs);
        if (display)
            hold on;
            nrbkntplot(nurbs(ibnd(ii)));
            hold off;
        end
        % nrb2iges(nurbs(ibnd(ii)), [filename '_' num2str(iptc(ii)) num2str(ibnd(ii)) '.igs']);
    end
end
