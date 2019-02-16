% this method leads to the error!
% somehow need different field map
% all other settings work this is the only wrong part

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
Nx = 1;
Ny = 1;
Nz = 1;

x = 0;

iptc = 1;
ptc_phys = geo_nurbs (geometry(iptc).nurbs, geometry(iptc).dnurbs, geometry(iptc).dnurbs2, {0,1}, 0, geometry(iptc).rdim);
y = linspace(0, ptc_phys(2), Ny);

iptc = 8;
ptc_phys = geo_nurbs (geometry(iptc).nurbs, geometry(iptc).dnurbs, geometry(iptc).dnurbs2, {1,0}, 0, geometry(iptc).rdim);
z = linspace(0, ptc_phys(1), Nz);

% transform to parametric coordinates and compute E-field in one step
%(Ny,Nx,Nz) and then write each Nz below the previous one
% only write the necessary values in .ex
E = zeros(Ny,Nx,Nz,3);
for iz=1:Nz
  for iy=1:Ny
    [out, r_par, iptc] = tfr_phys_to_param_2D (geometry, ptcs, [z(iz) y(iy) 0]);
    if (~out)
      E(iy,:,iz,1:2) = -sp_eval (u(space.gnum{iptc}), space.sp_patch{iptc}, geometry(iptc), {r_par(1), r_par(2)}, 'gradient');
    end
  end
end

% write to files
% E-field is in MV/m in Astra
E = 1e-6*E;
filename = ["DC-3D.ez"; "DC-3D.ey"; "DC-3D.ex"];
for ifile=1:size(filename,1)
  fid = fopen(filename(ifile,:), "w");
  % header
  dlmwrite(fid, [Nx x], ' ', 'append', 'on');
  dlmwrite(fid, [Ny y], ' ', 'append', 'on');
  dlmwrite(fid, [Nz z], ' ', 'append', 'on');
  % write values
  for iz=1:Nz
    dlmwrite(fid, E(:,:,iz,ifile), ' ', 'append', 'on');
  end
  fclose(fid);
end
