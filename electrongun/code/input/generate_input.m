function [] = generate_input (Q, N_prt, N_probe, geometry, filename, distro)
cathode = nrbrevolve(geometry(1).boundary(1).nurbs, [0 0 0], [1 0 0]);
r = zeros(N_prt+N_probe, 3);

% probe particles
for iprt=1:N_probe
  r_3D = nrbeval(cathode, {2*iprt/(8*N_probe), 2*iprt/(8*N_probe)});
  % x==2, y==3, z==1 from plot
  r(iprt,:) = [r_3D(2) r_3D(3) r_3D(1)];
end

if (strcmp(distro, 'normal'))
  rho = abs(random('normal', 0, 0.3, [N_prt 2]));
elseif (strcmp(distro, 'uniform'))
  rho = random('uniform', 0, 1, [N_prt 2]);
else
  error('unknown random distribution');
end

for iprt=1:N_prt
  r_3D = nrbeval(cathode, {rho(iprt,1), rho(iprt,2)});
  r(iprt+N_probe,:) = [r_3D(2) r_3D(3) r_3D(1)];
end

q = Q/N_prt;
write_input (filename, N_prt, N_probe, r, q);
