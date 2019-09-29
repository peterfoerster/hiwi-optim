function [lb, ub] = compute_bounds (x, order, N_ctrl)
   geometry_file = ['photocathode_200kV_optim_order=' num2str(order)];
   create_photocathode_optim (geometry_file, x, order);
   [geometry] = mp_geo_load ([geometry_file '.txt']);

   lb = ub = NaN(N_ctrl,1);

   % minimum y-value
   bnds  = nrbextract(geometry(15).nurbs);
   y_min = nrbeval(bnds(3), 1);
   y_min = y_min(2);

   % maximum y-value
   bnds  = nrbextract(geometry(18).nurbs);
   y_max = nrbeval(bnds(1), 0.5);
   y_max = y_max(2);

   % 21
   bnds  = nrbextract(geometry(21).nurbs);
   pts1  = bnds(1).coefs(1:2,:) ./ bnds(1).coefs(4,:);
   pts2  = bnds(2).coefs(1:2,:) ./ bnds(2).coefs(4,:);
   for ictrl=2:(order-1)
      ix = 2*ictrl - 3;
      lb(ix)   = pts1(1,ictrl) - pts2(1,ictrl);
      ub(ix)   = pts2(1,1) - pts2(1,ictrl);
      lb(ix+1) = pts2(2,ictrl-1) - pts2(2,ictrl);
      ub(ix+1) = pts2(2,ictrl+1) - pts2(2,ictrl);
   end

   % 20
   bnds  = nrbextract(geometry(20).nurbs);
   pts1  = bnds(1).coefs(1:2,:) ./ bnds(1).coefs(4,:);
   pts2  = bnds(2).coefs(1:2,:) ./ bnds(2).coefs(4,:);
   % upper bound
   bnds = nrbextract(geometry(21).nurbs);
   pts3 = bnds(2).coefs(1:2,:) ./ bnds(2).coefs(4,:);
   for ictrl=2:(order-1)
      ioff = 2*order - 4;
      ix   = ioff + 2*ictrl - 3;
      lb(ix)   = pts1(1,ictrl) - pts2(1,ictrl);
      ub(ix)   = pts3(1,1) - pts2(1,ictrl);
      lb(ix+1) = pts2(2,ictrl-1) - pts2(2,ictrl);
      ub(ix+1) = pts2(2,ictrl+1) - pts2(2,ictrl);
   end

   % 19
   bnds  = nrbextract(geometry(19).nurbs);
   pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   for ictrl=2:(order-1)
      ioff = 4*order - 8;
      ix   = ioff + 2*ictrl - 3;
      lb(ix)   = pts3(1,ictrl-1) - pts3(1,ictrl);
      ub(ix)   = pts3(1,ictrl+1) - pts3(1,ictrl);
      lb(ix+1) = y_min - pts3(2,ictrl);
      ub(ix+1) = y_max - pts3(2,ictrl);
   end

   % 18
   bnds = nrbextract(geometry(18).nurbs);
   pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   ioff = 6*order - 12;
   if (order > 3)
      for ictrl=2:(order-2)
         ix   = ioff + 2*ictrl - 3;
         lb(ix)   = pts3(1,ictrl-1) - pts3(1,ictrl);
         ub(ix)   = pts3(1,ictrl+1) - pts3(1,ictrl);
         lb(ix+1) = y_min - pts3(2,ictrl);
         ub(ix+1) = y_max - pts3(2,ictrl);
      end
   end
   % hole
   ictrl  = order-1;
   ix     = ioff + 2*ictrl - 3;
   lb(ix) = y_min - pts3(2,ictrl);
   ub(ix) = y_max - pts3(2,ictrl);

   % 17
   bnds  = nrbextract(geometry(17).nurbs);
   pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   for ictrl=2:(order-1)
      ioff = 8*order - 17;
      ix   = ioff + ictrl - 1;
      lb(ix) = y_min - pts3(2,ictrl);
      ub(ix) = y_max - pts3(2,ictrl);
   end

   % 16
   bnds  = nrbextract(geometry(16).nurbs);
   pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   % hole
   ictrl  = 2;
   ioff   = 9*order - 19;
   ix     = ioff + ictrl - 1;
   lb(ix) = y_min - pts3(2,ictrl);
   ub(ix) = y_max - pts3(2,ictrl);
   if (order > 3)
      for ictrl=3:(order-1)
         ix = ioff + 2*ictrl - 4;
         lb(ix)   = pts3(1,ictrl-1) - pts3(1,ictrl);
         ub(ix)   = pts3(1,ictrl+1) - pts3(1,ictrl);
         lb(ix+1) = y_min - pts3(2,ictrl);
         ub(ix+1) = y_max - pts3(2,ictrl);
      end
   end

   % 15
   bnds  = nrbextract(geometry(15).nurbs);
   pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   for ictrl=2:(order-1)
      ioff = 11*order - 24;
      ix   = ioff + 2*ictrl - 3;
      lb(ix)   = pts3(1,ictrl-1) - pts3(1,ictrl);
      ub(ix)   = pts3(1,ictrl+1) - pts3(1,ictrl);
      lb(ix+1) = y_min - pts3(2,ictrl);
      ub(ix+1) = y_max - pts3(2,ictrl);
   end
end
