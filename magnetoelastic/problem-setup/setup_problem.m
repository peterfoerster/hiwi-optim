function [problem_data, method_data] = setup_problem (geometry_file)
   problem_data.geo_name     = [geometry_file '.txt'];
   problem_data.nmnn_sides   = [];
   problem_data.drchlt_sides = [1];

   % diagonal components of reluctivity tensor as cell array of function handles
   problem_data.nu = {@(x,y,iptc) compute_nu11(x, y, iptc), @(x,y,iptc) compute_nu22(x, y, iptc)};

   % coils defined via rectangle
   coils.bll = [0.5 0.5];
   coils.bur = [1.5 1];
   coils.tll = [0.5 4];
   coils.tur = [1.5 4.5];
   coils.current = 100;
   problem_data.f = @(x,y,iptc) compute_Is(x, y, iptc, coils);

   problem_data.g = @(x,y,ib) zeros(size(x));
   problem_data.h = @(x,y,ib) zeros(size(x));

   method_data.degree     = [2 2];
   % degree-1
   method_data.regularity = method_data.degree - 1;
   % to be determined by convergence study
   method_data.nsub       = [4 4];
   % degree+1
   method_data.nquad      = method_data.degree + 1;
end
