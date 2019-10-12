function [] = plot_bounds (lb, ub, filename, order)
   [geometry] = plot_ctrl_optim (filename);

   % 11
   bnds = nrbextract(geometry(11).nurbs);
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

   % 10
   bnds = nrbextract(geometry(10).nurbs);
   pts1  = bnds(1).coefs(1:2,:) ./ bnds(1).coefs(4,:);
   pts2  = bnds(2).coefs(1:2,:) ./ bnds(2).coefs(4,:);
   ioff = 2*order - 4;
   for ictrl=2:(order-1)
      ix = ioff + 2*ictrl - 3;
      hold on;
      plot([pts2(1,ictrl)+lb(ix) pts2(1,ictrl)], [pts2(2,ictrl) pts2(2,ictrl)], 'marker', '>', 'color', 'k');
      plot([pts2(1,ictrl) pts2(1,ictrl)+ub(ix)], [pts2(2,ictrl) pts2(2,ictrl)], 'marker', '<', 'color', 'k');
      plot([pts2(1,ictrl) pts2(1,ictrl)], [pts2(2,ictrl)+lb(ix+1) pts2(2,ictrl)], 'marker', '^', 'color', 'k');
      plot([pts2(1,ictrl) pts2(1,ictrl)], [pts2(2,ictrl) pts2(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   % 9
   bnds = nrbextract(geometry(9).nurbs);
   pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   ioff = 4*order - 8;
   if (order > 3)
      for ictrl=2:(order-2)
         ix = ioff + 2*ictrl - 3;
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

   % 8
   bnds = nrbextract(geometry(8).nurbs);
   pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   ioff = 6*order - 13;
   for ictrl=2:(order-1)
      ix   = ioff + ictrl - 1;
      hold on;
      plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
      plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   % 7
   bnds  = nrbextract(geometry(7).nurbs);
   pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   % hole
   ictrl  = 2;
   ioff   = 7*order - 15;
   ix     = ioff + ictrl - 1;
   hold on;
   plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
   plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix)], 'marker', 'v', 'color', 'k');
   hold off;
   if (order > 3)
      for ictrl=3:(order-1)
         ix   = ioff + 2*ictrl - 4;
         hold on;
         plot([pts3(1,ictrl)+lb(ix) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '>', 'color', 'k');
         plot([pts3(1,ictrl) pts3(1,ictrl)+ub(ix)], [pts3(2,ictrl) pts3(2,ictrl)], 'marker', '<', 'color', 'k');
         plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl)+lb(ix+1) pts3(2,ictrl)], 'marker', '^', 'color', 'k');
         plot([pts3(1,ictrl) pts3(1,ictrl)], [pts3(2,ictrl) pts3(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
         hold off;
      end
   end

   % 6
   bnds  = nrbextract(geometry(6).nurbs);
   pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   ioff = 9*order - 20;
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
