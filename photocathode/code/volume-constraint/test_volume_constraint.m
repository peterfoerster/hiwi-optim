clear all; close all; clc;
N_ctrl = 12;
x = zeros(N_ctrl,1);

[h] = volume_constraint(x)
[fc] = volume_constraint_nlopt(x)
