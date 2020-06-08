function [epsilon_ptc] = epsilon (ip, x, y, epsilon_r, geometry_file, order)
    if (strcmp(geometry_file, 'geometry_v6'))
        switch (ip)
            case {5, 24, 25, 32, 33, 34, 35}
                epsilon_ptc = epsilon_r * 8.854e-12*ones(size(x));
            otherwise
                epsilon_ptc = 8.854e-12*ones(size(x));
        end%switch
    else
        % optimization
        if (order == 3)
            switch (ip)
                case {5, 24, 25, 32, 33, 34, 35}
                    epsilon_ptc = epsilon_r * 8.854e-12*ones(size(x));
                otherwise
                    epsilon_ptc = 8.854e-12*ones(size(x));
            end
        elseif (order == 4 || order == 5)
            switch (ip)
                case {5, 23, 24, 31, 32, 33, 34}
                    epsilon_ptc = epsilon_r * 8.854e-12*ones(size(x));
                otherwise
                    epsilon_ptc = 8.854e-12*ones(size(x));
            end
        end
    end%if
end
