points = [0 0
          0.3008 0
          0.3008 0.031496
          0.21457 0.031496
          0.078106 0.040009
          0.07029 0.047869
          0.078164 0.055746
          0.13722 0.057809
          0.13722 0.095433
          0.056718 0.076017
          0.019153 0.06665
          0.019153 0.060745];

%leftover = [% these two seem pointless
%            0.055325 0.099446
%            0.057353 0.099622
%            % the other one seems just as good
%            0.078373 0.055754
%            % seems pointless
%            0.30080   0.09543];

%scatter(points(:,1), points(:,2), "b", "filled");
%hold;
%scatter(leftover(:,1), leftover(:,2), "r", "filled");

% cathode patch
knots = [0 0 0 1 1 1];
coefs = [0.00000   0.00000   0.01920
         0.00000   0.03037   0.06074
         0.00000   0.00000   0.00000
         1.00000   1.00000   1.00000];
crv(1) = nrbmak(coefs, knots);


