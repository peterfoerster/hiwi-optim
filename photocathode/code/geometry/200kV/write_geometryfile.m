function [] = write_geometryfile (ptcs, filename)
  [interfaces, boundaries] = nrbmultipatch (ptcs);
  boundaries = [];

  % electrode
  boundaries(1).patches = [1 2 3 4 5 6 7 9 11 13 16 18 19 19 20 20 21 21 21];
  boundaries(1).faces   = [3 3 3 3 3 1 1 3  3  1  3  2  1  2  1  3  2  3  4];

  % vacuumchamber
  boundaries(2).patches = [1 2 3 4 5 6 7 8 10 12 13 14 15 17 17];
  boundaries(2).faces   = [4 4 4 4 4 2 2 2  3  3  3  3  3  1  3];

  % neumann
  boundaries(3).patches = [1 17]; ? work around cable somehow
  boundaries(3).faces   = [1  1];

  for ibnd = 1:length(boundaries)
    boundaries(ibnd).nsides = length(boundaries(ibnd).patches);
  end

  nrbexport (ptcs, interfaces, boundaries, filename);
end
