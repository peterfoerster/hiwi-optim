function cathode_nrb = create_cathode(move, cathode_nrb_initial)

cathode_nrb = nrbdegelev(cathode_nrb_initial,length(move)-cathode_nrb_initial.number+1);
% cf = cathode_nrb.coefs
% move
ctr = cathode_nrb.coefs + [move,0;zeros(3,length(move)+1)];
knt = cathode_nrb.knots;

cathode_nrb = nrbmak(ctr,knt);

end