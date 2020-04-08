function [l1_err, l2_err, linf_err] = compute_int_error (H_ref, H_it, sc, Nrad, Cell_var, Nlong_in)
   l1_err   = NaN(length(H_it), 6);
   l2_err   = NaN(length(H_it), 6);
   linf_err = NaN(length(H_it), 6);

   filename = ['photogun_H=' num2str(H_ref) '.track.001'];
   astra_ref = dlmread(filename);

   for ip=1:6
      ix = find(astra_ref(:,1) == ip);
      x_ref = astra_ref(ix,3:5);

      for iH=1:length(H_it)
         H = 2^H_it(iH);
         filename = ['photogun_H=' num2str(H) '.track.001'];
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

         l1_err(iH,ip)   = norm(err, 1);
         l2_err(iH,ip)   = norm(err, 2);
         linf_err(iH,ip) = norm(err, Inf);
      end
   end
end
