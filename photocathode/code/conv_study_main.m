pkg load geopdes;

% select functions
compute_solution = 0;
compute_error = 1;
plot_error = 0;

% choose parameters for iterative solution
degree = 1;
N_it = 3;
nquad_offset = 0;

% choose reference parameters for error computation
degree_ref = 1;
nsub_ref = 16;
nquad_offset_ref = 0;

if (compute_solution)
  conv_study_sol (degree, N_it, nquad_offset);
end

if (compute_error)
  conv_study_err (degree_ref, nsub_ref, nquad_offset_ref, degree, N_it, nquad_offset);
end

if (plot_error)
  plot_conv_study (degree_ref, nsub_ref, nquad_offset_ref, degree, N_it, nquad_offset);
end
