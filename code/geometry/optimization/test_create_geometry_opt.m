% Create the geometry to be optimized (based on a continuous NURBS representation).
% <order = n_knts - n_ctrl> with <order = degree + 1> (p+1 knot spans support for degree=p)
% Curve is degree-n_mult (number of knot repetitions) times differentiable in any point.

% Elevate the degree of each individual curve beforehand to achieve larger number of DoFs while keeping the same ...
% degree.
% To achieve a NURBS of fixed order with lower continuity (and additional control points) simply repeat the ...
% already present knots.

% Perform knot insertion to achieve multiplicity equal to order for each knot. This does not change the shape of ...
% the curve, however it makes the NURBS only C^0 (interpolatory) in the knots which allows for the cutting into ...
% separate disjoint NURBS that each have the same order and maintain the same shape (and same continuity at the interfaces).

% Constrain the control points only if necessary.

order = 5;
filename = ['v6_opt_order=' num2str(order)];

N_ctrl = order+2;
x = zeros(2*N_ctrl,1);

tic;
create_geometry_opt (filename, x, order);
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
return
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
