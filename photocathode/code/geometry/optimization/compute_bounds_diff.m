function [lb, ub] = compute_bounds_diff (N_inc, x, y, lb, ub)
   for ictrl=1:(N_inc+1)
      ix = 2*ictrl-1;
      lb(ix)   = lb(ix) - x(ictrl);
      ub(ix)   = ub(ix) - x(ictrl);
      lb(ix+1) = lb(ix+1) - y(ictrl);
      ub(ix+1) = ub(ix+1) - y(ictrl);
   end

   % boundary 7/8
   ix    = 2*N_inc+3;
   ictrl = N_inc+2;
   lb(ix) = lb(ix) - y(ictrl);
   ub(ix) = ub(ix) - y(ictrl);

   for ictrl=2:(N_inc+1)
      ic  = N_inc+1;
      ix1 = 2*N_inc+3;
      ix2 = 2*ictrl-3;
      lb(ix1+ix2)   = lb(ix1+ix2) - x(ic+ictrl);
      ub(ix1+ix2)   = ub(ix1+ix2) - x(ic+ictrl);
      lb(ix1+ix2+1) = lb(ix1+ix2+1) - y(ic+ictrl);
      ub(ix1+ix2+1) = ub(ix1+ix2+1) - y(ic+ictrl);
   end

   % boundary 8/9
   ix    = 4*N_inc+4;
   ictrl = 2*N_inc+3;
   lb(ix) = lb(ix) - y(ictrl);
   ub(ix) = ub(ix) - y(ictrl);

   for ictrl=2:(N_inc+1)
      ic  = 2*N_inc+2;
      ix1 = 4*N_inc+4;
      ix2 = 2*ictrl-3;
      lb(ix1+ix2)   = lb(ix1+ix2) - x(ic+ictrl);
      ub(ix1+ix2)   = ub(ix1+ix2) - x(ic+ictrl);
      lb(ix1+ix2+1) = lb(ix1+ix2+1) - y(ic+ictrl);
      ub(ix1+ix2+1) = ub(ix1+ix2+1) - y(ic+ictrl);
   end

   for ictrl=1:(N_inc+1)
      ic  = 3*N_inc+3;
      ix1 = 6*N_inc+5;
      ix2 = 2*ictrl-2;
      lb(ix1+ix2)   = lb(ix1+ix2) - x(ic+ictrl);
      ub(ix1+ix2)   = ub(ix1+ix2) - x(ic+ictrl);
      lb(ix1+ix2+1) = lb(ix1+ix2+1) - y(ic+ictrl);
      ub(ix1+ix2+1) = ub(ix1+ix2+1) - y(ic+ictrl);
   end

   for ictrl=1:(N_inc+1)
      ic  = 4*N_inc+4;
      ix1 = 8*N_inc+7;
      ix2 = 2*ictrl-2;
      lb(ix1+ix2)   = lb(ix1+ix2) - x(ic+ictrl);
      ub(ix1+ix2)   = ub(ix1+ix2) - x(ic+ictrl);
      lb(ix1+ix2+1) = lb(ix1+ix2+1) - y(ic+ictrl);
      ub(ix1+ix2+1) = ub(ix1+ix2+1) - y(ic+ictrl);
   end

   for ictrl=2:(N_inc+1)
      ic  = 5*N_inc+4;
      ix1 = 10*N_inc+9;
      ix2 = 2*ictrl-4;
      lb(ix1+ix2)   = lb(ix1+ix2) - x(ic+ictrl);
      ub(ix1+ix2)   = ub(ix1+ix2) - x(ic+ictrl);
      lb(ix1+ix2+1) = lb(ix1+ix2+1) - y(ic+ictrl);
      ub(ix1+ix2+1) = ub(ix1+ix2+1) - y(ic+ictrl);
   end
end
