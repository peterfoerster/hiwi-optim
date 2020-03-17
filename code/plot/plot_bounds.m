function [] = plot_bounds (lb, ub, filename, order)
   [geometry] = plot_ctrl_optim (filename);

   % 9
   bnds = nrbextract(geometry(9).nurbs);
   pts2 = bnds(2).coefs(1:2,:) ./ bnds(2).coefs(4,:);
   for ictrl=2:(order-1)
      ix = 2*ictrl - 3;
      hold on;
      plot([pts2(1,ictrl)+lb(ix) pts2(1,ictrl)], [pts2(2,ictrl) pts2(2,ictrl)], 'marker', '>', 'color', 'k');
      plot([pts2(1,ictrl) pts2(1,ictrl)+ub(ix)], [pts2(2,ictrl) pts2(2,ictrl)], 'marker', '<', 'color', 'k');
      plot([pts2(1,ictrl) pts2(1,ictrl)], [pts2(2,ictrl)+lb(ix+1) pts2(2,ictrl)], 'marker', '^', 'color', 'k');
      plot([pts2(1,ictrl) pts2(1,ictrl)], [pts2(2,ictrl) pts2(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   % 8
   bnds = nrbextract(geometry(8).nurbs);
   pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   ioff = 2*order - 4;
   for ictrl=2:(order-1)
      ix = ioff + 2*ictrl - 3;
      hold on;
      plot([pts3(1,ictrl)+lb(ix) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '>', 'color', 'k');
      plot([pts3(1,ictrl) pts3(1,ictrl)+ub(ix)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '<', 'color', 'k');
      plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix+1) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
      plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   % 7
   bnds = nrbextract(geometry(7).nurbs);
   pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   ioff = 4*order - 8;
   for ictrl=2:(order-1)
      ix = ioff + 2*ictrl - 3;
      hold on;
      plot([pts3(1,ictrl)+lb(ix) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '>', 'color', 'k');
      plot([pts3(1,ictrl) pts3(1,ictrl)+ub(ix)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '<', 'color', 'k');
      plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix+1) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
      plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   % 6
   bnds  = nrbextract(geometry(6).nurbs);
   pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   ioff = 6*order - 12;
   for ictrl=2:(order-1)
      ix = ioff + 2*ictrl - 3;
      hold on;
      plot([pts3(1,ictrl)+lb(ix) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '>', 'color', 'k');
      plot([pts3(1,ictrl) pts3(1,ictrl)+ub(ix)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '<', 'color', 'k');
      plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix+1) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
      plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
      hold off;
   end
end
