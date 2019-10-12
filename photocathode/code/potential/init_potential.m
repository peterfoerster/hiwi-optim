function [problem_data, method_data] = init_potential (geometry_file, voltage)
   problem_data.geo_name     = [geometry_file '.txt'];
   problem_data.nmnn_sides   = [3];
   problem_data.drchlt_sides = [1 2];

   % permittivity as a function on each patch
   problem_data.c_diff = @(x,y,ip) permittivity(ip, x, y, geometry_file);

   % no static sources
   problem_data.f = @(x,y) zeros(size(x));
   problem_data.g = @(x,y,ib) nm_bc (ib, x, y);
   problem_data.h = @(x,y,ib) drl_bc (ib, x, y, voltage);

   method_data.degree     = [3 3];
   % degree-1
   method_data.regularity = method_data.degree - 1;
   % to be determined by convergence study
   method_data.nsub       = [16 16];
   % degree+1
   method_data.nquad      = method_data.degree + 1;
end
