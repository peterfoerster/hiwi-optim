function [N_probe] = generate_input_normal_emission (T, nT, Q, N_prt, rho_probe, mu, sigma, geometry, filename)
  % choose random starting positions normally distributed
  % astra uses [m]
  N_probe = length(rho_probe);
  r = zeros(N_prt+N_probe, 3);
  t = zeros(N_prt+N_probe, 1);

  for iprt=1:N_probe
    if (rho_probe(iprt) < 0)
      r_2D = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0, -rho_probe(iprt)}, 0, geometry(1).rdim);
      r(iprt,2:3) = [-r_2D(2) r_2D(1)];
    else
      r_2D = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0, rho_probe(iprt)}, 0, geometry(1).rdim);
      r(iprt,2:3) = [r_2D(2) r_2D(1)];
    end
  end

  rho = random('normal', mu, sigma, [1 N_prt]);
  for iprt=1:N_prt
    % check if rho is outside knotspan
    if (abs(rho(iprt)) <= 1)
      if (rho(iprt) < 0)
        r_2D = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0, -rho(iprt)}, 0, geometry(1).rdim);
        r(iprt+N_probe,2:3) = [-r_2D(2) r_2D(1)];
      else
        r_2D = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0, rho(iprt)}, 0, geometry(1).rdim);
        r(iprt+N_probe,2:3) = [r_2D(2) r_2D(1)];
      end
  end

  % divide particles into nT bunches and emit probes in center bunch
  % astra uses [ns]
  dt   = T/nT;
  dprt = floor(N_prt/nT);
  t(1:N_probe) = dt*nT/2;

  for it=1:nT
    t(N_probe+(it-1)*dprt+1:N_probe+it*dprt) = it*dt;
  end
    t(N_probe+it*dprt:end) = T;
    t = t-T/2;

  % total charge -1nC equally distributed
  % astra uses [nC]
  q = Q/N_prt;

  % particle index 1 for electrons
  % cathode: flag -3 for probe and -1 else

  % write .ini file
  write_input_emission (filename, N_prt, N_probe, r, t, q);
end
