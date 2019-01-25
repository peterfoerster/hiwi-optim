clear all; close all; clc
geometry_file = "gun_half_short.txt";
[ptcs] = set_ptcs_2D (geometry_file);
voltage = 90e3;
[problem_data, method_data] = init_ptnl_2D (geometry_file, voltage);
[geometry, msh, space, u] = mp_solve_laplace (problem_data, method_data);

%res_x = res_y = 10;
%plot_potential_2D (res_x, res_y, u, space, geometry);

% choose physical coordinates
% z is longitudinal axis so no phi(x,y,0)=phi(z,x,0)
Nx = 25;
Ny = 1;
Nz = 25;

iptc = 11;
ptc_phys = geo_nurbs (geometry(iptc).nurbs, geometry(iptc).dnurbs, geometry(iptc).dnurbs2, {1,1}, 0, geometry(iptc).rdim);
x = linspace(0, ptc_phys(2), Nx);

y = 0;

iptc = 8;
ptc_phys = geo_nurbs (geometry(iptc).nurbs, geometry(iptc).dnurbs, geometry(iptc).dnurbs2, {1,1}, 0, geometry(iptc).rdim);
z = linspace(0, ptc_phys(1), Nz);

% transform to parametric coordinates nd compute e-field in one step
%(Nx,Ny,Nz) and then write each Nz below the previous one
E = zeros(Ny,Nx,Nz,3);
for iz=1:Nz
  for ix=1:Nx
    [out, r_par, iptc] = tfr_phys_to_param_2D (geometry, ptcs, [z(iz) x(ix) 0]);
    if (~out)
      E(:,ix,iz,1:2) = -sp_eval (u(space.gnum{iptc}), space.sp_patch{iptc}, geometry(iptc), {r_par(1), r_par(2)}, 'gradient');
    end
  end
end
