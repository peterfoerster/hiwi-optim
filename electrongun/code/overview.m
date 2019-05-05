close all;
pkg load geopdes;

% plot the geometry
% short, long
geometry_file = 'gun_half_short';
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load ([geometry_file '.txt']);

nsub = 5;
% for iptc=1:length(geometry)
%  for ibnd=1:length(geometry(iptc).boundary)
%   hold on;
%   filename = ['boundaries' num2str(iptc) num2str(ibnd) '.dat'];
%   nrbplot_mod(geometry(iptc).boundary(ibnd).nurbs, nsub, filename);
%   hold off;
%  end
% end

% return

width = 2;
options.numbers = 1;
options.boundary = 1;
figure;
% plot_boundary (nsub, width, geometry, boundaries);
plot_geometry (geometry, boundaries, nsub, width, options);
return
% solve for the potential
 voltage = 90e3;
 [problem_data, method_data] = init_potential (voltage);
 [geometry, msh, space, u] = mp_solve_laplace_mod (problem_data, method_data, geometry, boundaries, interfaces, boundary_interfaces);

% plot the potential and the absolute value of the gradient
 figure;
 nsub_x = method_data.nsub(1);
 nsub_y = method_data.nsub(2);
 % plot_potential (nsub_x, nsub_y, u, space, geometry);
% figure;
plot_gradient (nsub_x, nsub_y, u, space, geometry);
return
% convergence study (with absolute error)
filename = 'gun_half_short_degree=2_nsub=var_rel';
figure;
plot_iga_convergence (filename);

####################################################################
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
