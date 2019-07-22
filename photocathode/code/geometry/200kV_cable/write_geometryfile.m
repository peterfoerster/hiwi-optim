function [] = write_geometryfile (ptcs, filename)
  [interfaces, boundaries] = nrbmultipatch (ptcs);
  boundaries = [];

  % electrode
  boundaries(1).patches = [1 2 3 4 5 6 7 9 11 11 13 16 18 19 19 20 20 21 21 21 22];
  boundaries(1).faces   = [1 1 1 1 1 1 1 2  2  3  2  2  4  3  4  1  3  1  2  4  2];

  % vacuumchamber
  boundaries(2).patches = [1 2 3 4 5 6 7 8 10 12 13 14 15 17 22];
  boundaries(2).faces   = [2 2 2 2 2 2 2 2  1  1  1  1  1  1  1];

  % neumann
  boundaries(3).patches = [1 22];
  boundaries(3).faces   = [3  3];

  for ibnd = 1:length(boundaries)
    boundaries(ibnd).nsides = length(boundaries(ibnd).patches);
  end

  nrbexport (ptcs, interfaces, boundaries, filename);
end
