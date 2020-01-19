clf;
% function [nrb_optim, knts] = create_nrb_optim (ptcs, order)#
   order = 3;
   anode_ring = create_anodering_v6();

   % bnds    = nrbextract(ptcs(5));
   % crv(5)  = bnds(1);
   % bnds    = nrbextract(ptcs(6));
   % crv(6)  = bnds(3);
   % bnds    = nrbextract(ptcs(7));
   % crv(7)  = nrbdegelev(bnds(3), 1);
   % bnds    = nrbextract(ptcs(8));
   % crv(8)  = bnds(3);
   % bnds    = nrbextract(ptcs(9));
   % crv(9)  = bnds(2);

   % elevate degree
   % if (order > 3)
      for icrv=4:11
         if (icrv~=5 && icrv~=8 && icrv~=9)
         hold on;
         anode_ring(icrv) = nrbdegelev(anode_ring(icrv), order-2);
         nrbctrlplot(anode_ring(icrv));
         hold off;
         end
      end
   % end

   % glue nurbs
   ctrl = [flip(anode_ring(11).coefs(:,2:order), 2) flip(anode_ring(10).coefs(:,2:order-1), 2) ...
           flip(anode_ring(9).coefs(:,2:order-1), 2) flip(anode_ring(8).coefs(:,2:order-1), 2) ...
           anode_ring(7).coefs(:,2:order-1) anode_ring(6).coefs(:,2:order-1) ...
           anode_ring(5).coefs(:,2:order-1), anode_ring(4).coefs(:,2:order)];
   pt(11) = 1/8;
   pt(10) = 2/8;
   pt(9)  = 3/8;
   pt(8)  = 4/8;
   pt(7)  = 5/8;
   pt(6)  = 6/8;
   pt(5)  = 7/8;
   knts = [zeros(1,order) repmat(pt(11), 1, order-2) repmat(pt(10), 1, order-2) repmat(pt(9), 1, order-2) ...
           repmat(pt(8), 1, order-2) repmat(pt(7), 1, order-2) repmat(pt(6), 1, order-2) ...
           repmat(pt(5), 1, order-2) ones(1,order)];
   nrb_optim = nrbmak(ctrl, knts);
% end

% only needed for precomputation once
% determine correct knts
for ii=1:512
   pt(11) = nrbinverse_mod(nrb_optim, nrbeval(anode_ring(11),0));
   pt(10) = nrbinverse_mod(nrb_optim, nrbeval(anode_ring(10),0));
   pt(9) = nrbinverse_mod(nrb_optim, nrbeval(anode_ring(9),0));
   pt(8) = nrbinverse_mod(nrb_optim, nrbeval(anode_ring(8),0));
   pt(7) = nrbinverse_mod(nrb_optim, nrbeval(anode_ring(7),1));
   pt(6) = nrbinverse_mod(nrb_optim, nrbeval(anode_ring(6),1));
   pt(5) = nrbinverse_mod(nrb_optim, nrbeval(anode_ring(5),1));
   knts_new = [zeros(1,order) repmat(pt(11), 1, order-2) repmat(pt(10), 1, order-2) repmat(pt(9), 1, order-2) ...
               repmat(pt(8), 1, order-2) repmat(pt(7), 1, order-2) repmat(pt(6), 1, order-2) ...
               repmat(pt(5), 1, order-2) ones(1,order)];
   err      = (knts(order+1:end-order)-knts_new(order+1:end-order))./knts_new(order+1:end-order);
   if (abs(err) < 1e-10)
      fprintf('%e\n', abs(err));
      fprintf('\nconverged in %d iterations\n', ii);
      break;
   end
   nrb_optim = nrbmak(ctrl, knts_new);
   knts      = knts_new;
end

hold on;
nrbctrlplot(nrb_optim)
hold off;
