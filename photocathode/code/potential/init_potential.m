function [problem_data, method_data] = init_potential (geometry, boundaries, interfaces, boundary_interfaces, voltage)
  problem_data.geometry            = geometry;
  problem_data.boundaries          = boundaries;
  problem_data.interfaces          = interfaces;
  problem_data.boundary_interfaces = boundary_interfaces;
  problem_data.nmnn_sides          = [3];
  problem_data.drchlt_sides        = [1 2];

  % permittivity as a function on each patch
  problem_data.c_diff = @(x,y,ip) permittivity(ip, x, y, geometry_file);

  % no static sources
  problem_data.f = @(x,y) zeros(size(x));
  problem_data.g = @(x,y,ib) nm_bc (ib, x, y);
  problem_data.h = @(x,y,ib) drl_bc (ib, x, y, voltage);

  method_data.degree     = [3 3];
  method_data.regularity = [1 1];
  % to be determined by convergence study
  method_data.nsub       = [64 64];
  % 3 suffices if nsub >= 1
  method_data.nquad      = [3 3];
end
