% 1) PHYSICAL DATA OF THE PROBLEM
clear problem_data  
% Physical domain, defined as NURBS map given in a text file
geo_name = 'mane2.txt';


% Type of boundary conditions for each side of the domain
nmnn_sides   = [];
drchlt_sides = [1 ];

% Physical parameters

mu0=4*pi*10^(-7) % in meter
muFe=14872;
muCu=0.99999;

Je=100;
% Source and boundary terms
g = @(x, y, ind) zeros(size(x));
h = @(x, y, ind) zeros(size(x));



% 2) CHOICE OF THE DISCRETIZATION PARAMETERS

degree     = [2 2];       % Degree of the splines
regularity = [1 1];       % Regularity of the splines
nsub       = [4 4];       % Number of subdivisions
nquad      = [8 8];       % Points for the Gaussian quadrature rule

% 3) CALL TO THE SOLVER
% Construct geometry structure, and information for interfaces and boundaries
[geometry, boundaries, interfaces, ~, boundary_interfaces] = mp_geo_load (geo_name);
npatch = numel (geometry);

msh = cell (1, npatch); 
sp = cell (1, npatch);
for iptc = 1:npatch

% Define the refined mesh, with tensor product structure
  [knots{iptc}, zeta{iptc}] = ...
         kntrefine (geometry(iptc).nurbs.knots, nsub-1, degree, regularity);

% Compute the quadrature rule
  rule      = msh_gauss_nodes (nquad);
  [qn, qw]  = msh_set_quad_nodes (zeta{iptc}, rule);
  msh{iptc} = msh_cartesian (zeta{iptc}, qn, qw, geometry(iptc));

% Evaluate the discrete space basis functions in the quadrature points
  sp{iptc} = sp_bspline (knots{iptc}, degree, msh{iptc});
endfor

msh = msh_multipatch (msh, boundaries);
space = sp_multipatch (sp, msh, interfaces, boundary_interfaces);
clear sp

% Compute and assemble the matrices 
%stiff_mat = op_gradu_gradv_mp (space, space, msh, c_diff);
if (nargin < 5)
    patch_list = 1:msh.npatch;
  endif

  if ((space.npatch ~= space.npatch) || (space.npatch ~= msh.npatch))
    error ('op_gradu_gradv_mp: the number of patches does not coincide')
  endif
  
  ncounter = 0;
  for iptc = patch_list
      if (iptc ==5 || iptc ==6 || iptc ==7)
      [rs, cs, vs] = op_gradu_gradv_tp (space.sp_patch{iptc}, space.sp_patch{iptc}, msh.msh_patch{iptc}, @(x,y)ones(size(x)).*((mu0*muFe)^(-1)));
      
     elseif (iptc ==14 || iptc ==22)
      [rs, cs, vs] = op_gradu_gradv_tp (space.sp_patch{iptc}, space.sp_patch{iptc}, msh.msh_patch{iptc}, @(x,y)ones(size(x)).*((mu0*muCu)^(-1)));
      else 
      [rs, cs, vs] = op_gradu_gradv_tp (space.sp_patch{iptc}, space.sp_patch{iptc}, msh.msh_patch{iptc}, @(x,y)ones(size(x)).*(mu0^(-1)));
      endif
    rows(ncounter+(1:numel (rs))) = space.gnum{iptc}(rs);
    cols(ncounter+(1:numel (rs))) = space.gnum{iptc}(cs);

    if (~isempty (space.dofs_ornt))
      vs = space.dofs_ornt{iptc}(rs)' .* vs;
    endif
    if (~isempty (space.dofs_ornt))
      vs = vs .* space.dofs_ornt{iptc}(cs)';
    endif
    
    vals(ncounter+(1:numel (rs))) = vs;
    ncounter = ncounter + numel (rs);
  endfor

  stiff_mat = sparse (rows, cols, vals, space.ndof, space.ndof);
  clear rows cols vals rs cs vs

%%%% rhs

%%rhs = op_f_v_mp (space, msh, f);

if (nargin < 4)
    patch_list = 1:msh.npatch;
  endif

  if (space.npatch ~= msh.npatch)
    error ('op_f_v_mp: the number of patches does not coincide')
  endif
  
  rhs = zeros (space.ndof, 1);
  for iptc = patch_list
    if (iptc== 22)
    rhs_loc = op_f_v_tp (space.sp_patch{iptc}, msh.msh_patch{iptc}, @(x,y)(ones(size(x)).*(Je)));
    
   elseif (iptc== 14)  
    rhs_loc = op_f_v_tp (space.sp_patch{iptc}, msh.msh_patch{iptc}, @(x,y)(-ones(size(x)).*(Je)));
    else
     rhs_loc = op_f_v_tp (space.sp_patch{iptc}, msh.msh_patch{iptc}, @(x,y)zeros(size(x)));
    endif
    
    if (~isempty (space.dofs_ornt))
      rhs_loc = space.dofs_ornt{iptc}(:) .* rhs_loc(:);
    endif
    rhs(space.gnum{iptc}) = rhs(space.gnum{iptc}) + rhs_loc;
  endfor

% Apply Neumann boundary conditions -none
Nbnd = cumsum ([0, boundaries.nsides]);


% Apply Dirichlet boundary conditions
u = zeros (space.ndof, 1);
[u_drchlt, drchlt_dofs] = sp_drchlt_l2_proj (space, msh, h, drchlt_sides);
u(drchlt_dofs) = u_drchlt;

int_dofs = setdiff (1:space.ndof, drchlt_dofs);
rhs(int_dofs) = rhs(int_dofs) - stiff_mat(int_dofs, drchlt_dofs)*u_drchlt;

% Solve the linear system
u(int_dofs) = stiff_mat(int_dofs, int_dofs) \ rhs(int_dofs);


% 4) POST-PROCESSING
% EXPORT TO PARAVIEW
output_file = 'mane_bsp';
clf
hold on
sp_plot_solution (u, space, geometry, [10 10], [2 2])
%block
line ([0 7], [4 4], "linestyle", "-", "color", "w");
line ([0 7], [6 6], "linestyle", "-", "color", "w");
line ([0 0], [4 6], "linestyle", "-", "color", "w");
line ([7 7], [4 6], "linestyle", "-", "color", "w");
%coil -
line ([2.5 4.5], [7.5 7.5], "linestyle", "-", "color", "w");
line ([2.5 4.5], [8 8], "linestyle", "-", "color", "w");
line ([2.5 2.5], [7.5 8], "linestyle", "-", "color", "w");
line ([2.5 2.5], [7.5 8], "linestyle", "-", "color", "w");
%coil +
line ([2.5 4.5], [8.5 8.5], "linestyle", "-", "color", "w");
line ([2.5 4.5], [9 9], "linestyle", "-", "color", "w");
line ([2.5 2.5], [8.5 9], "linestyle", "-", "color", "w");
line ([2.5 2.5], [8.5 9], "linestyle", "-", "color", "w");
hold off