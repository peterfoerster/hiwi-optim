function crv = create3Dcathode ()
knots = [0 0 0 1 1 1];
coefs = [0.00000   0.00000   0.01920
         0.00000   0.03037   0.06074
         0.00000   0.00000   0.00000
         1.00000   1.00000   1.00000];
crv = nrbmak(coefs, knots);
srf = nrbrevolve(crv, [0 0 0], [1 0 0]);
nrbkntplot(srf)
endfunction
