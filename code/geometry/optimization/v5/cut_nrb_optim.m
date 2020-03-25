function [crv] = cut_nrb_optim (nrb_optim, order, knts)
   for ii=2:3
      nrb_optim = nrbkntins(nrb_optim, [unique(knts(order+1:end-order))]);
   end
   knts = [zeros(1,order) ones(1,order)];

   ctrl9        = nrb_optim.coefs(:,1:order);
   ctrl9(:,1)   = ctrl9(:,1)/ctrl9(4,1);
   ctrl9(:,end) = ctrl9(:,end)/ctrl9(4,end);
   crv(9) = nrbmak(ctrl9, knts);

   ctrl8        = nrb_optim.coefs(:,(order+1):(2*order));
   ctrl8(:,1)   = ctrl8(:,1)/ctrl8(4,1);
   ctrl8(:,end) = ctrl8(:,end)/ctrl8(4,end);
   crv(8) = nrbmak(ctrl8, knts);

   ctrl7        = nrb_optim.coefs(:,(2*order+1):(3*order));
   ctrl7(:,1)   = ctrl7(:,1)/ctrl7(4,1);
   ctrl7(:,end) = ctrl7(:,end)/ctrl7(4,end);
   crv(7) = nrbmak(ctrl7, knts);

   ctrl6        = nrb_optim.coefs(:,(3*order+1):(4*order));
   ctrl6(:,1)   = ctrl6(:,1)/ctrl6(4,1);
   ctrl6(:,end) = ctrl6(:,end)/ctrl6(4,end);
   crv(6) = nrbmak(ctrl6, knts);

   ctrl5        = nrb_optim.coefs(:,(4*order+1):(5*order));
   ctrl5(:,1)   = ctrl5(:,1)/ctrl5(4,1);
   ctrl5(:,end) = ctrl5(:,end)/ctrl5(4,end);
   crv(5) = nrbmak(ctrl5, knts);
end
