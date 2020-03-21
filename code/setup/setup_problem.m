function [problem_data, method_data] = setup_problem (geometry_file)
   problem_data.geo_name     = [geometry_file '.txt'];
   problem_data.nmnn_sides   = [3];
   problem_data.drchlt_sides = [1 2];

   epsilon_r = 9.4;
   problem_data.epsilon = @(x,y,ip) epsilon(ip, x, y, epsilon_r, geometry_file);

   v_el = -200e3;
   v_ar = 0;
   problem_data.f = @(x,y) zeros(size(x));
   problem_data.h = @(x,y,ib) drl_bc (ib, x, y, v_el, v_ar);
   problem_data.g = @(x,y,ib) nm_bc (ib, x, y);

   method_data.degree     = [3 3];
   method_data.regularity = method_data.degree - 1;
   method_data.nsub       = [2^4 2^4];
   method_data.nquad      = method_data.degree + 1;
end
