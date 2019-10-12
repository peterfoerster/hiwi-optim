function [lb, ub] = compute_bounds (x, order, N_ctrl)
   geometry_file = ['photocathode_200kV_optim_order=' num2str(order)];
   create_photocathode_optim (geometry_file, x, order);
   [geometry] = mp_geo_load ([geometry_file '.txt']);

   tol = 1e-4;
   lb = ub = NaN(N_ctrl,1);

   % minimum y-value
   bnds  = nrbextract(geometry(5).nurbs);
   y_min = nrbeval(bnds(1), 1);
   y_min = y_min(2);

   % maximum y-value
   bnds  = nrbextract(geometry(8).nurbs);
   y_max = nrbeval(bnds(1), 0.5);
   y_max = y_max(2);

   % 11
   bnds  = nrbextract(geometry(11).nurbs);
   pts1  = bnds(1).coefs(1:2,:) ./ bnds(1).coefs(4,:);
   pts2  = bnds(2).coefs(1:2,:) ./ bnds(2).coefs(4,:);
   for ictrl=2:(order-1)
      ix = 2*ictrl - 3;
      lb(ix)   = pts1(1,end) - pts2(1,ictrl) + tol;
      ub(ix)   = pts2(1,1) - pts2(1,ictrl) - tol;
      lb(ix+1) = pts2(2,1) - pts2(2,ictrl);
      ub(ix+1) = pts2(2,end) - pts2(2,ictrl) - tol;
   end

   % 10
   bnds  = nrbextract(geometry(10).nurbs);
   pts1  = bnds(1).coefs(1:2,:) ./ bnds(1).coefs(4,:);
   pts2  = bnds(2).coefs(1:2,:) ./ bnds(2).coefs(4,:);
   ioff = 2*order - 4;
   for ictrl=2:(order-1)
      ix   = ioff + 2*ictrl - 3;
      lb(ix)   = pts1(1,1) - pts2(1,ictrl) + tol;
      ub(ix)   = pts2(1,end) - pts2(1,ictrl) - tol;
      lb(ix+1) = pts2(2,1) - pts2(2,ictrl) + tol;
      ub(ix+1) = y_max - pts2(2,ictrl) - tol;
   end

   % 9
   bnds  = nrbextract(geometry(9).nurbs);
   pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   ioff = 4*order - 8;
   if (order > 3)
      for ictrl=2:(order-2)
         ix   = ioff + 2*ictrl - 3;
         lb(ix)   = pts3(1,1) - pts3(1,ictrl) + tol;
         ub(ix)   = pts3(1,end) - pts3(1,ictrl) - tol;
         lb(ix+1) = y_min - pts3(2,ictrl) + tol;
         ub(ix+1) = y_max - pts3(2,ictrl) - tol;
      end
   end
   % hole
   ictrl  = order-1;
   ix     = ioff + 2*ictrl - 3;
   lb(ix) = y_min - pts3(2,ictrl) + tol;
   ub(ix) = y_max - pts3(2,ictrl) - tol;

   % 18
   bnds = nrbextract(geometry(8).nurbs);
   pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   ioff = 6*order - 13;
   for ictrl=2:(order-1)
      ix   = ioff + ictrl - 1;
      lb(ix) = y_min - pts3(2,ictrl) + tol;
      ub(ix) = y_max - pts3(2,ictrl) - tol;
   end

   % 7
   bnds  = nrbextract(geometry(7).nurbs);
   pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   % hole
   ictrl  = 2;
   ioff   = 7*order - 15;
   ix     = ioff + ictrl - 1;
   lb(ix) = y_min - pts3(2,ictrl) + tol;
   ub(ix) = y_max - pts3(2,ictrl) - tol;
   if (order > 3)
      for ictrl=3:(order-1)
         ix   = ioff + 2*ictrl - 4;
         lb(ix)   = pts3(1,1) - pts3(1,ictrl) + tol;
         ub(ix)   = pts3(1,end) - pts3(1,ictrl) - tol;
         lb(ix+1) = y_min - pts3(2,ictrl) + tol;
         ub(ix+1) = y_max - pts3(2,ictrl) - tol;
      end
   end

   % 6
   bnds  = nrbextract(geometry(6).nurbs);
   pts3  = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   ioff = 9*order - 20;
   for ictrl=2:(order-1)
      ix = ioff + 2*ictrl - 3;
      lb(ix)   = pts3(1,1) - pts3(1,ictrl) + tol;
      ub(ix)   = pts3(1,end) - pts3(1,ictrl) - tol;
      lb(ix+1) = y_min - pts3(2,ictrl) + tol;
      ub(ix+1) = y_max - pts3(2,ictrl) - tol;
   end
end
