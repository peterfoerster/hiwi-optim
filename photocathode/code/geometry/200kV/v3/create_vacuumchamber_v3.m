function [vacuumchamber] = create_vacuumchamber_v3 (electrode_boundary)
   % bottom front vertical, keep first two straight for tracking
   p1 = [373e-3 0];
   p2 = nrbeval(electrode_boundary(1), 1);
   p2 = [p1(1) p2(2)];
   vacuumchamber(1) = nrbline(p1, p2);

   p1 = nrbeval(vacuumchamber(1), 1);
   p2 = nrbeval(electrode_boundary(2), 1);
   p2 = [p1(1) p2(2)];
   vacuumchamber(2) = nrbline(p1, p2);

   p1 = nrbeval(vacuumchamber(2), 1);
   p2 = nrbeval(electrode_boundary(3), 1);
   p2 = [p1(1) p2(2)];
   vacuumchamber(3) = nrbline(p1, p2);

   % start skewing upwards
   p1 = nrbeval(vacuumchamber(3), 1);
   p2 = nrbeval(electrode_boundary(5), 1);
   p2 = [p1(1) p2(2)];
   vacuumchamber(4) = nrbline(p1, p2);

   p1 = nrbeval(vacuumchamber(4), 1);
   p2 = nrbeval(electrode_boundary(6), 1);
   p2 = [p1(1) (112e-3+4*p2(2))/5];
   vacuumchamber(5) = nrbline(p1, p2);

   p1 = nrbeval(vacuumchamber(5), 1);
   p2 = [p1(1) (112e-3+p1(2))/2];
   vacuumchamber(6) = nrbline(p1, p2);

   % top front vertical
   p1 = nrbeval(vacuumchamber(6), 1);
   p2 = [373e-3 112e-3];
   vacuumchamber(7) = nrbline(p1, p2);

   % top front horizontal
   p1 = nrbeval(electrode_boundary(6), 1);
   p2 = nrbeval(vacuumchamber(7), 1);
   p1 = [p2(1)-2/5*p1(1) p2(2)];
   vacuumchamber(8) = nrbline(p1, p2);

   p1 = nrbeval(electrode_boundary(6), 1);
   p2 = nrbeval(vacuumchamber(8), 0);
   p1 = [p2(1)-1/5*p1(1) p2(2)];
   vacuumchamber(9) = nrbline(p1, p2);

   p1 = nrbeval(electrode_boundary(6), 1);
   p2 = nrbeval(vacuumchamber(9), 0);
   p1 = [p1(1) p2(2)];
   vacuumchamber(10) = nrbline(p1, p2);

   p1 = nrbeval(electrode_boundary(9), 0);
   p2 = nrbeval(vacuumchamber(10), 0);
   p1 = [(p2(1)+2*p1(1))/3 p2(2)];
   vacuumchamber(11) = nrbline(p1, p2);

   % holes
   p1 = nrbeval(electrode_boundary(10), 0);
   p2 = nrbeval(vacuumchamber(11), 0);
   p1 = [(p2(1)+p1(1))/2 p2(2)];
   vacuumchamber(12) = nrbline(p1, p2);

   p1 = nrbeval(electrode_boundary(10), 0);
   p2 = nrbeval(vacuumchamber(12), 0);
   p1 = [p1(1) p2(2)];
   vacuumchamber(13) = nrbline(p1, p2);

   p1 = [0 112e-3];
   p2 = nrbeval(vacuumchamber(13), 0);
   p1 = [p2(1)/2 p1(2)];
   vacuumchamber(14) = nrbline(p1, p2);

   % top back horizontal
   p1 = [0 112e-3];
   p2 = nrbeval(vacuumchamber(14), 0);
   vacuumchamber(15) = nrbline(p1, p2);

   % top back vertical
   p2 = nrbeval(vacuumchamber(15), 0);
   p1 = [p2(1) 5/7*p2(2)];
   vacuumchamber(16) = nrbline(p1, p2);

   p1 = nrbeval(electrode_boundary(13), 1);
   p2 = nrbeval(vacuumchamber(16), 0);
   p1 = [p2(1) 8/7*p1(2)];
   vacuumchamber(17) = nrbline(p1, p2);

   % insulator
   p1 = nrbeval(electrode_boundary(15), 1);
   p2 = nrbeval(vacuumchamber(17), 0);
   p1 = [p2(1) p1(2)];
   vacuumchamber(18) = nrbline(p1, p2);

   p1 = nrbeval(electrode_boundary(15), 0);
   p2 = nrbeval(vacuumchamber(18), 0);
   p1 = [p2(1) p1(2)];
   vacuumchamber(19) = nrbline(p1, p2);

   p1 = nrbeval(electrode_boundary(25), 1);
   p2 = nrbeval(vacuumchamber(19), 0);
   p1 = [p2(1) p1(2)];
   vacuumchamber(20) = nrbline(p1, p2);

   p1 = [0 16e-3];
   p2 = nrbeval(vacuumchamber(20), 0);
   vacuumchamber(21) = nrbline(p1, p2);

   % insulator
   p1 = nrbeval(electrode_boundary(25), 0);
   p2 = nrbeval(vacuumchamber(21), 0);
   p1 = [p2(1) p1(2)];
   vacuumchamber(22) = nrbline(p1, p2);

   % bottom back vertical
   p1 = [0 0];
   p2 = nrbeval(vacuumchamber(22), 0);
   vacuumchamber(23) = nrbline(p1, p2);

   % bottom back horizontal
   p1 = nrbeval(vacuumchamber(23), 0);
   p2 = nrbeval(electrode_boundary(26), 0);
   vacuumchamber(24) = nrbline(p1, p2);

   % bottom front horizontal
   p1 = nrbeval(electrode_boundary(1), 0);
   p2 = nrbeval(vacuumchamber(1), 0);
   p2 = [(p2+p1)/2];
   vacuumchamber(25) = nrbline(p1, p2);

   p1 = nrbeval(vacuumchamber(25), 1);
   p2 = nrbeval(vacuumchamber(1), 0);
   vacuumchamber(26) = nrbline(p1, p2);
end
