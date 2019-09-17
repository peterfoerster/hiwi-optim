function [x, y] = compute_ctrl_coords (N_inc, ptcs)
   N_p = 6*N_inc+5;
   x = y = NaN(N_p,1);

   % determine coordinates of control points
   bnds = nrbextract(ptcs(6));
   for ictrl=1:(N_inc+1)
      x(ictrl) = bnds(3).coefs(1,ictrl) / bnds(3).coefs(4,ictrl);
      y(ictrl) = bnds(3).coefs(2,ictrl) / bnds(3).coefs(4,ictrl);
   end

   bnds = nrbextract(ptcs(7));
   for ictrl=1:(N_inc+1)
      ix = N_inc+1;
      x(ix+ictrl) = bnds(3).coefs(1,ictrl) / bnds(3).coefs(4,ictrl);
      y(ix+ictrl) = bnds(3).coefs(2,ictrl) / bnds(3).coefs(4,ictrl);
   end

   bnds = nrbextract(ptcs(8));
   for ictrl=1:(N_inc+1)
      ix = 2*N_inc+2;
      x(ix+ictrl) = bnds(3).coefs(1,ictrl) / bnds(3).coefs(4,ictrl);
      y(ix+ictrl) = bnds(3).coefs(2,ictrl) / bnds(3).coefs(4,ictrl);
   end

   bnds = nrbextract(ptcs(9));
   for ictrl=1:(N_inc+1)
      ix = 3*N_inc+3;
      x(ix+ictrl) = bnds(3).coefs(1,ictrl) / bnds(3).coefs(4,ictrl);
      y(ix+ictrl) = bnds(3).coefs(2,ictrl) / bnds(3).coefs(4,ictrl);
   end

   bnds = nrbextract(ptcs(12));
   for ictrl=1:(N_inc+1)
      ix = 4*N_inc+4;
      x(ix+ictrl) = bnds(2).coefs(1,ictrl) / bnds(2).coefs(4,ictrl);
      y(ix+ictrl) = bnds(2).coefs(2,ictrl) / bnds(2).coefs(4,ictrl);
   end

   bnds = nrbextract(ptcs(13));
   for ictrl=2:(N_inc+1)
      ix1 = 5*N_inc+5;
      ix2 = ictrl-1;
      x(ix1+ix2) = bnds(2).coefs(1,ictrl) / bnds(2).coefs(4,ictrl);
      y(ix1+ix2) = bnds(2).coefs(2,ictrl) / bnds(2).coefs(4,ictrl);
   end
end
