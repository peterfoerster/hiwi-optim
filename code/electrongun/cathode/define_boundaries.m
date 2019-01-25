function  [l, p142, bd] = define_boundaries()

    M = csvread("Cathode_and_focus_electrode_mock.csv");

    l = zeros(max(M(:,1)),3);

    for ii = 1:size(M, 1)  
       if ii ~= 3  && ii ~= 4  && ii ~= 9
           l(M(ii,1),1) = 0.001* M(ii,3);
           l(M(ii,1),2) = 0.001* -M(ii,2);
           l(M(ii,1),3) = 0.001* M(ii,4);
       end
    end

    r = l;
    r(:,2) = - r(:,2);

    h1 = norm(r(2,:)-l(2,:))/2;
    p4 = [l(2,1), l(1,2), 0 ]; 
    % h1 = norm(l(2,:)-p4);
    h2 = norm(p4-l(1,:));
    r1 = (h1^2-h2^2)/(2*h2)+h2;

    origin = [0 0 0];

    center1 = origin + [r1 0 0];
    alpha1 = asin(h1/r1);
    start_angle = -pi-alpha1;
    stop_angle = -pi;

    bd(1) = nrbreverse (nrbcirc (r1, center1, start_angle, stop_angle)); 


    bd(2) = nrbline(l(2,:), l(5,:));

    radius1 = norm(l(7,:)-l(6,:))/2;
    center1 = l(6,:) + [0 radius1 0]; 

    bd(4) = (nrbcirc (radius1, center1, -pi/2, 0)); 

    bd(3) = (nrbline ( l(5,:) , bd(4).coefs(1:3,1)   )); 

    bd(5) = nrbline(  bd(4).coefs(1:3,end) , l(17,:));

    bd(6) = nrbline(l(17,:), l(16,:));

    radius2 = norm(l(12,:)-l(14,:))/2;
    center2 = l(12,:) + [0 radius2 0];

    bd(8) = (nrbcirc (radius2, center2, pi/2, 5/6*pi )); 
    bd(9) = (nrbcirc (radius2, center2, 5/6*pi, 7/6*pi )); 
    bd(10) = (nrbcirc (radius2, center2, 7/6*pi, -pi/2 ));

    bd(7) = nrbline(l(16,:), bd(8).coefs(1:3,1) );

    bd(11) = nrbline(bd(10).coefs(1:3,end), l(11,:));
    bd(12) = nrbline(l(11,:), l(10,:));

    p142 = [bd(10).coefs(1,1)*1, l(10,2)*0.95, 0];

    bd(13) = nrbline(l(10,:), [ l(10,1) p142(2) 0 ] );
    bd(14) = nrbline(bd(13).coefs(1:3,end), [ l(10,1) 0 0 ] );
    bd(15) = nrbline(bd(14).coefs(1:3,end), [ l(11,1) 0 0 ] );
    bd(16) = nrbline(bd(15).coefs(1:3,end), [ l(12,1) 0 0 ] );
    bd(17) = nrbline(bd(16).coefs(1:3,end), [ p142(1) 0 0 ] );
    bd(18) = nrbline(bd(17).coefs(1:3,end), bd(1).coefs(1:3,1) );
 
end