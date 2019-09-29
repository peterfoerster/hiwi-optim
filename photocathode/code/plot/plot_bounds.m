function [] = plot_bounds (lb, ub, filename, order)
   [geometry] = plot_ctrl_optim (filename);

   % 21
   bnds = nrbextract(geometry(21).nurbs);
   pts1  = bnds(1).coefs(1:2,:) ./ bnds(1).coefs(4,:);
   pts2  = bnds(2).coefs(1:2,:) ./ bnds(2).coefs(4,:);
   for ictrl=2:(order-1)
      ix = 2*ictrl - 3;
      hold on;
      plot([pts2(1,ictrl)+lb(ix) pts2(1,ictrl)], [pts2(2,ictrl) pts2(2,ictrl)], 'marker', '>', 'color', 'k');
      plot([pts2(1,ictrl) pts2(1,ictrl)+ub(ix)], [pts2(2,ictrl) pts2(2,ictrl)], 'marker', '<', 'color', 'k');
      plot([pts2(1,ictrl) pts2(1,ictrl)], [pts2(2,ictrl)+lb(ix+1) pts2(2,ictrl)], 'marker', '^', 'color', 'k');
      plot([pts2(1,ictrl) pts2(1,ictrl)], [pts2(2,ictrl) pts2(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   % 20
   bnds = nrbextract(geometry(20).nurbs);
   pts1  = bnds(1).coefs(1:2,:) ./ bnds(1).coefs(4,:);
   pts2  = bnds(2).coefs(1:2,:) ./ bnds(2).coefs(4,:);
   for ictrl=2:(order-1)
      ioff = 2*order - 4;
      ix = ioff + 2*ictrl - 3;
      hold on;
      plot([pts2(1,ictrl)+lb(ix) pts2(1,ictrl)], [pts2(2,ictrl) pts2(2,ictrl)], 'marker', '>', 'color', 'k');
      plot([pts2(1,ictrl) pts2(1,ictrl)+ub(ix)], [pts2(2,ictrl) pts2(2,ictrl)], 'marker', '<', 'color', 'k');
      plot([pts2(1,ictrl) pts2(1,ictrl)], [pts2(2,ictrl)+lb(ix+1) pts2(2,ictrl)], 'marker', '^', 'color', 'k');
      plot([pts2(1,ictrl) pts2(1,ictrl)], [pts2(2,ictrl) pts2(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   % 19
   bnds = nrbextract(geometry(19).nurbs);
   pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   for ictrl=2:(order-1)
      ioff = 4*order - 8;
      ix = ioff + 2*ictrl - 3;
      hold on;
      plot([pts3(1,ictrl)+lb(ix) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '>', 'color', 'k');
      plot([pts3(1,ictrl) pts3(1,ictrl)+ub(ix)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '<', 'color', 'k');
      plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix+1) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
      plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   % 18
   bnds = nrbextract(geometry(18).nurbs);
   pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   ioff = 6*order - 12;
   if (order > 3)
      for ictrl=2:(order-2)
         ix   = ioff + 2*ictrl - 3;
         hold on;
         plot([pts3(1,ictrl)+lb(ix) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '>', 'color', 'k');
         plot([pts3(1,ictrl) pts3(1,ictrl)+ub(ix)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '<', 'color', 'k');
         plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix+1) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
         plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
         hold off;
      end
   end
   % hole
   ictrl  = order-1;
   ix     = ioff + 2*ictrl - 3;
   hold on;
   plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
   plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix)], 'marker', 'v', 'color', 'k');
   hold off;

   % 17
   bnds  = nrbextract(geometry(17).nurbs);
   pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   for ictrl=2:(order-1)
      ioff = 8*order - 17;
      ix   = ioff + ictrl - 1;
      hold on;
      plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
      plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   % 16
   bnds  = nrbextract(geometry(16).nurbs);
   pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   % hole
   ictrl  = 2;
   ioff   = 9*order - 19;
   ix     = ioff + ictrl - 1;
   hold on;
   plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
   plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix)], 'marker', 'v', 'color', 'k');
   hold off;
   if (order > 3)
      for ictrl=3:(order-1)
         ix = ioff + 2*ictrl - 4;
         hold on;
         plot([pts3(1,ictrl)+lb(ix) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '>', 'color', 'k');
         plot([pts3(1,ictrl) pts3(1,ictrl)+ub(ix)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '<', 'color', 'k');
         plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix+1) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
         plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
         hold off;
      end
   end

   % 15
   bnds  = nrbextract(geometry(15).nurbs);
   pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   for ictrl=2:(order-1)
      ioff = 11*order - 24;
      ix   = ioff + 2*ictrl - 3;
      hold on;
      plot([pts3(1,ictrl)+lb(ix) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '>', 'color', 'k');
      plot([pts3(1,ictrl) pts3(1,ictrl)+ub(ix)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '<', 'color', 'k');
      plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix+1) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
      plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
      hold off;
   end
end
