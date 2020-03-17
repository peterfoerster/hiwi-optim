function [c_diff] = permittivity (ip, x, y, geometry_file)
   if (strcmp(geometry_file, 'photocathode_200kV'))
      switch (ip)
         case {15}
            c_diff = 9.4 * 8.854e-12*ones(size(x));
         case {18}
            c_diff = 9.4 * 8.854e-12*ones(size(x));
         case {19}
            c_diff = 9.4 * 8.854e-12*ones(size(x));
         otherwise
         c_diff = 8.854e-12*ones(size(x));
      end%switch
   elseif (strcmp(geometry_file, 'photocathode_200kV_v1'))
      switch (ip)
         case {14}
            c_diff = 9.4 * 8.854e-12*ones(size(x));
         case {18}
            c_diff = 9.4 * 8.854e-12*ones(size(x));
         case {19}
            c_diff = 9.4 * 8.854e-12*ones(size(x));
         otherwise
         c_diff = 8.854e-12*ones(size(x));
      end%switch
   elseif (strcmp(geometry_file, 'photocathode_200kV_v3'))
      switch (ip)
         case {28}
            c_diff = 9.4 * 8.854e-12*ones(size(x));
         case {29}
            c_diff = 9.4 * 8.854e-12*ones(size(x));
         case {33}
            c_diff = 9.4 * 8.854e-12*ones(size(x));
         case {34}
            c_diff = 9.4 * 8.854e-12*ones(size(x));
         otherwise
            c_diff = 8.854e-12*ones(size(x));
      end%switch
   elseif (strcmp(geometry_file, 'photocathode_200kV_v4'))
      switch (ip)
         case {14}
            c_diff = 9.4 * 8.854e-12*ones(size(x));
         case {20}
            c_diff = 9.4 * 8.854e-12*ones(size(x));
         otherwise
            c_diff = 8.854e-12*ones(size(x));
      end%switch
   elseif (strcmp(geometry_file, 'photocathode_200kV_v5'))
      switch (ip)
         case {12}
            c_diff = 9.4 * 8.854e-12*ones(size(x));
         case {18}
            c_diff = 9.4 * 8.854e-12*ones(size(x));
         otherwise
            c_diff = 8.854e-12*ones(size(x));
      end%switch
   elseif (strcmp(geometry_file, 'photocathode_200kV_v6'))
      switch (ip)
         case {5, 24, 25, 32, 33, 34, 35}
            c_diff = 9.4 * 8.854e-12*ones(size(x));
         otherwise
            c_diff = 8.854e-12*ones(size(x));
      end%switch
   else
      % optimization
      switch (ip)
         case {12}
            c_diff = 9.4 * 8.854e-12*ones(size(x));
         case {18}
            c_diff = 9.4 * 8.854e-12*ones(size(x));
         otherwise
            c_diff = 8.854e-12*ones(size(x));
      end%switch
   end%if
end
