function [] = write_geometryfile_v6 (ptcs_vac, ptcs_el, filename)
   [interfaces, boundaries] = nrbmultipatch (ptcs_vac);
   boundaries = [];

   % electrode
   boundaries(1).patches = [6 7 8 9 10 14 15 16 17 18 19 19 24 28 29 29 29 30 31 31 32];
   boundaries(1).faces   = [3 3 3 3  3  3  1  1  1  4  4  1  4  2  3  2  4  4  4  1  4];

   % anode ring
   boundaries(2).patches = [5 13 10 9 8 7 4 3];
   boundaries(2).faces   = [3  1  4 4 4 4 2 2];

   % vacuumchamber
   boundaries(3).patches = [1 1 5 11 11 11 12 13 15 16 17 20 21 21 23 25 26 35];
   boundaries(3).faces   = [4 2 4  1  4  2  2  2  2  2  2  2  2  3  3  3  3  3];

   % Neumann
   boundaries(4).patches = [1 2 3 4 6 32 33 34 35];
   boundaries(4).faces   = [1 1 1 1 1  1  1  1  1];

   for ibnd=1:length(boundaries)
      boundaries(ibnd).nsides = length(boundaries(ibnd).patches);
   end

   nrbexport (ptcs_vac, interfaces, boundaries, [filename '.txt']);

   [interfaces, boundaries] = nrbmultipatch (ptcs_el);
   boundaries = [];

   nrbexport (ptcs_el, interfaces, boundaries, [filename '_electrode.txt']);
end
