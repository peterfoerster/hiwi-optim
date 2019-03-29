function [] = generate_input (Q, N_prt, N_probe, iprobe, geometry, filename)
  % choose random starting positions but guided by zones
  % astra uses [m]
  r = zeros(N_prt, 3);

  % length of each cathode element
  % use factor to only use a part of the cathode
  l_el = 2/N_prt*1;
  % first half of particles in 1^st quadrant
  for iprt=1:N_prt/2
    i_el = iprt - 1;
    rho = (rand(1,1) + i_el) * l_el;
    r_2D = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0, rho}, 0, geometry(1).rdim);
    r(iprt,2:3) = [r_2D(2) r_2D(1)];
  end
  % second half of particles in 4^th quadrant
  for iprt=(N_prt/2 + 1):N_prt
    i_el = iprt - (N_prt/2 + 1);
    rho = (rand(1,1) + i_el) * l_el;
    r_2D = geo_nurbs (geometry(1).nurbs, geometry(1).dnurbs, geometry(1).dnurbs2, {0, rho}, 0, geometry(1).rdim);
    r(iprt,2:3) = [-r_2D(2) r_2D(1)];
  end

  % 9e-3 ns entire emission time randomly emit during that time frame
  % probe particles not emitted right at the beginning
  % astra uses [ns]

  % total charge -1nC equally distributed
  % astra uses [nC]
  q = Q/N_prt;

  % particle index 1 for electrons
  % cathode: flag -3 for probe and -1 else
  % otherwise flag 3 for probe and 5 else

  % write .ini file
  write_input (filename, N_prt, iprobe, r, q);
end
