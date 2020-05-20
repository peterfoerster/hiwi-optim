function [] = plot_bounds (lb, ub, filename, order)
   geometry = mp_geo_load ([filename '.txt']);
   write_ctrl_opt (geometry);

   % 19
   bnds = nrbextract(geometry(19).nurbs);
   pts4 = bnds(4).coefs(1:2,:) ./ bnds(4).coefs(4,:);
   for ictrl=2:(order-1)
      ix = 2*ictrl - 3;
      hold on;
      plot([pts4(1,ictrl)+lb(ix) pts4(1,ictrl)], [pts4(2,ictrl) pts4(2,ictrl)], 'marker', '>', 'color', 'k');
      plot([pts4(1,ictrl) pts4(1,ictrl)+ub(ix)], [pts4(2,ictrl) pts4(2,ictrl)], 'marker', '<', 'color', 'k');
      plot([pts4(1,ictrl) pts4(1,ictrl)], [pts4(2,ictrl)+lb(ix+1) pts4(2,ictrl)], 'marker', '^', 'color', 'k');
      plot([pts4(1,ictrl) pts4(1,ictrl)], [pts4(2,ictrl) pts4(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   % 18
   bnds = nrbextract(geometry(18).nurbs);
   pts4 = bnds(4).coefs(1:2,:) ./ bnds(4).coefs(4,:);
   ioff = 2*order - 4;
   for ictrl=2:(order-1)
      ix = ioff + 2*ictrl - 3;
      hold on;
      plot([pts4(1,ictrl)+lb(ix) pts4(1,ictrl)], [pts4(2,ictrl) pts4(2,ictrl)], 'marker', '>', 'color', 'k');
      plot([pts4(1,ictrl) pts4(1,ictrl)+ub(ix)], [pts4(2,ictrl) pts4(2,ictrl)], 'marker', '<', 'color', 'k');
      plot([pts4(1,ictrl) pts4(1,ictrl)], [pts4(2,ictrl)+lb(ix+1) pts4(2,ictrl)], 'marker', '^', 'color', 'k');
      plot([pts4(1,ictrl) pts4(1,ictrl)], [pts4(2,ictrl) pts4(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   % 17
   bnds = nrbextract(geometry(17).nurbs);
   pts1 = bnds(1).coefs(1:2,:) ./ bnds(1).coefs(4,:);
   ioff = 4*order - 8;
   for ictrl=2:(order-1)
      ix = ioff + 2*ictrl - 3;
      hold on;
      plot([pts1(1,ictrl)+lb(ix) pts1(1,ictrl)], [pts1(2,ictrl) pts1(2,ictrl)], 'marker', '>', 'color', 'k');
      plot([pts1(1,ictrl) pts1(1,ictrl)+ub(ix)], [pts1(2,ictrl) pts1(2,ictrl)], 'marker', '<', 'color', 'k');
      plot([pts1(1,ictrl) pts1(1,ictrl)], [pts1(2,ictrl)+lb(ix+1) pts1(2,ictrl)], 'marker', '^', 'color', 'k');
      plot([pts1(1,ictrl) pts1(1,ictrl)], [pts1(2,ictrl) pts1(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   % 16
   bnds = nrbextract(geometry(16).nurbs);
   pts1 = bnds(1).coefs(1:2,:) ./ bnds(1).coefs(4,:);
   ioff = 6*order - 12;
   for ictrl=2:(order-1)
      ix = ioff + 2*ictrl - 3;
      hold on;
      plot([pts1(1,ictrl)+lb(ix) pts1(1,ictrl)], [pts1(2,ictrl) pts1(2,ictrl)], 'marker', '>', 'color', 'k');
      plot([pts1(1,ictrl) pts1(1,ictrl)+ub(ix)], [pts1(2,ictrl) pts1(2,ictrl)], 'marker', '<', 'color', 'k');
      plot([pts1(1,ictrl) pts1(1,ictrl)], [pts1(2,ictrl)+lb(ix+1) pts1(2,ictrl)], 'marker', '^', 'color', 'k');
      plot([pts1(1,ictrl) pts1(1,ictrl)], [pts1(2,ictrl) pts1(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   % 15
   bnds  = nrbextract(geometry(15).nurbs);
   pts1  = bnds(1).coefs(1:2,:) ./ bnds(1).coefs(4,:);
   ioff = 8*order - 16;
   for ictrl=2:(order-1)
      ix = ioff + 2*ictrl - 3;
      hold on;
      plot([pts1(1,ictrl)+lb(ix) pts1(1,ictrl)], [pts1(2,ictrl) pts1(2,ictrl)], 'marker', '>', 'color', 'k');
      plot([pts1(1,ictrl) pts1(1,ictrl)+ub(ix)], [pts1(2,ictrl) pts1(2,ictrl)], 'marker', '<', 'color', 'k');
      plot([pts1(1,ictrl) pts1(1,ictrl)], [pts1(2,ictrl)+lb(ix+1) pts1(2,ictrl)], 'marker', '^', 'color', 'k');
      plot([pts1(1,ictrl) pts1(1,ictrl)], [pts1(2,ictrl) pts1(2,ictrl)+ub(ix+1)], 'marker', 'v', 'color', 'k');
      hold off;
   end

   % 14
   bnds  = nrbextract(geometry(14).nurbs);
   pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   ioff = 10*order - 20;
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
