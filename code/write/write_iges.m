function [] = write_iges (filename, geometry)
   % write to .igs file
   iptc = [1 2 3 4 5 6 7 8 9 9 12 12 12 12 14 16 16 17 17 17 18 18 18 18 21 22 22 23 23 23 24 25 25 25];
   ibnd = [3 3 3 3 3 5 5 5 4 5  3  4  5  6  6  5  6  4  5  6  3  4  5  6  4  5  6  3  4  5  4  3  4  6];

   for ii=1:length(iptc)
      nurbs = geometry(iptc(ii)).nurbs;
      pnt   = [0 0 0];
      ext   = [1 0 0];
      nurbs = nrbrevolve(nurbs, pnt, ext, 2*pi);
      nurbs = nrbextract(nurbs);
      hold on;
      nrbkntplot(nurbs(ibnd(ii)));
      hold off;
      nrb2iges(nurbs(ibnd(ii)), [filename '_' num2str(iptc(ii)) num2str(ibnd(ii)) '.igs']);
   end

   % vacuumchamber
   p11 = nrbeval(geometry(19).nurbs, [0 0]);
   p22 = nrbeval(geometry(5).nurbs, [1 1]);
   nurbs = nrb4surf(p11, [p22(1) p11(1)], [p11(1) p22(2)], p22);
   pnt   = [0 0 0];
   ext   = [1 0 0];
   nurbs = nrbrevolve(nurbs, pnt, ext, 2*pi);
   nurbs = nrbextract(nurbs);
   hold on;
   nrbkntplot(nurbs(3));
   nrbkntplot(nurbs(4));
   nrbkntplot(nurbs(6));
   hold off;
   nrb2iges(nurbs(3), [filename '_vacuumchamber_1' '.igs']);
   nrb2iges(nurbs(4), [filename '_vacuumchamber_2' '.igs']);
   nrb2iges(nurbs(6), [filename '_vacuumchamber_3' '.igs']);
end
