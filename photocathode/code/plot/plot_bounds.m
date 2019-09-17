function [] = plot_bounds (N_inc, x, y, lb, ub)
   for ictrl=1:(N_inc+1)
      ix = 2*ictrl-1;
      hold on;
      plot([lb(ix)+x(ictrl) x(ictrl)], [y(ictrl) y(ictrl)], 'marker', '>', 'color', 'k');
      plot([x(ictrl) ub(ix)+x(ictrl)], [y(ictrl) y(ictrl)], 'marker', '<', 'color', 'k');
      plot([x(ictrl) x(ictrl)], [lb(ix+1)+y(ictrl) y(ictrl)], 'marker', '^', 'color', 'k');
      plot([x(ictrl) x(ictrl)], [y(ictrl) ub(ix+1)+y(ictrl)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   % boundary 7/8
   ix    = 2*N_inc+3;
   ictrl = N_inc+2;
   hold on;
   plot([x(ictrl) x(ictrl)], [lb(ix)+y(ictrl) y(ictrl)], 'marker', '^', 'color', 'k');
   plot([x(ictrl) x(ictrl)], [y(ictrl) ub(ix)+y(ictrl)], 'marker', 'v', 'color', 'k');
   hold off;

   for ictrl=2:(N_inc+1)
      ic  = N_inc+1;
      ix1 = 2*N_inc+3;
      ix2 = 2*ictrl-3;
      hold on;
      plot([lb(ix1+ix2)+x(ic+ictrl) x(ic+ictrl)], [y(ic+ictrl) y(ic+ictrl)], 'marker', '>', 'color', 'k');
      plot([x(ic+ictrl) ub(ix1+ix2)+x(ic+ictrl)], [y(ic+ictrl) y(ic+ictrl)], 'marker', '<', 'color', 'k');
      plot([x(ic+ictrl) x(ic+ictrl)], [lb(ix1+ix2+1)+y(ic+ictrl) y(ic+ictrl)], 'marker', '^', 'color', 'k');
      plot([x(ic+ictrl) x(ic+ictrl)], [y(ic+ictrl) ub(ix1+ix2+1)+y(ic+ictrl)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   % boundary 8/9
   ix    = 4*N_inc+4;
   ictrl = 2*N_inc+3;
   hold on;
   plot([x(ictrl) x(ictrl)], [lb(ix)+y(ictrl) y(ictrl)], 'marker', '^', 'color', 'k');
   plot([x(ictrl) x(ictrl)], [y(ictrl) ub(ix)+y(ictrl)], 'marker', 'v', 'color', 'k');
   hold off;

   for ictrl=2:(N_inc+1)
      ic  = 2*N_inc+2;
      ix1 = 4*N_inc+4;
      ix2 = 2*ictrl-3;
      hold on;
      plot([lb(ix1+ix2)+x(ic+ictrl) x(ic+ictrl)], [y(ic+ictrl) y(ic+ictrl)], 'marker', '>', 'color', 'k');
      plot([x(ic+ictrl) ub(ix1+ix2)+x(ic+ictrl)], [y(ic+ictrl) y(ic+ictrl)], 'marker', '<', 'color', 'k');
      plot([x(ic+ictrl) x(ic+ictrl)], [lb(ix1+ix2+1)+y(ic+ictrl) y(ic+ictrl)], 'marker', '^', 'color', 'k');
      plot([x(ic+ictrl) x(ic+ictrl)], [y(ic+ictrl) ub(ix1+ix2+1)+y(ic+ictrl)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   for ictrl=1:(N_inc+1)
      ic  = 3*N_inc+3;
      ix1 = 6*N_inc+5;
      ix2 = 2*ictrl-2;
      hold on;
      plot([lb(ix1+ix2)+x(ic+ictrl) x(ic+ictrl)], [y(ic+ictrl) y(ic+ictrl)], 'marker', '>', 'color', 'k');
      plot([x(ic+ictrl) ub(ix1+ix2)+x(ic+ictrl)], [y(ic+ictrl) y(ic+ictrl)], 'marker', '<', 'color', 'k');
      plot([x(ic+ictrl) x(ic+ictrl)], [lb(ix1+ix2+1)+y(ic+ictrl) y(ic+ictrl)], 'marker', '^', 'color', 'k');
      plot([x(ic+ictrl) x(ic+ictrl)], [y(ic+ictrl) ub(ix1+ix2+1)+y(ic+ictrl)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   for ictrl=1:(N_inc+1)
      ic  = 4*N_inc+4;
      ix1 = 8*N_inc+7;
      ix2 = 2*ictrl-2;
      hold on;
      plot([lb(ix1+ix2)+x(ic+ictrl) x(ic+ictrl)], [y(ic+ictrl) y(ic+ictrl)], 'marker', '>', 'color', 'k');
      plot([x(ic+ictrl) ub(ix1+ix2)+x(ic+ictrl)], [y(ic+ictrl) y(ic+ictrl)], 'marker', '<', 'color', 'k');
      plot([x(ic+ictrl) x(ic+ictrl)], [lb(ix1+ix2+1)+y(ic+ictrl) y(ic+ictrl)], 'marker', '^', 'color', 'k');
      plot([x(ic+ictrl) x(ic+ictrl)], [y(ic+ictrl) ub(ix1+ix2+1)+y(ic+ictrl)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   for ictrl=2:(N_inc+1)
      ic  = 5*N_inc+4;
      ix1 = 10*N_inc+9;
      ix2 = 2*ictrl-4;
      hold on;
      plot([lb(ix1+ix2)+x(ic+ictrl) x(ic+ictrl)], [y(ic+ictrl) y(ic+ictrl)], 'marker', '>', 'color', 'k');
      plot([x(ic+ictrl) ub(ix1+ix2)+x(ic+ictrl)], [y(ic+ictrl) y(ic+ictrl)], 'marker', '<', 'color', 'k');
      plot([x(ic+ictrl) x(ic+ictrl)], [lb(ix1+ix2+1)+y(ic+ictrl) y(ic+ictrl)], 'marker', '^', 'color', 'k');
      plot([x(ic+ictrl) x(ic+ictrl)], [y(ic+ictrl) ub(ix1+ix2+1)+y(ic+ictrl)], 'marker', 'v', 'color', 'k');
      hold off;
   end
end
