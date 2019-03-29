function [] = generate_input_mod (Q, N_prt, N_probe, iprobe, geometry, filename)
  % emit 1/12 particles in 0-0.3
  % 2/12 in 0.3-0.6
  % 3/12 in 0.6-1
  r = zeros(N_prt, 3);

  % first half of particles in 1^st quadrant
  l_el = 0.3 / (N_prt/12);
  for iprt=1:N_prt/12
    i_el = iprt - 1;
    rho = (rand(1,1) + i_el) * l_el;
    r_2D = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0, rho}, 0, geometry(1).rdim);
    r(iprt,2:3) = [r_2D(2) r_2D(1)];
  end
  l_el = 0.3 / (N_prt/6);
  for iprt=(N_prt/12 + 1):N_prt/4
    i_el = iprt - (N_prt/12 + 1);
    rho = (rand(1,1) + i_el) * l_el + 0.3;
    r_2D = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0, rho}, 0, geometry(1).rdim);
    r(iprt,2:3) = [r_2D(2) r_2D(1)];
  end
  l_el = 0.4 / (N_prt/4);
  for iprt=(N_prt/4 + 1):N_prt/2
    i_el = iprt - (N_prt/4 + 1);
    rho = (rand(1,1) + i_el) * l_el  + 0.6;
    r_2D = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0, rho}, 0, geometry(1).rdim);
    r(iprt,2:3) = [r_2D(2) r_2D(1)];
  end

  % second half of particles in 4^th quadrant
  l_el = 0.3 / (N_prt/12);
  for iprt=(N_prt/2 + 1):(N_prt/2 + N_prt/12)
    i_el = iprt - (N_prt/2 + 1);
    rho = (rand(1,1) + i_el) * l_el;
    r_2D = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0, rho}, 0, geometry(1).rdim);
    r(iprt,2:3) = [-r_2D(2) r_2D(1)];
  end
  l_el = 0.3 / (N_prt/6);
  for iprt=(N_prt/2 + N_prt/12 + 1):(N_prt/2 + N_prt/4)
    i_el = iprt - (N_prt/2 + N_prt/12 + 1);
    rho = (rand(1,1) + i_el) * l_el + 0.3;
    r_2D = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0, rho}, 0, geometry(1).rdim);
    r(iprt,2:3) = [-r_2D(2) r_2D(1)];
  end
  l_el = 0.4 / (N_prt/4);
  for iprt=(N_prt/2 + N_prt/4 + 1):N_prt
    i_el = iprt - (N_prt/2 + N_prt/4 + 1);
    rho = (rand(1,1) + i_el) * l_el + 0.6;
    r_2D = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0, rho}, 0, geometry(1).rdim);
    r(iprt,2:3) = [-r_2D(2) r_2D(1)];
  end

  q = Q/N_prt;

  % write .ini file
  write_input (filename, N_prt, iprobe, r, q);
end
