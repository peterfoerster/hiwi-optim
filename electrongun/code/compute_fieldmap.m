% compute the potential
geometry_file = 'gun_half_short';
voltage = 90e3;
[problem_data, method_data] = init_potential (geometry_file, voltage);
[geometry, msh, space, u] = mp_solve_laplace (problem_data, method_data);

% choose number of physical coordinates
% z is longitudinal axis
Nx = 5;
Ny = 5;
Nz = 5;

% determine evaluation points for the fieldmap
cathode_top = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0,1}, 0, geometry(1).rdim);
cathode_start = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0,0}, 0, geometry(1).rdim);
beamtube_end = geo_nurbs (geometry(8).nurbs, geometry(8).dnurbs, geometry(8).dnurbs2, {1,0}, 0, geometry(8).rdim);
x = linspace(0, cathode_top(2), Nx);
y = linspace(0, cathode_top(2), Ny);
z = linspace(cathode_start(1), beamtube_end(1), Nz);

% transform to parametric coordinates and compute E-field in one step
%(Ny,Nx,Nz) and then write each Nz below the previous one
% only write the necessary values in .ex
[ptcs] = set_ptcs (geometry_file);
E = zeros(Nx, Ny, Nz, 3);
tic;
for iz=1:Nz
  for iy=1:Ny
    for ix=1:Nx
      % transform cartesian to polar coordinates
      [phi, rho] = cart2pol (x(ix), y(iy));
      [out, r_par, iptc] = tfr_phys_to_param (geometry, ptcs, [z(iz) rho 0]);
      if (~out)
        % need to compute appropriate field components using the angle
        E_2D = -sp_eval (u(space.gnum{iptc}), space.sp_patch{iptc}, geometry(iptc), {r_par(1), r_par(2)}, 'gradient');
        E(ix,iy,iz,:) = [E_2D(2)*cos(phi) E_2D(2)*sin(phi) E_2D(1)];
      end%if
    end
  end
end

fprintf('\ntime elapsed for field evaluation:%d\n', toc);
save('E_full', 'E');

% signal that the program is finished
t = linspace(1, 20, 8000);
Y = sin(2*pi*440*t);
sound(Y);

% % write to files
% % E-field is in MV/m in Astra
% E = 1e-6*E;
% filename = ['DC-3D.ex'; 'DC-3D.ey'; 'DC-3D.ez'];
% for ifile=1:size(filename, 1)
%   fid = fopen(filename(ifile,:), "w");
%   % header
%   dlmwrite(fid, [Nx x], ' ', 'append', 'on');
%   dlmwrite(fid, [Ny y], ' ', 'append', 'on');
%   dlmwrite(fid, [Nz z], ' ', 'append', 'on');
%   % write values
%   for iz=1:Nz
%     dlmwrite(fid, E(:,:,iz,ifile), ' ', 'append', 'on');
%   end
%   fclose(fid);
% end
