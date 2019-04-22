function [] = plot_convergence_study (filename)
  % N_it, errh1, errl2
  load(filename);

  h = 1./2.^(0:N_it);
  h_exp3 = h.^3;
  h_exp2 = h.^2;

  plot(log(h), log(errl2/90e3), log(h), log(h_exp3) + log(errl2(1)/90e3));
  title('error in l2 norm');
  legend('convergence', 'expected');

  figure;
  plot(log(h), log(errh1/5e6), log(h), log(h_exp2) + log(errh1(1)/5e6));
  title('error in H_1 norm');
  legend('convergence', 'expected');
end
