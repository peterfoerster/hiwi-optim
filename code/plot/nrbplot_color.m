% INPUT:
%       - color
%       - width
%       - nurbs
%       - nsub

function nrbplot_color (color, width, nurbs, nsub)
    nsub  = nsub+1;
    order = nurbs.order;
    pts   = nrbeval (nurbs, linspace(nurbs.knots(order), nurbs.knots(end-order+1), nsub));
    plot (pts(1,:), pts(2,:), 'color', color, 'linewidth', width);
    axis equal;
end
