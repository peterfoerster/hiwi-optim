function [N_probe] = generate_input_uniform (Q, N_prt, rho_probe, rho_bot, rho_top, geometry, filename)
  % choose random starting positions normally distributed
  % astra uses [m]
  N_probe = length(rho_probe);
  r = zeros(N_prt+N_probe, 3);

  for iprt=1:N_probe
    if (rho_probe(iprt) < 0)
      r_2D = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0, -rho_probe(iprt)}, 0, geometry(1).rdim);
      r(iprt,2:3) = [-r_2D(2) r_2D(1)];
    else
      r_2D = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0, rho_probe(iprt)}, 0, geometry(1).rdim);
      r(iprt,2:3) = [r_2D(2) r_2D(1)];
    end
  end

  rho = random('uniform', rho_bot, rho_top, [1 N_prt]);
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

  % total charge in [nC]
  q = Q/N_prt;

  % write .ini file
  write_input (filename, N_prt, N_probe, r, q);
end
