function [nrb_optim] = move_ctrl_optim (nrb_optim, x, order)
   for ictrl=2:nrb_optim.number-1
      ix = 2*ictrl-3;
      nrb_optim = nrbmodp(nrb_optim, [x(ix) x(ix+1) 0], ictrl);
   end
end
