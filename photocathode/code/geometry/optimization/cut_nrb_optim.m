function [crv] = cut_nrb_optim (nrb_optim, order, knts)
   for ii=2:3
      nrb_optim = nrbkntins(nrb_optim, [knts(4:end-3)]);
   end

   knts     = [zeros(1,order) ones(1,order)];
   ctrl21   = nrb_optim.coefs(:,1:order);
   crv(21)  = nrbmak(ctrl21, knts);

   ctrl20   = nrb_optim.coefs(:,(order+1):(2*order));
   crv(20)  = nrbmak(ctrl20, knts);

   ctrl19   = nrb_optim.coefs(:,(2*order+1):(3*order));
   crv(19)  = nrbmak(ctrl19, knts);

   ctrl18   = nrb_optim.coefs(:,(3*order+1):(4*order));
   crv(18)  = nrbmak(ctrl18, knts);

   ctrl17   = nrb_optim.coefs(:,(4*order+1):(5*order));
   crv(17)  = nrbmak(ctrl17, knts);

   ctrl16   = nrb_optim.coefs(:,(5*order+1):(6*order));
   crv(16)  = nrbmak(ctrl16, knts);

   ctrl15   = nrb_optim.coefs(:,(6*order+1):(7*order));
   crv(15)  = nrbmak(ctrl15, knts);
end
