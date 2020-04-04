function [nrb_opt] = move_ctrl_opt (nrb_opt, x, order)
   for ictrl=2:nrb_opt.number-(order-2+1)
      ix = 2*ictrl-3;
      nrb_opt = nrbmodp(nrb_opt, [x(ix) x(ix+1) 0], ictrl);
   end
end
