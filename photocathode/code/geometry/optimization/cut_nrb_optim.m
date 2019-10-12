function [crv] = cut_nrb_optim (nrb_optim, order, knts)
   for ii=2:3
      nrb_optim = nrbkntins(nrb_optim, [knts(4:end-3)]);
   end

   knts     = [zeros(1,order) ones(1,order)];
   ctrl11   = nrb_optim.coefs(:,1:order);
   crv(11)  = nrbmak(ctrl11, knts);

   ctrl10   = nrb_optim.coefs(:,(order+1):(2*order));
   crv(10)  = nrbmak(ctrl10, knts);

   ctrl9   = nrb_optim.coefs(:,(2*order+1):(3*order));
   crv(9)  = nrbmak(ctrl9, knts);

   ctrl8   = nrb_optim.coefs(:,(3*order+1):(4*order));
   crv(8)  = nrbmak(ctrl8, knts);

   ctrl7   = nrb_optim.coefs(:,(4*order+1):(5*order));
   crv(7)  = nrbmak(ctrl7, knts);

   ctrl6   = nrb_optim.coefs(:,(5*order+1):(6*order));
   crv(6)  = nrbmak(ctrl6, knts);

   ctrl5   = nrb_optim.coefs(:,(6*order+1):(7*order));
   crv(5)  = nrbmak(ctrl5, knts);
end
