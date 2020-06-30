% Fit the initial NURBS to the original curve.
order = 8;

N_ctrl = order-3;
x_init = zeros(2*N_ctrl,1);

% determine initial shape by hand
[nrb_opt, ~, ~, ~, nrb_orig] = create_nrb_opt_electrode (order);

% nrb_opt = nrbkntins(nrb_opt, repmat([1:5]/6, 1, 2));

% changed op_f_v_tp
g_fun = @(x) nrbeval(nrb_orig, x)(1,:)';
h_fun = @(x) nrbeval(nrb_orig, x)(2,:)';

% Lifting to impose homogeneous bc (understand!)
lg = @(x) (g_fun(1) - g_fun(0)) .* x + g_fun(0);
g  = @(x) g_fun(x) - lg(x);
lh = @(x) (h_fun(1) - h_fun(0)) .* x + h_fun(0);
h = @(x) h_fun(x) - lh(x);

% Trivial geometry unit interval
geo = geo_load(nrbmak([0, 1], [0 0 1 1]));
rule = msh_gauss_nodes(9);
[qn, qw] = msh_set_quad_nodes(nrb_opt.knots, rule);
msh = msh_cartesian(nrb_opt.knots, qn, qw, geo);

% Space definition
sp = sp_nurbs(nrb_opt, msh);
mat = op_u_v_tp(sp, sp, msh);
rhs = op_f_v_tp(sp, msh, @(x) g(x));
idofs = (2:sp.ndof-1);
ux = zeros(sp.ndof, 1);
% L2 projection for the x component
ux(idofs) = mat(idofs, idofs) \ rhs(idofs);

% reapply the lifting
lift_x = mat \ op_f_v_tp(sp, msh, @(x) lg(x));
ux = ux + lift_x;

rhs2 = op_f_v_tp(sp, msh, @(x) h(x));
uy = zeros(sp.ndof, 1);
% L2 projection for the y component
uy(idofs) = mat(idofs, idofs) \ rhs2(idofs);

% reapply the lifting
lift_y = mat \ op_f_v_tp(sp, msh, @(x) lh(x));
uy = uy + lift_y;

% plot
xx = linspace(0, 1, 101);
figure();
plot(g_fun(xx), h_fun(xx), '--')

hold on
valsx = sp_eval(ux, sp, geo, {xx});
valsy = sp_eval(uy, sp, geo, {xx});
plot(valsx, valsy)

nrb_opt.coefs(1,:) = ux;
nrb_opt.coefs(2,:) = uy;
nrbctrlplot(nrb_opt)

% repmat([1:5]/6, 1, 2)
% [crv, t] = crvkntremove(nrb_opt, 1/6, 8+1, 2, 1, 1e-4)
