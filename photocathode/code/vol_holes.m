%%
nqz = 24;
nqr = 24;
nqy = 24;
L = 1.4;    % L = radius of the disc
R = @(z) 1 + 0.2*z.^2.*sin(z); % Function describing the radius as a function of z

% L = 1; R = @(z) ones(size(z));
Y = @(z) sqrt(L^2 - z^2);

[qn_z, qw_z] = gauleg(-L, L, nqz);

R_show = zeros(nqr, nqy, nqz);
Y_show = zeros(nqr, nqy, nqz);
Z_show = zeros(nqr, nqy, nqz);
int = 0;
for iz = 1:length(qn_z)
    bR = R(qn_z(iz));
    bY = Y(qn_z(iz));
    [qnr, qwr] = gauleg(0, bR, nqr);
    [qny, qwy] = gauleg(0, bY, nqy);
    [C, D] = meshgrid(qwr, qwy);
    int = int + qw_z(iz)*(sum(sum(C.*D)));

    % For visualization
    [A, B] = meshgrid(qnr, qny);
    R_show(:, :, iz) = A';
    Y_show(:, :, iz) = B';
    Z_show(:, :, iz) = ones(size(A'))*qn_z(iz);
end
int = int*2

scatter3(R_show(:), Y_show(:), Z_show(:))
