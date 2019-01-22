
function [ crv, l, cathode_nrb ] = contruct_canon_geometry( geometry_path_name, move, lngth, cathode_nrb_initial  )

cathode_nrb = create_cathode(move, cathode_nrb_initial );

[ l, p142, bd ]  = define_boundaries(cathode_nrb);

stretch = lngth/1000 - bd(15).coefs(1,1) ;

bd(15) = nrbmodp(bd(15), [stretch 0 0], 1);
bd(12) = nrbmodp(bd(12), [stretch 0 0], 2);
bd(13) = nrbmodp(bd(13), [stretch 0 0], 1);
bd(13) = nrbmodp(bd(13), [stretch 0 0], 2);
bd(14) = nrbmodp(bd(14), [stretch 0 0], 1);
bd(14) = nrbmodp(bd(14), [stretch 0 0], 2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% surface 1
clear crv;
 
crv(1) = bd(1);


p132 = [p142(1), 0, 0]; 

crv(2) =  ( nrbline( p132 , p142) ); 

crv(3) =  nrbline( crv(1).coefs(1:3,1) , p132);
crv(4) =  nrbline( crv(1).coefs(1:3,end) , p142);

srf(1) = nrbcoons (crv(3), crv(4), crv(1), crv(2) );



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% surface 2
clear crv;
 
crv(1) = bd(2);
crv(2) = nrbline( p142, bd(10).coefs(1:3,1) ); 
crv(3) = get_face(srf(1),4);
crv(4) = (nrbline( crv(1).coefs(1:3,end), crv(2).coefs(1:3,end) ));

srf(2) = nrbcoons (crv(3), crv(4), crv(1), crv(2) );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% surface 3
clear crv;
 
crv(1) = get_face(srf(2),2);
crv(4) = bd(10);
crv(2) = (nrbline( [ crv(4).coefs(1,end) crv(1).coefs(2,1) 0] , crv(4).coefs(1:3,end) ));
crv(3) = (nrbline( crv(1).coefs(1:3,1), [ crv(4).coefs(1,end) crv(1).coefs(2,1) 0] ));

srf(3) = nrbcoons (crv(3), crv(4), crv(1), crv(2) );

% srf(3) = nrbdegelev(srf(3), [degelev(1) 0]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% surface 4
clear crv;
 
crv(1) = get_face(srf(1),2);
crv(4) = get_face(srf(3),3);
crv(2) = (nrbline( [ crv(4).coefs(1,end) crv(1).coefs(2,1) 0] , crv(4).coefs(1:3,end) ));
crv(3) = (nrbline( crv(1).coefs(1:3,1), [ crv(4).coefs(1,end) crv(1).coefs(2,1) 0] ));

srf(4) = nrbcoons (crv(3), crv(4), crv(1), crv(2) );


% 
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% surface 5
clear crv;
 
crv(1) = get_face(srf(3),2);
crv(4) = bd(11);
crv(2) = (nrbline( [ crv(4).coefs(1,end) crv(1).coefs(2,1) 0] , crv(4).coefs(1:3,end) ));
crv(3) = (nrbline( crv(1).coefs(1:3,1), [ crv(4).coefs(1,end) crv(1).coefs(2,1) 0] ));

srf(5) = nrbcoons (crv(3), crv(4), crv(1), crv(2) );

% srf(5) = nrbdegelev(srf(5), [degelev(1) 0]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% surface 6
clear crv;
 
crv(1) = get_face(srf(4),2);
crv(4) = get_face(srf(5),3);
crv(2) = (nrbline( [ crv(4).coefs(1,end) crv(1).coefs(2,1) 0] , crv(4).coefs(1:3,end) ));
crv(3) = (nrbline( crv(1).coefs(1:3,1), [ crv(4).coefs(1,end) crv(1).coefs(2,1) 0] ));

srf(6) = nrbcoons (crv(3), crv(4), crv(1), crv(2) );

% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% surface 7
clear crv;
 
crv(1) = get_face(srf(5),2);
crv(4) = bd(12);
crv(2) = (nrbline( [ crv(4).coefs(1,end) crv(1).coefs(2,1) 0] , crv(4).coefs(1:3,end) ));
crv(3) = (nrbline( crv(1).coefs(1:3,1), [ crv(4).coefs(1,end) crv(1).coefs(2,1) 0] ));

srf(7) = nrbcoons (crv(3), crv(4), crv(1), crv(2) );

% srf(7) = nrbdegelev(srf(7), [degelev(1) 0]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% surface 8
clear crv;
 
crv(1) = get_face(srf(6),2);
crv(4) = get_face(srf(7),3);
crv(2) = (nrbline( [ crv(4).coefs(1,end) crv(1).coefs(2,1) 0] , crv(4).coefs(1:3,end) ));
crv(3) = (nrbline( crv(1).coefs(1:3,1), [ crv(4).coefs(1,end) crv(1).coefs(2,1) 0] ));

srf(8) = nrbcoons (crv(3), crv(4), crv(1), crv(2) );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% surface 9
clear crv;
 
crv(1) = bd(3);
crv(2) = nrbreverse(bd(9));
crv(3) = get_face(srf(2),4);
crv(4) = (nrbline( crv(1).coefs(:,end) , crv(2).coefs(:,end) ));


srf(9) = nrbcoons (crv(3), crv(4), crv(1), crv(2) );


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% surface 10
clear crv;
 
crv(1) = bd(4);
crv(2) = nrbreverse(bd(8));
crv(3) = get_face(srf(9),4);
crv(4) = (nrbline( crv(1).coefs(:,end) , crv(2).coefs(:,end) ));

srf(10) = nrbcoons (crv(3), crv(4), crv(1), crv(2) );

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% surface 14
clear crv;
 
crv(1) = bd(5);
crv(2) = nrbreverse(bd(7));
crv(3) = get_face(srf(10),4);
crv(4) = (nrbline( crv(1).coefs(:,end) , crv(2).coefs(:,end) ));

srf(11) = nrbcoons (crv(3), crv(4), crv(1), crv(2) );

hold on;
isrf = [1,2,3,4,5,6,9,10,11];
for iisrf=1:length(isrf)
  nrbkntplot(srf(isrf(iisrf))); 
end
hold off;
view(2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Generate automatically the interface and boundary information
[interfaces, boundaries] = nrbmultipatch (srf);

% Using nrbmultipatch, one boundary is generated for each side of each patch
% To group several sides together, we must do it by hand
boundaries = [];
 
boundaries(1).patches = [ 1 2 9 10 ];
boundaries(1).faces =   [ 1 1 1 1 ];

boundaries(2).patches = [ 11 11 10 9 3 5 7 ];
boundaries(2).faces =   [ 4  2  2  2 4 4 4 ];

boundaries(3).patches = [ 11 7 8 8 6 4 1]; 
boundaries(3).faces =   [ 1  2 2 3 3 3 3];


for ii = 1:numel(boundaries)
    boundaries(ii).nsides = length(boundaries(ii).patches);
end

% disp ( strcat({'Exporting the geometry to the file '} , geometry_file_name) )
nrbexport (srf, interfaces, boundaries, geometry_path_name);

% plot_geometry(srf, crv, interfaces, boundaries, l, 0);


    

end