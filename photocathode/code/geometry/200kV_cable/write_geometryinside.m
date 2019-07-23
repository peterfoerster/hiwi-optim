function [] = write_geometryfile (ptcs_inside, filename)
  [interfaces, boundaries] = nrbmultipatch (ptcs_inside);
  boundaries = [];
  nrbexport (ptcs_inside, interfaces, boundaries, filename);
end
