% N_it, h1_ref, l2_ref, h1_conv, l2_conv
degree = 4;
filename = ['photocathode_insulator_ref=5_degree=' num2str(degree) '_N_it=4.mat'];
load(filename);

h = 1./2.^(0:N_it);
h_l2 = h.^(degree+1);
h_h1 = h.^degree;

errl2 = (l2_conv - l2_ref)/l2_ref;
errh1 = (h1_conv - h1_ref)/h1_ref;

filename = ['convergence_ref=5_degree=' num2str(degree) '.dat'];
fid = fopen(filename, 'w');
fprintf(fid, 'h  errl2  errh1  h_l2  h_h1\n');
fclose(fid);
dlmwrite(filename, [h' errl2' errh1' h_l2'*errl2(1)' h_h1'*errh1(1)], 'delimiter', '  ', 'append', 'on');
