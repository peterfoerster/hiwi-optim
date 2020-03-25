function [epsilon_ptc] = epsilon (ip, x, y, epsilon_r, geometry_file)
   if (strcmp(geometry_file, 'photocathode_200kV_v5'))
      switch (ip)
         case {12, 18}
            epsilon_ptc = epsilon_r * 8.854e-12*ones(size(x));
         otherwise
            epsilon_ptc = 8.854e-12*ones(size(x));
      end%switch
   elseif (strcmp(geometry_file, 'photocathode_200kV_v6'))
      switch (ip)
         case {5, 24, 25, 32, 33, 34, 35}
            epsilon_ptc = epsilon_r * 8.854e-12*ones(size(x));
         otherwise
            epsilon_ptc = 8.854e-12*ones(size(x));
      end%switch
   else
      % optimization
      switch (ip)
         case {5, 24, 25, 32, 33, 34, 35}
            epsilon_ptc = epsilon_r * 8.854e-12*ones(size(x));
         otherwise
            epsilon_ptc = 8.854e-12*ones(size(x));
      end%switch
   end%if
end
