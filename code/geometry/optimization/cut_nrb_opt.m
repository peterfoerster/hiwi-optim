function [crv] = cut_nrb_opt (nrb_opt, order, knts)
   for ii=2:3
      nrb_opt = nrbkntins(nrb_opt, [unique(knts(order+1:end-order))]);
   end
   knts = [zeros(1,order) ones(1,order)];

   ctrl19        = nrb_opt.coefs(:,1:order);
   ctrl19(:,1)   = ctrl19(:,1)/ctrl19(4,1);
   ctrl19(:,end) = ctrl19(:,end)/ctrl19(4,end);
   crv(19) = nrbmak(ctrl19, knts);

   ctrl18        = nrb_opt.coefs(:,(order+1):(2*order));
   ctrl18(:,1)   = ctrl18(:,1)/ctrl18(4,1);
   ctrl18(:,end) = ctrl18(:,end)/ctrl18(4,end);
   crv(18) = nrbmak(ctrl18, knts);

   ctrl17        = nrb_opt.coefs(:,(2*order+1):(3*order));
   ctrl17(:,1)   = ctrl17(:,1)/ctrl17(4,1);
   ctrl17(:,end) = ctrl17(:,end)/ctrl17(4,end);
   crv(17) = nrbmak(ctrl17, knts);

   ctrl16        = nrb_opt.coefs(:,(3*order+1):(4*order));
   ctrl16(:,1)   = ctrl16(:,1)/ctrl16(4,1);
   ctrl16(:,end) = ctrl16(:,end)/ctrl16(4,end);
   crv(16) = nrbmak(ctrl16, knts);

   ctrl15        = nrb_opt.coefs(:,(4*order+1):(5*order));
   ctrl15(:,1)   = ctrl15(:,1)/ctrl15(4,1);
   ctrl15(:,end) = ctrl15(:,end)/ctrl15(4,end);
   crv(15) = nrbmak(ctrl15, knts);

   ctrl14        = nrb_opt.coefs(:,(5*order+1):(6*order));
   ctrl14(:,1)   = ctrl14(:,1)/ctrl14(4,1);
   ctrl14(:,end) = ctrl14(:,end)/ctrl14(4,end);
   crv(14) = nrbmak(ctrl14, knts);
end
