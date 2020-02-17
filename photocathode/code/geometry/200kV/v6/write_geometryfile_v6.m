function [] = write_geometryfile_v6 (ptcs_vac, ptcs_el, filename)
   [interfaces, boundaries] = nrbmultipatch (ptcs_vac);
   boundaries = [];

   % electrode
   boundaries(1).patches = [5 6 7 8 9 13 14 15 16 17 18 18 23 27 28 28 28 29 30 30 31];
   boundaries(1).faces   = [1 1 1 1 1  1  3  3  3  2  2  3  2  4  1  4  2  2  2  3  2];

   % vacuumchamber
   boundaries(2).patches = [1 10 10 11 12 14 15 16 19 20 20 24 25 34];
   boundaries(2).faces   = [2 2   4  4  4  4  4  4 14  4  1  1  1  1];

   % Neumann
   boundaries(3).patches = [1 2 3 4 5 31 32 33 34];
   boundaries(3).faces   = [3 3 3 3 3  3  3  3  3];

   for ibnd=1:length(boundaries)
      boundaries(ibnd).nsides = length(boundaries(ibnd).patches);
   end

   nrbexport (ptcs_vac, interfaces, boundaries, filename);

   [interfaces, boundaries] = nrbmultipatch (ptcs_el);
   boundaries = [];

   nrbexport (ptcs_el, interfaces, boundaries, [filename '_electrode']);
end
