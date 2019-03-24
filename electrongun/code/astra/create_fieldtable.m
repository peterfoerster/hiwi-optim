clear all; close all; clc
geometry_file = "gun_half_short.txt";
[ptcs] = set_ptcs_2D (geometry_file);
voltage = 90e3;
[problem_data, method_data] = init_ptnl_2D (geometry_file, voltage);
[geometry, msh, space, u] = mp_solve_laplace (problem_data, method_data);

%res_x = res_y = 10;
%plot_potential_2D (res_x, res_y, u, space, geometry);

% choose physical coordinates
% z is longitudinal axis
Nz = 30;

iptc = 8;
ptc_phys = geo_nurbs (geometry(iptc).nurbs, geometry(iptc).dnurbs, geometry(iptc).dnurbs2, {1,0}, 0, geometry(iptc).rdim);
z = linspace(0, ptc_phys(1), Nz);

% transform to parametric coordinates and compute E-field in one step
%(Ny,Nx,Nz) and then write each Nz below the previous one
E = zeros(Nz,2);
for iz=1:Nz
  [out, r_par, iptc] = tfr_phys_to_param_2D (geometry, ptcs, [z(iz) 0 0]);
  if (~out)
    E(iz,:) = -sp_eval (u(space.gnum{iptc}), space.sp_patch{iptc}, geometry(iptc), {r_par(1), r_par(2)}, 'gradient');
  end
end

% write to files
% E-field is in MV/m in Astra
E = 1e-6*E;
filename = 'dcEgun.dat';

fid = fopen(filename, "w");

% write values
dlmwrite(fid, [z' E(:,1)], ' ', 'append', 'on');

fclose(fid);
