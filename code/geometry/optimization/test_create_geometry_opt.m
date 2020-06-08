% Create the geometry to be optimized (based on a continuous NURBS representation).
% Removing a knot or adding a control point increases the degree by 1 (formal).
order = 5;
filename = ['v6_opt_order=' num2str(order)];


if (order == 3)
    N_ctrl = 6*1;
elseif (order == 4)
    N_ctrl = 2*1 + 1*2 + 2*1;
elseif (order == 5)
    N_ctrl = 2*1 + 1*3 + 2*1;
end
x = zeros(2*N_ctrl,1);

tic;
create_geometry_opt (filename, x, order);
fprintf('\ncreate_geometry_opt: %d s\n', toc);
return
geometry = mp_geo_load ([filename '.txt']);
for iptc=1:length(geometry)
    hold on;
    nrbkntplot(geometry(iptc).nurbs, [8 8]);
    xt = nrbeval(geometry(iptc).nurbs, {0.5,0.5});
    text(xt(1), xt(2), num2str(iptc));
    hold off;
end
shading interp;

figure;
geometry = mp_geo_load ('electrode_v6.txt');
for iptc=1:length(geometry)
    hold on;
    nrbkntplot(geometry(iptc).nurbs, [8 8]);
    xt = nrbeval(geometry(iptc).nurbs, {0.5,0.5});
    text(xt(1), xt(2), num2str(iptc));
    hold off;
end
shading interp;
