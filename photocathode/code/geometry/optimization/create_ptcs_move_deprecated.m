function [ptcs] = create_ptcs_move (ptcs, iptcs, ibnds, x, N_inc)
   for ii=1:length(iptcs)
      switch (iptcs(ii))
         case{6}
            bnds = nrbextract(ptcs(iptcs(ii)));
            % move control points individually
            for ictrl=2:(N_inc+2)
               ix = 2*ictrl-3;
               bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix) x(ix+1) 0], ictrl);
            end
         case{7}
            bnds = nrbextract(ptcs(iptcs(ii)));
            for ictrl=1:(N_inc+2)
               if (ictrl<(N_inc+2))
                  ix1 = N_inc+2;
                  ix2 = 2*ictrl-2;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix1+ix2) x(ix1+ix2+1) 0], ictrl);
               % boundary with 8
               elseif (ictrl==(N_inc+2))
                  ix1 = N_inc+2;
                  ix2 = 2*ictrl-2;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [0 x(ix1+ix2) 0], ictrl);
               end
            end
         case{8}
            bnds = nrbextract(ptcs(iptcs(ii)));
            for ictrl=1:(N_inc+2)
               if (ictrl==1)
                  ix = 2*(N_inc+2)+2*N_inc-1;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [0 x(ix) 0], ictrl);
               elseif (ictrl>1 && ictrl<(N_inc+2))
                  ix1 = 2*(N_inc+2)+2*N_inc-1;
                  ix2 = 2*ictrl-3;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix1+ix2) x(ix1+ix2+1) 0], ictrl);
                  % boundary with 8
               elseif (ictrl==(N_inc+2))
                  ix = 2*(N_inc+2)+4*N_inc;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [0 x(ix) 0], ictrl);
               end
            end
         case{9}
            bnds = nrbextract(ptcs(iptcs(ii)));
            for ictrl=1:(N_inc+2)
               % boundary with 8
               if (ictrl==1)
                  ix = 2*(N_inc+2)+4*N_inc;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [0 x(ix) 0], ictrl);
               elseif (ictrl>1)
                  ix1 = 2*(N_inc+2)+4*N_inc;
                  ix2 = 2*ictrl-3;
                  bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix1+ix2) x(ix1+ix2+1) 0], ictrl);
               end
            end
         case{12}
            bnds = nrbextract(ptcs(iptcs(ii)));
            for ictrl=1:(N_inc+2)
               ix1 = 2*(N_inc+2)+6*N_inc+1;
               ix2 = 2*ictrl-2;
               bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix1+ix2) x(ix1+ix2+1) 0], ictrl);
            end
         case{13}
            bnds = nrbextract(ptcs(iptcs(ii)));
            for ictrl=1:(N_inc+1)
               ix1 = 2*(N_inc+2)+8*N_inc+3;
               ix2 = 2*ictrl-2;
               bnds(ibnds(ii)) = nrbmodp(bnds(ibnds(ii)), [x(ix1+ix2) x(ix1+ix2+1) 0], ictrl);
            end
         otherwise
            error('unknown patch index');
      end%switch
      ptcs(iptcs(ii)) = nrbcoons(bnds(3), bnds(4), bnds(1), bnds(2));
   end%for
end%function
