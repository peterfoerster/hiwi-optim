function [ctrl_diff_lb, ctrl_diff_ub] = compute_ctrl_constraint(geometry, ctrl_diff_lb, ctrl_diff_ub, order)
   tol = 1e-6;

   % 11
   bnds = nrbextract(geometry(11).nurbs);
   pts1 = bnds(1).coefs(1:2,:) ./ bnds(1).coefs(4,:);
   pts2 = bnds(2).coefs(1:2,:) ./ bnds(2).coefs(4,:);
   for ictrl=2:(order-1)
      ix = 2*ictrl - 3;
      % check left
      y = pts2(2,ictrl);
      x_min = compute_linev(y, bnds(1));
      ctrl_diff_lb(ix)   = pts2(1,ictrl) - (x_min + tol);
      % right given by bounds
      ctrl_diff_ub(ix)   = NaN;
      % check bottom -> enforce correct order
      if (ictrl>2)
         ctrl_diff_lb(ix+1) = pts2(2,ictrl) - (pts2(2,ictrl-1) + tol);
      elseif (ictrl==2)
         ctrl_diff_lb(ix+1) = NaN;
      end
      % check top -> enforce correct order
      ctrl_diff_ub(ix+1) = (pts2(2,ictrl+1) - tol) - pts2(2,ictrl);
   end

   % 10
   bnds = nrbextract(geometry(10).nurbs);
   pts1 = bnds(1).coefs(1:2,:) ./ bnds(1).coefs(4,:);
   pts2 = bnds(2).coefs(1:2,:) ./ bnds(2).coefs(4,:);
   ioff = 2*order - 4;
   for ictrl=2:(order-1)
      ix = ioff + 2*ictrl - 3;
      % check left
      y = pts2(2,ictrl);
      x_min = compute_linev(y, bnds(1));
      ctrl_diff_lb(ix)   = pts2(1,ictrl) - (x_min + tol);
      % check right -> enforce correct order
      ctrl_diff_ub(ix)   = (pts2(1,ictrl+1) - tol) - pts2(1,ictrl);
      % check bottom
      x = pts2(1,ictrl);
      y_min = compute_lineu(x, bnds(3));
      if (x<=pts2(1,1))
         ctrl_diff_lb(ix+1) = pts2(2,ictrl) - (y_min + tol);
      else
         ctrl_diff_lb(ix+1) = NaN;
      end
      % check top
      x = pts2(1,ictrl);
      y_max = compute_lineu(x, bnds(1));
      ctrl_diff_ub(ix+1) = (y_max - tol) - pts2(2,ictrl);
   end

   % 9
   bnds = nrbextract(geometry(9).nurbs);
   pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   ioff = 4*order - 8;
   if (order > 3)
      for ictrl=2:(order-2)
         ix = ioff + 2*ictrl - 3;
         % left/right -> enforce correct order
         ctrl_diff_lb(ix)   = pts3(1,ictrl) - (pts3(1,ictrl-1) + tol);
         ctrl_diff_ub(ix)   = (pts3(1,ictrl+1) - tol) - pts3(1,ictrl);
         % bottom/top given by bounds
         ctrl_diff_lb(ix+1) = NaN;
         ctrl_diff_ub(ix+1) = NaN;
      end
   end
   % hole
   ictrl  = order-1;
   ix     = ioff + 2*ictrl - 3;
   % bottom/top given by bounds
   ctrl_diff_lb(ix) = NaN;
   ctrl_diff_ub(ix) = NaN;

   % 8
   bnds = nrbextract(geometry(8).nurbs);
   pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   ioff = 6*order - 13;
   for ictrl=2:(order-1)
      ix = ioff + ictrl - 1;
      % bottom/top given by bounds
      ctrl_diff_lb(ix) = NaN;
      ctrl_diff_ub(ix) = NaN;
   end

   % 7
   bnds = nrbextract(geometry(7).nurbs);
   pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   % hole
   ictrl  = 2;
   ioff   = 7*order - 15;
   ix     = ioff + ictrl - 1;
   % bottom/top given by bounds
   ctrl_diff_lb(ix) = NaN;
   ctrl_diff_ub(ix) = NaN;
   if (order > 3)
      for ictrl=3:(order-1)
         ix = ioff + 2*ictrl - 4;
         % left/right -> enforce correct order
         ctrl_diff_lb(ix)   = pts3(1,ictrl) - (pts3(1,ictrl-1) + tol);
         ctrl_diff_ub(ix)   = (pts3(1,ictrl+1) - tol) - pts3(1,ictrl);
         % bottom/top given by bounds
         ctrl_diff_lb(ix+1) = NaN;
         ctrl_diff_ub(ix+1) = NaN;
      end
   end

   % 6
   bnds = nrbextract(geometry(6).nurbs);
   pts2 = bnds(2).coefs(1:2,:) ./ bnds(2).coefs(4,:);
   pts3 = bnds(3).coefs(1:2,:) ./ bnds(3).coefs(4,:);
   ioff = 9*order - 20;
   for ictrl=2:(order-1)
      ix = ioff + 2*ictrl - 3;
      % check left -> enforce correct order
      ctrl_diff_lb(ix)   = pts3(1,ictrl) - (pts3(1,ictrl-1) + tol);
      % check right
      y = pts3(2,ictrl);
      x_max = compute_linev(y, bnds(2));
      ctrl_diff_ub(ix)   = (x_max - tol) - pts3(1,ictrl);
      % check bottom
      x = pts3(1,ictrl);
      y_min = compute_lineu(x, bnds(2));
      if (x>=pts3(1,end))
         ctrl_diff_lb(ix+1) = pts3(2,ictrl) - (y_min + tol);
      else
         ctrl_diff_lb(ix+1) = NaN;
      end
      % top given by bounds
      ctrl_diff_ub(ix+1) = NaN;
   end
end
