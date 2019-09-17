function [lb, ub, ptcs] = compute_bounds (N_inc, N_ctrl, x)
   [ptcs] = compute_ptcs (N_inc, x);
   % compute bounds
   lb = ub = NaN(N_ctrl,1);

   % minimum y-value
   bnds  = nrbextract(ptcs(13));
   y_min = nrbeval(bnds(2), 0);
   y_min = y_min(2);

   % maximum y-value
   bnds  = nrbextract(ptcs(7));
   y_max = nrbeval(bnds(2), 1);
   y_max = y_max(2);

   % boundary of 6/7
   % x-component
   bnds  = nrbextract(ptcs(7));
   lb(1) = bnds(3).coefs(1,N_inc+1) / bnds(3).coefs(4,N_inc+1);
   bnds  = nrbextract(ptcs(6));
   ub(1) = bnds(3).coefs(1,2) / bnds(3).coefs(4,2);
   % y-component
   lb(2) = y_min;
   ub(2) = y_max;

   % patch 6
   bnds  = nrbextract(ptcs(6));
   for ictrl=2:(N_inc+1)
      ix = 2*ictrl-1;
      lb(ix)   = bnds(3).coefs(1,ictrl-1) / bnds(3).coefs(4,ictrl-1);
      ub(ix)   = bnds(3).coefs(1,ictrl+1) / bnds(3).coefs(4,ictrl+1);
      lb(ix+1) = y_min;
      ub(ix+1) = y_max;
   end

   % boundary of 7/8
   % y-component
   lb(2*N_inc+3) = y_min;
   ub(2*N_inc+3) = y_max;

   % patch 7
   bnds  = nrbextract(ptcs(7));
   for ictrl=2:(N_inc+1)
      ix1 = 2*N_inc+3;
      ix2 = 2*ictrl-3;
      lb(ix1+ix2)   = bnds(3).coefs(1,ictrl-1) / bnds(3).coefs(4,ictrl-1);
      ub(ix1+ix2)   = bnds(3).coefs(1,ictrl+1) / bnds(3).coefs(4,ictrl+1);
      lb(ix1+ix2+1) = y_min;
      ub(ix1+ix2+1) = y_max;
   end

   % boundary of 8/9
   % y-component
   lb(4*N_inc+4) = y_min;
   ub(4*N_inc+4) = y_max;

   % patch 8
   bnds  = nrbextract(ptcs(8));
   for ictrl=2:(N_inc+1)
      ix1 = 4*N_inc+4;
      ix2 = 2*ictrl-3;
      lb(ix1+ix2)   = bnds(3).coefs(1,ictrl-1) / bnds(3).coefs(4,ictrl-1);
      ub(ix1+ix2)   = bnds(3).coefs(1,ictrl+1) / bnds(3).coefs(4,ictrl+1);
      lb(ix1+ix2+1) = y_min;
      ub(ix1+ix2+1) = y_max;
   end

   % boundary of 9/12
   % x-component
   bnds          = nrbextract(ptcs(12));
   lb(6*N_inc+5) = bnds(2).coefs(1,N_inc+1) / bnds(2).coefs(4,N_inc+1);
   bnds          = nrbextract(ptcs(9));
   ub(6*N_inc+5) = bnds(3).coefs(1,2) / bnds(3).coefs(4,2);
   % y-component
   lb(6*N_inc+6) = y_min;
   ub(6*N_inc+6) = y_max;

   % patch 9
   bnds  = nrbextract(ptcs(9));
   for ictrl=2:(N_inc+1)
      ix1 = 6*N_inc+5;
      ix2 = 2*ictrl-2;
      lb(ix1+ix2)   = bnds(3).coefs(1,ictrl-1) / bnds(3).coefs(4,ictrl-1);
      ub(ix1+ix2)   = bnds(3).coefs(1,ictrl+1) / bnds(3).coefs(4,ictrl+1);
      lb(ix1+ix2+1) = y_min;
      ub(ix1+ix2+1) = y_max;
   end

   % boundary of 12/13
   % x-component
   bnds          = nrbextract(ptcs(13));
   lb(8*N_inc+7) = bnds(4).coefs(1,1) / bnds(4).coefs(4,1);
   bnds          = nrbextract(ptcs(12));
   ub(8*N_inc+7) = bnds(2).coefs(1,(N_inc+2)) / bnds(2).coefs(4,(N_inc+2));
   % y-component
   lb(8*N_inc+8) = bnds(2).coefs(2,(N_inc+1)) / bnds(2).coefs(4,(N_inc+1));
   bnds          = nrbextract(ptcs(12));
   ub(8*N_inc+8) = bnds(2).coefs(2,2) / bnds(2).coefs(4,2);

   % patch 12
   bnds  = nrbextract(ptcs(12));
   for ictrl=2:(N_inc+1)
      ix1 = 8*N_inc+7;
      ix2 = 2*ictrl-2;
      lb(ix1+ix2)   = bnds(1).coefs(1,1) / bnds(1).coefs(4,1);
      ub(ix1+ix2)   = bnds(2).coefs(1,(N_inc+2)) / bnds(2).coefs(4,(N_inc+2));

      if (ictrl==(N_inc+1))
         lb(ix1+ix2+1) = bnds(2).coefs(2,(ictrl-1)) / bnds(2).coefs(4,(ictrl-1));
         ub(ix1+ix2+1) = y_max;
      else
         lb(ix1+ix2+1) = bnds(2).coefs(2,(ictrl-1)) / bnds(2).coefs(4,(ictrl-1));
         ub(ix1+ix2+1) = bnds(2).coefs(2,(ictrl+1)) / bnds(2).coefs(4,(ictrl+1));
      end
   end

   % patch 13
   bnds  = nrbextract(ptcs(13));
   for ictrl=2:(N_inc+1)
      ix1 = 10*N_inc+9;
      ix2 = 2*ictrl-4;
      lb(ix1+ix2)   = bnds(4).coefs(1,1) / bnds(4).coefs(4,1);
      ub(ix1+ix2)   = bnds(3).coefs(1,end) / bnds(3).coefs(4,end);
      lb(ix1+ix2+1) = bnds(2).coefs(2,(ictrl-1)) / bnds(2).coefs(4,(ictrl-1));
      ub(ix1+ix2+1) = bnds(2).coefs(2,(ictrl+1)) / bnds(2).coefs(4,(ictrl+1));
   end
end
