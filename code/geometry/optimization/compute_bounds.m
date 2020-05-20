function [lb, ub] = compute_bounds (x, order, N_ctrl)
   geometry_file = ['v6_opt_order=' num2str(order)];
   create_geometry_opt (geometry_file, x, order);
   [geometry] = mp_geo_load ([geometry_file '.txt']);

   tol = 1e-4;
   lb = ub = NaN(N_ctrl,1);

   % minimum y-value
   bnds  = nrbextract(geometry(14).nurbs);
   y_min = nrbeval(bnds(3), 1);
   y_min = y_min(2);

   % maximum y-value
   bnds  = nrbextract(geometry(15).nurbs);
   y_max = nrbeval(bnds(3), 0.5);
   y_max = y_max(2);

   % minimum x-value
   bnds  = nrbextract(geometry(15).nurbs);
   x_min = nrbeval(bnds(1), 0);
   x_min = x_min(1);

   % 19
   bnds = nrbextract(geometry(19).nurbs);
   pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   pts4 = bnds(4).coefs(1:2,:) ./ bnds(4).coefs(4,:);
   for ictrl=2:(order-1)
      ix = 2*ictrl - 3;
      lb(ix) = (pts3(1,end) + tol) - pts4(1,ictrl);
      ub(ix) = (pts4(1,1) - tol) - pts4(1,ictrl);
      if (ictrl>2)
         lb(ix+1) = (pts4(2,1) + tol) - pts4(2,ictrl);
      elseif (ictrl==2)
         lb(ix+1) = 0;
      end
      ub(ix+1) = (pts4(2,end) - tol) - pts4(2,ictrl);
   end

   % 18
   bnds = nrbextract(geometry(18).nurbs);
   pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   pts4 = bnds(4).coefs(1:2,:) ./ bnds(4).coefs(4,:);
   ioff = 2*order - 4;
   for ictrl=2:(order-1)
      ix = ioff + 2*ictrl - 3;
      lb(ix)   = (pts3(1,1) + tol) - pts4(1,ictrl);
      ub(ix)   = (pts4(1,end) - tol) - pts4(1,ictrl);
      lb(ix+1) = (pts4(2,1) + tol) - pts4(2,ictrl);
      ub(ix+1) = (y_max - tol) - pts4(2,ictrl);
   end

   % 17
   bnds = nrbextract(geometry(17).nurbs);
   pts1 = bnds(1).coefs(1:2,:) ./ bnds(1).coefs(4,:);
   ioff = 4*order - 8;
   for ictrl=2:(order-1)
      ix = ioff + 2*ictrl - 3;
      lb(ix)   = (pts1(1,1) + tol) - pts1(1,ictrl);
      ub(ix)   = (pts1(1,end) - tol) - pts1(1,ictrl);
      lb(ix+1) = (y_min + tol) - pts1(2,ictrl);
      ub(ix+1) = (y_max - tol) - pts1(2,ictrl);
   end

   % 16
   bnds = nrbextract(geometry(16).nurbs);
   pts1 = bnds(1).coefs(1:2,:) ./ bnds(1).coefs(4,:);
   ioff = 6*order - 12;
   for ictrl=2:(order-1)
      ix = ioff + 2*ictrl - 3;
      lb(ix)   = (pts1(1,1) + tol) - pts1(1,ictrl);
      ub(ix)   = (pts1(1,end) - tol) - pts1(1,ictrl);
      lb(ix+1) = (y_min + tol) - pts1(2,ictrl);
      ub(ix+1) = (y_max - tol) - pts1(2,ictrl);
   end

   % 15
   bnds = nrbextract(geometry(15).nurbs);
   pts1 = bnds(1).coefs(1:2,:) ./ bnds(1).coefs(4,:);
   pts2 = bnds(2).coefs(1:2,:) ./ bnds(2).coefs(4,:);
   ioff = 8*order - 16;
   for ictrl=2:(order-1)
      ix = ioff + 2*ictrl - 3;
      lb(ix)   = (pts1(1,1) + tol) - pts1(1,ictrl);
      ub(ix)   = (pts2(1,end) - tol) - pts1(1,ictrl);
      lb(ix+1) = (y_min + tol) - pts1(2,ictrl);
      ub(ix+1) = (y_max - tol) - pts1(2,ictrl);
   end

   % 14
   bnds = nrbextract(geometry(14).nurbs);
   pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   pts4 = bnds(4).coefs(1:2,:) ./ bnds(4).coefs(4,:);
   ioff = 10*order - 20;
   for ictrl=2:(order-1)
      ix = ioff + 2*ictrl - 3;
      lb(ix)   = (x_min + tol) - pts3(1,ictrl);
      ub(ix)   = (pts4(1,end) - tol) - pts3(1,ictrl);
      lb(ix+1) = (pts3(2,1) + tol) - pts3(2,ictrl);
      ub(ix+1) = (y_max - tol) - pts3(2,ictrl);
   end
end
