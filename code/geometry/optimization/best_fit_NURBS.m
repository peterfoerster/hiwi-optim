% pkg load geopdes;

order = 8;

if (order < 8)
    N_ctrl = order+2;
elseif (order >= 8)
    N_ctrl = order-3;
end

x_init = zeros(2*N_ctrl,1);



% To be replaced with the evaluation of the original geometry
% x component and y component

g_fun = @(x) x.^2 .* cos(pi*x);
h_fun = @(x) exp(x);

% Lifting to impose homogeneous bc
lg = @(x) (g_fun(1) - g_fun(0)) .* x + g_fun(0);
g = @(x) g_fun(x) - lg(x);

lh = @(x) (h_fun(1) - h_fun(0)) .* x + h_fun(0);
h = @(x) h_fun(x) - lh(x);

% Useless stuff, just to spare time and have reasonable weights (the ones of TESLA cavity)
ctrl = [3.50000000e-02, 1.46957616e-18, 0.00000000e+00, 1.00000000e+00;
 3.50000000e-02, 8.31958352e-03, 0.00000000e+00, 8.21810886e-01;
 4.73358209e-02, 1.12376464e-02, 0.00000000e+00, 1.00000000e+00;
 5.91520902e-02, 1.40328083e-02, 0.00000000e+00, 1.00000000e+00;
 7.09683595e-02, 1.68279702e-02, 0.00000000e+00, 1.00000000e+00;
 1.03300000e-01, 2.44760837e-02, 0.00000000e+00, 7.84282805e-01;
 1.03300000e-01, 5.77000000e-02, 0.00000000e+00, 1.00000000e+00;
 1.03300000e-01, 9.09239163e-02, 0.00000000e+00, 7.84282805e-01;
 7.09683595e-02, 9.85720298e-02, 0.00000000e+00, 1.00000000e+00;
 5.91520902e-02, 1.01367192e-01, 0.00000000e+00, 1.00000000e+00;
 4.73358209e-02, 1.04162354e-01, 0.00000000e+00, 1.00000000e+00;
 3.50000000e-02, 1.07080416e-01, 0.00000000e+00, 8.21810886e-01;
 3.50000000e-02, 1.15400000e-01, 0.00000000e+00, 1.00000000e+00];
ctrl = ctrl';  % 4 x nu
tmp = ctrl(1, :);
ctrl(1, :) = ctrl(2, :);
ctrl(2, :) = tmp;
ctrl(1:3, :) = ctrl(1:3, :) .* ctrl(4, :);

knts = [0., 0., 0., 0.16666667, 0.16666667, 0.33333333, 0.33333333, 0.5, 0.5, 0.66666667, 0.66666667, 0.83333333, 0.83333333, 1., 1., 1.];
weights = ctrl(4, :);
line = nrbmak(ctrl, knts);
% all the previous definition of the nurbs should be just useful to have the right space dimension... I think...

% Trivial geometry unit interval
geo = geo_load(nrbmak([0, 1], [0, 0, 1, 1]));
rule = msh_gauss_nodes(4);
[qn, qw] = msh_set_quad_nodes(knts, rule);
msh = msh_cartesian(knts, qn, qw, geo);

% Space definition
sp = sp_nurbs(line, msh);
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

line.coefs(1,:) = ux;
line.coefs(2,:) = uy;
line.coefs(4,:) = 1;
nrbctrlplot(line)
