% Collects the results.

% GEOMETRY
% geometry_file = 'geometry_v6_orig';
% geometry = mp_geo_load ([geometry_file '.txt']);
% write_boundary (geometry);
% write_geometry (geometry);

% B-SPLINE CURVE
% knots = [0 0 0 0.3 0.5 1 1 1];
% ctrl  = [0 1 3 5 7;
%          1 -1 2 4 1];
% crv   = nrbmak(ctrl, knots);
% nrbeval(crv, [0.3 0.5])
% nsub = 100;
% nrbctrlplot_dat(crv, nsub, ['bspline_curve']);

% B-SPLINE BASIS
% knots = [0 0 0 0.3 0.5 1 1 1];
% ctrl  = [0 1 3 5 7;
%          1 -1 2 4 1];
% crv   = nrbmak(ctrl, knots);
% p  = crv.order - 1;
% u  = linspace(0, 1, 1000);
% for ik=1:(length(knots)-3)
%     B = tbasisfun(u, p, knots(ik:ik+(p+1)));
%     write_dat1D(['bspline_basis_' num2str(ik) '.dat'], u, B);
%     hold on;
%     plot(u, B);
%     hold off;
% end

% B-SPLINE DEGREE ELEVATION
% knots = [0 0 0 0.3 0.5 1 1 1];
% ctrl  = [0 1 3 5 7;
%          1 -1 2 4 1];
% crv   = nrbmak(ctrl, knots);
% crv   = nrbdegelev(crv, 1);
% nrbeval(crv, [0.3 0.5])
% nsub = 100;
% nrbctrlplot_dat(crv, nsub, ['bspline_curve_degelev']);
% clf;
% p  = crv.order - 1;
% u  = linspace(0, 1, 1000);
% for ik=1:(length(crv.knots)-(p+1))
%     B = tbasisfun(u, p, crv.knots(ik:ik+(p+1)));
%     write_dat1D(['bspline_basis_degelev_' num2str(ik) '.dat'], u, B);
%     hold on;
%     plot(u, B);
%     hold off;
% end

% B-SPLINE KNOT INSERTION
% knots = [0 0 0 0.3 0.5 1 1 1];
% ctrl  = [0 1 3 5 7;
%          1 -1 2 4 1];
% crv   = nrbmak(ctrl, knots);
% crv   = nrbkntins(crv, [0.5 0.7]);
% nrbeval(crv, [0.3 0.5 0.7])
% nsub = 100;
% nrbctrlplot_dat(crv, nsub, ['bspline_curve_kntins']);
% clf;
% p  = crv.order - 1;
% u  = linspace(0, 1, 1000);
% for ik=1:(length(crv.knots)-(p+1))
%     B = tbasisfun(u, p, crv.knots(ik:ik+(p+1)));
%     write_dat1D(['bspline_basis_kntins_' num2str(ik) '.dat'], u, B);
%     hold on;
%     plot(u, B);
%     hold off;
% end

% ORIGINAL CURVE
% order = 8;
% [~, ~, ~, ~, nrb_orig] = create_nrb_opt_electrode (order);
% nsub = 100;
% nrbctrlplot_dat(nrb_orig, nsub, ['nurbs_orig']);

% INITIAL CURVE
% [x_opt]
% load('result_nlopt_fit.mat');
% order = continuity = 8;
% write_ctrl_opt (order, x_opt, continuity);

% ISRES
% [x_opt]
% load('result_nlopt_order=8_run5.mat');
% order = continuity = 8;
% write_ctrl_opt (order, x_opt, continuity);

% COBYLA
% [x_opt]
% load('result_nlopt_order=8_run6.mat');
% order = continuity = 8;
% write_ctrl_opt (order, x_opt, continuity);

% E_ORIG (13 MV/m on patch 17)
% geometry_file = 'geometry_v6_orig';
% [problem_data, method_data] = setup_problem (geometry_file);
% tic;
% [geometry, msh, space, phi] = mp_solve_electrostatics_axi2d (problem_data, method_data);
% fprintf('\nmp_solve_electrostatics_axi2d: %d min\n', toc/60);
% npts = 9;
% vtk_pts = {linspace(0, 1, npts), linspace(0, 1, npts)};
% plot_es_mp (phi, space, geometry, vtk_pts, ['E_degree=' num2str(method_data.degree(1)) '_nsub=' num2str(method_data.nsub(1)) '_npts=' num2str(npts)]);
% view(2);

% E_COBYLA (9.06 MV/m again on patch 17)
% geometry_file = 'v6_opt_order=8_run6';
% [problem_data, method_data] = setup_problem (geometry_file);
% tic;
% [geometry, msh, space, phi] = mp_solve_electrostatics_axi2d (problem_data, method_data);
% fprintf('\nmp_solve_electrostatics_axi2d: %d min\n', toc/60);
% npts = 9;
% vtk_pts = {linspace(0, 1, npts), linspace(0, 1, npts)};
% plot_es_mp (phi, space, geometry, vtk_pts, ['E_degree=' num2str(method_data.degree(1)) '_nsub=' num2str(method_data.nsub(1)) '_npts=' num2str(npts)]);
% view(2);

% E_ORIG_CST (12.933 MV/m on patch 17)
% filename = ['E_degree=3_nsub=16'];
% npts     = 9;
% nptc     = 34;
% write_cst_pointlist (filename, npts, nptc);
% data = dlmread('photogun_orig.txt');
% x = data(3:end,1);
% y = data(3:end,2);
% E = data(3:end,4:6);
% E = sqrt(E(:,1).^2 + E(:,2).^2 + E(:,3).^2);
% write_cst_es_dat (x, y, E, 'E_cst_degree=2', npts, nptc);

% E_COBYLA_CST (9.06 MV/m on patch 17)
% filename = ['E_degree=3_nsub=16'];
% npts     = 9;
% nptc     = 34;
% write_cst_pointlist (filename, npts, nptc);
% data = dlmread('photogun_opt.txt');
% x = data(3:end,1);
% y = data(3:end,2);
% E = data(3:end,4:6);
% E = sqrt(E(:,1).^2 + E(:,2).^2 + E(:,3).^2);
% write_cst_es_dat (x, y, E, 'E_cst_degree=2', npts, nptc);

% CVG CURVE ORDER
% [x_opt], [obj_opt]
% load('result_nlopt_order=8_run6.mat');
% n_dof = length(x_opt);
% obj   = obj_opt;
% V_c   = volume_constraint(x_opt, 8, 8) - 1;
% load('result_nlopt_order=9_run6.mat');
% n_dof = [n_dof length(x_opt)];
% obj   = [obj obj_opt];
% V_c   = [V_c (volume_constraint(x_opt, 9, 9) - 1)];
% load('result_nlopt_order=10_run6.mat');
% n_dof = [n_dof length(x_opt)];
% obj   = [obj obj_opt];
% V_c   = [V_c (volume_constraint(x_opt, 10, 10) - 1)];
% load('result_nlopt_order=11_run6.mat');
% n_dof = [n_dof length(x_opt)];
% obj   = [obj obj_opt];
% V_c   = [V_c (volume_constraint(x_opt, 11, 11) - 1)];
% write_dat1D(['cvg_p_obj.dat'], n_dof, obj*1e-6);
% write_dat1D(['cvg_p_V.dat'], n_dof, V_c);

% CVG NUMBER OF KNOTS
% [x_opt], [obj_opt]
% load('result_nlopt_order=8_run6.mat');
% n_dof = length(x_opt);
% obj   = obj_opt;
% V_c   = volume_constraint(x_opt, 8, 8) - 1;
% load('result_nlopt_order=8_continuity=7_run6.mat');
% n_dof = [n_dof length(x_opt)];
% obj   = [obj obj_opt];
% V_c   = [V_c (volume_constraint(x_opt, 8, 7) - 1)];
% load('result_nlopt_order=8_continuity=6_run6.mat');
% n_dof = [n_dof length(x_opt)];
% obj   = [obj obj_opt];
% V_c   = [V_c (volume_constraint(x_opt, 8, 6) - 1)];
% load('result_nlopt_order=8_continuity=5_run6.mat');
% n_dof = [n_dof length(x_opt)];
% obj   = [obj obj_opt];
% V_c   = [V_c (volume_constraint(x_opt, 8, 5) - 1)];
% write_dat1D(['cvg_h_obj.dat'], n_dof, obj*1e-6);
% write_dat1D(['cvg_h_V.dat'], n_dof, V_c);

% ASTRA INIT
% data = dlmread('laser_I=2048_Q=0.0001_sc=0.005.in');
% x = data(:,1);
% y = data(:,2);
% t = data(:,7);
% N  = 20;
% dt = (max(t) - min(t)) / N
% hist(t, N);
% write_dat1D(['astra_init_space.dat'], x, y);
% write_dat1D(['astra_init_time.dat'], t, NaN(size(t)));

% ASTRA CVG
% [err_linf] = compute_astra_error()
% z = 447e-3;
% filename = 'results/astra/sim/';
% plot_astra ([filename 'ref/ref/photogun'], z);

% E_CATHODE
% geometry_file = 'v6_opt_order=8_run6';
% [problem_data, method_data] = setup_problem (geometry_file);
% [geometry, msh, space, phi] = mp_solve_electrostatics_axi2d (problem_data, method_data);
% iptcs = [6];
% y_c   = linspace(0, 1, 100);
% % cathode surface only (2.991 MV/m)
% ii = 1;
% [E_max] = computeE_max_cathode (phi(space.gnum{iptcs(ii)}), msh.msh_patch{iptcs(ii)}, space.sp_patch{iptcs(ii)}, geometry(iptcs(ii)), y_c)
% % alternatively take into account the entire patch (4.139 MV/m)
% obj = 0;
% for ii=1:length(iptcs)
%     obj_ptc = computeE_max (phi(space.gnum{iptcs(ii)}), msh.msh_patch{iptcs(ii)}, space.sp_patch{iptcs(ii)}, geometry(iptcs(ii)));
%     obj = max([obj obj_ptc]);
% end

% ASTRA DELTA_E_RMS (0.0484 keV ~ 48.392 eV)
% data = dlmread('photogun.Zemit.001');
% z      = data(:,1);
% DE_rms = data(:,5);
% plot(z, DE_rms);
% DE_rms(end)

% CST LOW ORDER
% filename = ['pointlist_loworder'];
% x = 0e-3 * ones(1000,1); % [-5,-2,2,5]
% y = 0e-3 * ones(1000,1); % [-5,-2,2,5]
% z = linspace(307e-3, 447e-3, 1000);
% dlmwrite([filename '_x=' num2str(x(1)) '_y=' num2str(y(1)) '.txt'], [z' y x], ' ');
% filename = ['photogun_loworder'];
% data = dlmread([filename '_x=' num2str(x(1)) '_y=' num2str(y(1)) '.txt']);
% z = data(3:end,1);
% E = data(3:end,4:6);
% if (x(1) ~= 0)
%     write_dat1D ([filename '_x=' num2str(x(1)) '_y=' num2str(y(1)) '_Ex' '.dat'], z, E(:,3));
% elseif (y(1) ~= 0)
%     write_dat1D ([filename '_x=' num2str(x(1)) '_y=' num2str(y(1)) '_Ey' '.dat'], z, E(:,2));
% else
%     write_dat1D ([filename '_x=' num2str(x(1)) '_y=' num2str(y(1)) '_Ex' '.dat'], z, E(:,3));
%     write_dat1D ([filename '_x=' num2str(x(1)) '_y=' num2str(y(1)) '_Ey' '.dat'], z, E(:,2));
% end

% IGA LOW ORDER
% geometry_file = 'v6_opt_order=8_run6';
% [geometry] = mp_geo_load ([geometry_file '.txt']);
% [problem_data, method_data] = setup_problem (geometry_file);
% [geometry, msh, space, phi] = mp_solve_electrostatics_axi2d (problem_data, method_data);
% x = 0e-3 * ones(1000,1); % [-5,-2,2,5]
% y = 5e-3 * ones(1000,1); % [-5,-2,2,5]
% z = linspace(307e-3, 447e-3, 1000);
% E = NaN(1000,3);
% for iz=1:length(z)
%     E(iz,:) = compute_fieldmap(geometry, space, phi, x(iz), y(iz), z(iz));
% end
% filename = ['iga_loworder'];
% if (x(1) ~= 0)
%     write_dat1D ([filename '_x=' num2str(x(1)) '_y=' num2str(y(1)) '_Ex' '.dat'], z, E(:,1));
% elseif (y(1) ~= 0)
%     write_dat1D ([filename '_x=' num2str(x(1)) '_y=' num2str(y(1)) '_Ey' '.dat'], z, E(:,2));
% else
%     write_dat1D ([filename '_x=' num2str(x(1)) '_y=' num2str(y(1)) '_Ex' '.dat'], z, E(:,1));
%     write_dat1D ([filename '_x=' num2str(x(1)) '_y=' num2str(y(1)) '_Ey' '.dat'], z, E(:,2));
% end

% ASTRA ORIG/OPT
% z = 447e-3;
% filename = 'results/astra/sim/';
% plot_astra ([filename 'ref/photogun'], z);
% plot_astra ([filename 'orig/photogun'], z);

% ASTRA BUNCH CHARGE INCREASE/VOLTAGE DECREASE
% z = 447e-3;
% filename = 'results/astra/sim/';
% plot_astra ([filename '77pC/photogun'], z);
% plot_astra ([filename '77pC/150kV/photogun'], z);

% INSULATOR POTENTIAL DISTRIBUTION
% geometry_file = 'v6_opt_order=8_run6';
% [problem_data, method_data] = setup_problem (geometry_file);
% [geometry, msh, space, phi] = mp_solve_electrostatics_axi2d (problem_data, method_data);
% write_ins_pot (geometry, msh, space, phi);

% E_TRIPLE_POINT (4.38 MV/m)
% geometry_file = 'v6_opt_order=8_run6';
% [problem_data, method_data] = setup_problem (geometry_file);
% [geometry, msh, space, phi] = mp_solve_electrostatics_axi2d (problem_data, method_data);
% [E_max] = computeE_max_triplepoint (geometry, msh, space, phi);

% E_ANODE_RING (5.63 MV/m)
% geometry_file = 'v6_opt_order=8_run6';
% [problem_data, method_data] = setup_problem (geometry_file);
% [geometry, msh, space, phi] = mp_solve_electrostatics_axi2d (problem_data, method_data);
% [E_max] = computeE_max_anodering (geometry, msh, space, phi);

% ASTRA OPT CHEAP
z = 447e-3;
filename = 'results/astra/sim/';
plot_astra ([filename 'cheap/photogun'], z);
