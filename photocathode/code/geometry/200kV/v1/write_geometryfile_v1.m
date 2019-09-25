function [] = write_geometryfile_v1 (ptcs, filename)
  [interfaces, boundaries] = nrbmultipatch (ptcs);
  boundaries = [];

  % electrode
  boundaries(1).patches = [1 2 3 4 5 6 7 8 9 10 11 11 14 16 18 20 21 21 22 22 22 23 24 24 24];
  boundaries(1).faces   = [1 1 1 1 1 3 3 3 3  2  2  3  2  4  2  2  3  4  1  2  3  2  1  2  4];

  % vacuumchamber
  boundaries(2).patches = [1 2 3 4 5 6 7 8 9 12 12 13 14 15 17 19 20];
  boundaries(2).faces   = [2 2 2 2 2 4 4 4 4  1  4  1  1  1  1  1  1];

  % neumann
  boundaries(3).patches = [1 20];
  boundaries(3).faces   = [3  3];

  for ibnd = 1:length(boundaries)
    boundaries(ibnd).nsides = length(boundaries(ibnd).patches);
  end

  nrbexport (ptcs, interfaces, boundaries, filename);
end
