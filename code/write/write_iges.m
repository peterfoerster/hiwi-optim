% INPUT:
%       - filename
%       - geometry

function [] = write_iges (filename, geometry)
    display = 0;

    % anode ring
    % iptc = [5 13 10 9 8 7 4 3];
    % ibnd = [5  3  6 6 6 6 4 4];

    % anode ring insulator
    % iptc = [5 5 5 5];
    % ibnd = [6 4 5 3];

    % electrode_init
    % iptc = [6 7 8 9 10 14 15 16 17 18 18 23 27 28 28 28 29 30 30 31];
    % ibnd = [5 5 5 5  5  5  3  3  6  6  3  6  4  5  4  6  6  6  3  6];

    % electrode_opt
    iptc = [6 7 8 9 10 14 15 16 17 18 18 23 27 28 28 28 29 30 30 31];
    ibnd = [5 5 5 5  5  5  5  5  6  6  3  6  4  5  4  6  6  6  3  6];

    % inner insulator
    % iptc = [31 31 32 33 34 34];
    % ibnd = [ 6  4  4  4  4  5];

    % outer insulator
    % iptc = [23 23 24 24 24 23];
    % ibnd = [ 6  4  4  5  3  3];

    % vacuum chamber
    % iptc = [1 1 5 11 11 11 12 13 15 16 19 20 20 22 24 25 34];
    % ibnd = [6 4 6  3  6  4  4  4  4  4  4  4  5  5  5  5  5];

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
        nrb2iges(nurbs(ibnd(ii)), [filename '_' num2str(iptc(ii)) num2str(ibnd(ii)) '.igs']);
    end

    % additional vacuum chamber piece
    % nurbs = nrbline([447e-3 20e-3], [447e-3 30e-3]);
    % nurbs = nrbrevolve(nurbs, pnt, ext, 2*pi);
    % nrb2iges(nurbs, ['additional.igs']);
end
