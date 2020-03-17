function [cathode_boundary] = create_cathodeboundary ()
   % photocathode
   p1 = [(100-9.79)*1e-3 0];
   p2 = [p1(1) 9.8e-3];
   cathode_boundary(1) = nrbline(p1, p2);

   % front top curve
   radius = 14.46e-3;
   center = [100e-3-radius 35.54*1e-3];
   sang = 3*pi/2 + 67.5/180*pi;
   eang = pi/4;
   cathode_boundary(3) = nrbcirc(radius, center, sang, eang);

   radius = 14.46e-3;
   center = [100e-3-radius 35.54*1e-3];
   sang = pi/4;
   eang = pi/2;
   cathode_boundary(4) = nrbcirc(radius, center, sang, eang);
   cathode_boundary(4) = nrbreverse(cathode_boundary(4));

   % front connection with photocathode
   p1 = nrbeval(cathode_boundary(1), 1);
   p2 = nrbeval(cathode_boundary(3), 0);
   cathode_boundary(2) = nrbline(p1, p2);

   % back curve
   radius = 7.5e-3;
   center = [7.5e-3 (35+7.5)*1e-3];
   sang = pi/2;
   eang = pi;
   cathode_boundary(6) = nrbcirc(radius, center, sang, eang);
   cathode_boundary(6) = nrbreverse(cathode_boundary(6));

   radius = 7.5e-3;
   center = [7.5e-3 (35+7.5)*1e-3];
   sang = pi;
   eang = 3*pi/2;
   cathode_boundary(7) = nrbcirc(radius, center, sang, eang);
   cathode_boundary(7) = nrbreverse(cathode_boundary(7));

   % top horizontal
   p1 = nrbeval(cathode_boundary(6), 1);
   p2 = nrbeval(cathode_boundary(4), 0);
   cathode_boundary(5) = nrbline(p1, p2);

   % kink
   p1 = [7.5e-3 25e-3];
   p2 = nrbeval(cathode_boundary(7), 0);
   cathode_boundary(8) = nrbline(p1, p2);

   p1 = nrbeval(cathode_boundary(8), 0);
   p2 = [(7.5+10)*1e-3 25e-3];
   cathode_boundary(9) = nrbline(p1, p2);

   p1 = nrbeval(cathode_boundary(9), 1);
   p2 = [(7.5+10)*1e-3 35e-3];
   cathode_boundary(10) = nrbline(p1, p2);

   % top/bottom horizontal
   p1 = nrbeval(cathode_boundary(10), 1);
   p2 = [(7.5+73.26)*1e-3 35e-3];
   cathode_boundary(11) = nrbline(p1, p2);

   % front top vertical
   p1 = [(7.5+73.26)*1e-3 20e-3];
   p2 = nrbeval(cathode_boundary(11), 1);
   cathode_boundary(12) = nrbline(p1, p2);

   % front bottom horizontal
   p1 = [(7.5+73.26+14 - 57.34)*1e-3 20e-3];
   p2 = nrbeval(cathode_boundary(12), 0);
   cathode_boundary(13) = nrbline(p1, p2);

   % back middle vertical
   p1 = [(7.5+73.26+14 - 57.34)*1e-3 12.5e-3];
   p2 = nrbeval(cathode_boundary(13), 0);
   cathode_boundary(14) = nrbline(p1, p2);

   % back middle horizontal
   p1 = [7.5e-3 12.5e-3];
   p2 = nrbeval(cathode_boundary(14), 0);
   cathode_boundary(15) = nrbline(p1, p2);

   % back bottom vertical
   p1 = [7.5e-3 0];
   p2 = nrbeval(cathode_boundary(15), 0);
   cathode_boundary(16) = nrbline(p1, p2);

   % bottom horizontal
   p1 = nrbeval(cathode_boundary(16), 0);;
   p2 = nrbeval(cathode_boundary(1), 0);
   cathode_boundary(17) = nrbline(p1, p2);
end
