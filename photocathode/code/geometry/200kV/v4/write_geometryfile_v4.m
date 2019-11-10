function [] = write_geometryfile_v4 (ptcs, filename)
   [interfaces, boundaries] = nrbmultipatch (ptcs);
   boundaries = [];

   % electrode
   boundaries(1).patches = [1 2 3 4 5 6 7 8 9 10 11 11 14 16 20 23 24 24 25 25 25 26 27 27 27];
   boundaries(1).faces   = [1 1 1 1 1 3 3 3 3  2  2  3  2  4  2  2  3  4  1  2  3  2  1  2  4];

   % vacuumchamber
   boundaries(2).patches = [1 2 3 4 5 6 7 8 9 12 12 13 14 15 17 18 21];
   boundaries(2).faces   = [2 2 2 2 2 4 4 4 4  1  4  1  1  1  1  1  1];

   % neumann
   boundaries(3).patches = [1 21 22 23];
   boundaries(3).faces   = [3  3  3  3];

   for ibnd = 1:length(boundaries)
      boundaries(ibnd).nsides = length(boundaries(ibnd).patches);
   end

   nrbexport (ptcs, interfaces, boundaries, filename);
end
