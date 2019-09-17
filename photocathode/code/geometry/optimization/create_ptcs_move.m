function [ptcs] = create_ptcs_move (ptcs, iptcs, ibnds, x, N_inc)
   for ii=1:length(iptcs)
      switch (iptcs(ii))
         case{6}
            bnds = nrbextract(ptcs(iptcs(ii)));
            for ictrl=1:(N_inc+1)
               ix = 2*ictrl-1;
               % modify adjacent edge as well to properly form patch
               if (ictrl==1)
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix) x(ix+1) 0], ictrl);
                  bnds(1)  = nrbmodp(bnds(1), [x(ix) x(ix+1) 0], ictrl);
               else
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix) x(ix+1) 0], ictrl);
               end
            end
         case{7}
            bnds = nrbextract(ptcs(iptcs(ii)));
            for ictrl=1:(N_inc+2)
               % boundary with 8
               if (ictrl==1)
                  ix = 2*N_inc+3;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [0 x(ix) 0], ictrl);
                  bnds(1)  = nrbmodp(bnds(1), [0 x(ix) 0], ictrl);
               elseif (ictrl>1 && ictrl<(N_inc+2))
                  ix1 = 2*N_inc+3;
                  ix2 = 2*ictrl-3;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix1+ix2) x(ix1+ix2+1) 0], ictrl);
               % boundary with 6
               elseif (ictrl==(N_inc+2))
                  ix = 1;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix) x(ix+1) 0], ictrl);
                  % vertical line, change first control point
                  bnds(2)  = nrbmodp(bnds(2), [x(ix) x(ix+1) 0], 1);
               end
            end
            % continue here
         case{8}
            bnds = nrbextract(ptcs(iptcs(ii)));
            for ictrl=1:(N_inc+2)
               % boundary with 9
               if (ictrl==1)
                  ix = 4*N_inc+4;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [0 x(ix) 0], ictrl);
                  bnds(1)  = nrbmodp(bnds(1), [0 x(ix) 0], 1);
                  % hier stimmt etwas nicht
               elseif (ictrl>1 && ictrl<(N_inc+2))
                  ix1 = 4*N_inc+4;
                  ix2 = 2*ictrl-3;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix1+ix2) x(ix1+ix2+1) 0], ictrl);
               % boundary with 7
               elseif (ictrl==(N_inc+2))
                  ix = 2*N_inc+3;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [0 x(ix) 0], ictrl);
                  bnds(2)         = nrbmodp(bnds(2), [0 x(ix) 0], 1);
               end
            end
         case{9}
            bnds = nrbextract(ptcs(iptcs(ii)));
            for ictrl=1:(N_inc+2)
               % boundary with 10/12
               if (ictrl==1)
                  ix = 6*N_inc+5;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix) x(ix+1) 0], ictrl);
                  bnds(1)  = nrbmodp(bnds(1), [x(ix) x(ix+1) 0], 1);
                  % account for patch 10
                  bnd_r    = nrbextract(ptcs(10));
                  bnd_r(2) = nrbmodp(bnd_r(2), [x(ix) x(ix+1) 0], 1);
               elseif (ictrl>1 && ictrl<(N_inc+2))
                  ix1 = 6*N_inc+5;
                  ix2 = 2*ictrl-2;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix1+ix2) x(ix1+ix2+1) 0], ictrl);
               % boundary with 8
               elseif(ictrl==(N_inc+2))
                  ix = 4*N_inc+4;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [0 x(ix) 0], ictrl);
                  bnds(2)         = nrbmodp(bnds(2), [0 x(ix) 0], 1);
               end
            end
         case{12}
            bnds = nrbextract(ptcs(iptcs(ii)));
            for ictrl=1:(N_inc+2)
               %boundary with 13
               if (ictrl==1)
                  ix = 8*N_inc+7;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix) x(ix+1) 0], ictrl);
                  bnds(3)  = nrbmodp(bnds(3), [x(ix) x(ix+1) 0], size(bnds(3).coefs,2));
               elseif (ictrl>1 && ictrl<(N_inc+2))
                  ix1 = 8*N_inc+7;
                  ix2 = 2*ictrl-2;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix1+ix2) x(ix1+ix2+1) 0], ictrl);
               % boundary with 9/10
               elseif (ictrl==(N_inc+2))
                  ix = 6*N_inc+5;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix) x(ix+1) 0], ictrl);
                  bnds(4)         = nrbmodp(bnds(4), [x(ix) x(ix+1) 0], size(bnds(4).coefs,2));
                  % account for patch 10
                  bnd_b    = nrbextract(ptcs(10));
                  bnd_b(3) = nrbmodp(bnd_b(3), [x(ix) x(ix+1) 0], size(bnd_b(3).coefs,2));
               end
            end
         case{13}
            bnds = nrbextract(ptcs(iptcs(ii)));
            for ictrl=2:(N_inc+2)
               if (ictrl>1 && ictrl<(N_inc+2))
                  ix1 = 10*N_inc+9;
                  ix2 = 2*ictrl-4;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix1+ix2) x(ix1+ix2+1) 0], ictrl);
               % boundary with 12
               elseif(ictrl==(N_inc+2))
                  ix = 8*N_inc+7;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix) x(ix+1) 0], ictrl);
                  bnds(4)  = nrbmodp(bnds(4), [x(ix) x(ix+1) 0], size(bnds(4).coefs,2));
               end
            end
         otherwise
            error('unknown patch index');
      end%switch
      ptcs(iptcs(ii)) = nrbcoons(bnds(3), bnds(4), bnds(1), bnds(2));
   end%for
   % account for patch 10
   ptcs(10) = nrbcoons(bnd_b(3), bnd_r(4), bnd_r(1), bnd_r(2));
end%function
