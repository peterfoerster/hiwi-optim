function p = get_corner(nrb,  faceIndex1, faceIndex2)

    nrb_faces = nrbextract (nrb);
    face1 = nrb_faces (faceIndex1);
    face2 = nrb_faces (faceIndex2);
    p11 = face1.coefs(1:3,1);
    p12 = face1.coefs(1:3,end);
    p21 = face2.coefs(1:3,1);
    p22 = face2.coefs(1:3,end);

    if      p11 == p21
        p = p11;
    elseif  p11 == p22
        p = p11;
    elseif  p12 == p21
        p = p12;
     elseif  p12 == p22
        p = p12;
    else
        error('the two face numbers are not adjacent')
    end

end

