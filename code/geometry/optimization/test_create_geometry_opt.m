% Create the geometry to be optimized (based on a continuous NURBS representation).
% Removing a knot in the middle and adding 2 at the ends of the knot vector, or adding a control point ...
% and adding two knots at the ends, to an otherwise unchanged NURBS increases the degree by 1 (formal).
% (Due to the TVD property (<=> approximation property?) this process keeps the higher order curves similar to the initial.)
% <order = n_knts - n_ctrl> with <order = degree + 1> (p+1 knot spans support for degree=p)
% Curve is order-n_mult times differentiable in any point.

% Then perform knot insertion to achieve multiplicity of order for each knot. This does not change the shape of ...
% the curve, however it makes the NURBS only C^0 (interpolatory) in the knots which allows for the cutting into ...
% seperate disjoint NURBS that each have the same order and maintain the same shape (and same continuity).

% To achieve a NURBS of fixed order with lower continuity simply repeat the already present knots.
% This also gives extra control points. Should these stay fixed and only the original ones shall be optimized further ...
% or should they be added to the DoFs as well?

% Control points can be moved past each other, also across the patch boundaries. This simply leads to undesirable ...
% geometries?

order = Inf;
continuity = order-1;
filename = ['v6_opt_order=' num2str(order)];


if (order == 3)
    N_ctrl = 5*1;
elseif (order == 4)
    N_ctrl = 2*1 + 1*2 + 2*1;
elseif (order == 5)
    N_ctrl = 2*1 + 1*3 + 2*1;
end
x = zeros(2*N_ctrl,1);

tic;
create_geometry_opt (filename, x, order, continuity);
fprintf('\ncreate_geometry_opt: %d s\n', toc);
return
geometry = mp_geo_load ([filename '.txt']);
for iptc=1:length(geometry)
    hold on;
    nrbkntplot(geometry(iptc).nurbs);
    xt = nrbeval(geometry(iptc).nurbs, {0.5,0.5});
    text(xt(1), xt(2), num2str(iptc));
    hold off;
end
shading interp;

figure;
geometry = mp_geo_load ('electrode_v6.txt');
for iptc=1:length(geometry)
    hold on;
    nrbkntplot(geometry(iptc).nurbs);
    xt = nrbeval(geometry(iptc).nurbs, {0.5,0.5});
    text(xt(1), xt(2), num2str(iptc));
    hold off;
end
shading interp;
