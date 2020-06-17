function [epsilon_ptc] = epsilon (ip, x, y, epsilon_r, geometry_file)
    if (strcmp(geometry_file, 'geometry_v6'))
        switch (ip)
            case {5, 23, 24, 31, 32, 33, 34}
                epsilon_ptc = epsilon_r * 8.854e-12*ones(size(x));
            otherwise
                epsilon_ptc = 8.854e-12*ones(size(x));
        end
    else
        % optimization
        switch (ip)
            case {5, 23, 24, 31, 32, 33, 34}
                epsilon_ptc = epsilon_r * 8.854e-12*ones(size(x));
            otherwise
                epsilon_ptc = 8.854e-12*ones(size(x));
        end
    end%if
end
