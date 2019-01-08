pkg load geopdes;
addpath(genpath(pwd));

% plot the geometry
%geometry_file = "gun_half_short.txt";
%nsub = 5;
%width = 8;
%options.numbers = 1;
%options.boundary = 1;
%plot_geometry_2D (geometry_file, nsub, width, options);

% solve for the potential
%voltage = 90e3;
%[problem_data, method_data] = init_ptnl_2D (geometry_file, voltage);
%[geometry, msh, space, u] = mp_solve_laplace (problem_data, method_data);
%res_x = res_y = 10;
%plot_potential_2D (res_x, res_y, u, space, geometry);

% Artems implementation
%geometry_path_name = "test_geometry";
%move = 0;
%% length in [m]?
%lngth = 3;
%load("cathode_nrb_initial.mat");
%[ crv, l, cathode_nrb ] = contruct_canon_geometry( geometry_path_name, move, lngth, cathode_nrb_initial  );

% new tests
%crv = nrbline([0 0], [0 0.05])
%dcrv = nrbderiv(crv);
%[pnt, jac] = nrbdeval(crv, dcrv, {0})

%crv = create3Dcathode;
%nrbctrlplot(crv);
%crvmod = nrbkntins(crv,[1/2]);
%crvmod = nrbmodp(crvmod, [-0.001 0 0], 3);
%figure;
%nrbctrlplot(crvmod);

%dcrv = nrbderiv(crv);
%[pnt, jac] = nrbdeval(crv, dcrv, {0});
%
%dcrvmod = nrbderiv(crvmod);
%[pntmod, jacmod] = nrbdeval(crvmod, dcrvmod, {0});
%view(12, 30)
