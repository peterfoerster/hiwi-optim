function [] = write_geometryfile_v5 (ptcs, filename)
   [interfaces, boundaries] = nrbmultipatch (ptcs);
   boundaries = [];

   % electrode
   boundaries(1).patches = [1 2 3 4 5 6 7 8 9 9 12 14 18 21 22 22 23 23 23 24 25 25 25];
   boundaries(1).faces   = [1 1 1 1 1 3 3 3 2 3  2  4  2  2  3  4  1  2  3  2  1  2  4];

   % vacuumchamber
   boundaries(2).patches = [1 2 3 4 5 6 7 10 10 11 12 13 15 15 15 18 19 19 20];
   boundaries(2).faces   = [2 2 2 2 2 4 4  1  4  1  1  1  1  2  3  1  1  4  4];

   % neumann
   boundaries(3).patches = [1 19 20 21];
   boundaries(3).faces   = [3  3  3  3];

   for ibnd = 1:length(boundaries)
      boundaries(ibnd).nsides = length(boundaries(ibnd).patches);
   end

   nrbexport (ptcs, interfaces, boundaries, filename);
end
