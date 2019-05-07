function [] = plot_convergence_study (filename, degree)
  % N_it, h1_ref, l2_ref, h1_conv, l2_conv
  load(filename);

  h = 1./2.^(0:N_it);
  h_expl2 = h.^(degree+1);
  h_exph1 = h.^degree;

  errl2 = (l2_conv - l2_ref)/l2_ref;
  errh1 = (h1_conv - h1_ref)/h1_ref;

  plot(h, errl2, h, h_expl2*errl2(1));
  title('error in L_2 norm');

  figure;
  loglog(h, errh1, h, h_exph1*errh1(1));
  title('error in H_1 norm');
end
