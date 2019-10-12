function [nrb_optim] = move_ctrl_optim (nrb_optim, x, order)
   % left of holes
   il = 1 + 2*(order-2) + (order-3);
   for ictrl=2:il
      ix = 2*ictrl-3;
      nrb_optim = nrbmodp(nrb_optim, [x(ix) x(ix+1) 0], ictrl);
   end

   % holes
   for ictrl=(il+1):(il+order)
      ix1 = 2*il-2;
      ix2 = ictrl-il;
      nrb_optim = nrbmodp(nrb_optim, [0 x(ix1+ix2) 0], ictrl);
   end

   % right of holes
   ir = il+order;
   for ictrl=(ir+1):(nrb_optim.number-(order-1))
      ix1 = 2*il-2+order;
      ix2 = 2*(ictrl-ir)-1;
      nrb_optim = nrbmodp(nrb_optim, [x(ix1+ix2) x(ix1+ix2+1) 0], ictrl);
   end
end
