function [] = write_geometryfile_v3 (ptcs, filename)
  [interfaces, boundaries] = nrbmultipatch (ptcs);
  boundaries = [];

  % electrode
  boundaries(1).patches = [1 3 5 7 9 11 15 16 17 18 19 20 21 21 29 33 35 36 36 37 37 37 38 39 39 39];
  boundaries(1).faces   = [1 1 1 1 1  1  3  3  3  3  3  2  2  3  2  2  2  3  4  1  2  3  2  1  2  4];

  % vacuumchamber
  boundaries(2).patches = [2 4 6 8 10 12 13 14 14 15 16 17 18 22 22 23 24 26 28 30 32 34 35];
  boundaries(2).faces   = [2 2 2 2  2  2  4  2  4  4  4  4  4  1  4  4  1  1  1  1  1  1  1];

  % neumann
  boundaries(3).patches = [1 2 35];
  boundaries(3).faces   = [3 3  3];

  for ibnd = 1:length(boundaries)
    boundaries(ibnd).nsides = length(boundaries(ibnd).patches);
  end

  nrbexport (ptcs, interfaces, boundaries, filename);
end
