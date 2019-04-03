function [] = write_input (filename, N_prt, N_probe, r, q)
  % particle index 1 for electrons
  % flag 3 for probe and 5 for standard particles
  fid = fopen (filename, 'w');
  for iprt=1:N_prt+N_probe
    if (iprt <= N_probe)
      fprintf(fid, '  %E  %E  %E  %E  %E  %E  %E  %E  %i  %i\n', r(iprt,1), r(iprt,2), r(iprt,3), 0, 0, 0, 0, q, 1, 3);
    else
      fprintf(fid, '  %E  %E  %E  %E  %E  %E  %E  %E  %i  %i\n', r(iprt,1), r(iprt,2), r(iprt,3), 0, 0, 0, 0, q, 1, 5);
    end
  end
  fclose (fid);
end
