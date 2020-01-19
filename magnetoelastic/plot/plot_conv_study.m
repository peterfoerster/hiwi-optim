function [] = plot_conv_study (degree_ref, nsub_ref, nquad_offset_ref, degree, N_it, nquad_offset)
   geometry_file = 'photocathode_insulator';
   filename = [geometry_file '_degree_ref=' num2str(degree_ref) '_nsub_ref=' num2str(nsub_ref) '_nquad_offset_ref=' num2str(nquad_offset_ref) '_degree=' num2str(degree) '_N_it=' num2str(N_it) '_nquad=' num2str(nquad_offset)];
   % 'normh1_ref', 'normh1', 'norml2_ref', 'norml2'
   load([filename '.mat']);

   h = 1./2.^(0:N_it);
   h_l2 = h.^(degree+1);
   h_h1 = h.^degree;

   errl2 = (norml2 - norml2_ref)./norml2_ref;
   errh1 = abs((normh1 - normh1_ref)./normh1_ref);

   loglog(h, errl2, h, h_l2*errl2(1));
   title('relative error in L_2 norm');

   figure;
   loglog(h, errh1, h, h_h1*errh1(1));
   title('relative error in H_1 norm');

   % output for latex
   fid = fopen([filename '.dat'], 'w');
   fprintf(fid, 'h  errl2  errh1  h_l2  h_h1\n');
   fclose(fid);
   dlmwrite([filename '.dat'], [h' errl2' errh1' h_l2'*errl2(1)' h_h1'*errh1(1)], 'delimiter', '  ', 'append', 'on');
end
