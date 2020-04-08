function [l1_err, l2_err, linf_err] = compute_map_error (nz_ref, nz_it, nx_it)
   l1_err   = NaN(length(nz_it)+length(nx_it),6);
   l2_err   = NaN(length(nz_it)+length(nx_it),6);
   linf_err = NaN(length(nz_it)+length(nx_it),6);

   filename = ['photogun_nx=ny=' num2str(2^nz_ref) '_nz=' num2str(2^nz_ref) '.track.001'];
   astra_ref = dlmread(filename);

   for ip=1:6
      ix = find(astra_ref(:,1) == ip);
      x_ref = astra_ref(ix,3:5);

      for in=1:length(nz_it)
         nz = 2^nz_it(in);
         filename = ['photogun_nx=ny=' num2str(nz) '_nz=' num2str(nz) '.track.001'];
         astra = dlmread(filename);

         ix   = find(astra(:,1) == ip);
         x_it = astra(ix,3:5);
         err  = interp1(x_it(:,1), x_it(:,2:3), x_ref(:,1)) - x_ref(:,2:3);

         ix  = ~isnan(err);
         ix  = ix(:,1) & ix(:,2);
         % [mm] to [m]
         err = err(ix,:)*1e-3;
         % l2 distance
         err = norm(err, 2, 'rows');

         l1_err(in,ip)   = norm(err, 1);
         l2_err(in,ip)   = norm(err, 2);
         linf_err(in,ip) = norm(err, Inf);
      end

      for in=1:length(nx_it)
         nx = 2^nx_it(in);
         filename = ['photogun_nx=ny=' num2str(nx) '_nz=' num2str(2^nz_ref) '.track.001'];
         astra = dlmread(filename);

         ix   = find(astra(:,1) == ip);
         x_it = astra(ix,3:5);
         err  = interp1(x_it(:,1), x_it(:,2:3), x_ref(:,1)) - x_ref(:,2:3);

         ix  = ~isnan(err);
         ix  = ix(:,1) & ix(:,2);
         % [mm] to [m]
         err = err(ix,:)*1e-3;
         % l2 distance
         err = norm(err, 2, 'rows');

         l1_err(length(nz_it)+in,ip)   = norm(err, 1);
         l2_err(length(nz_it)+in,ip)   = norm(err, 2);
         linf_err(length(nz_it)+in,ip) = norm(err, Inf);
      end
   end
end
