function face_out = get_face(nrb, face_index)
    nrb_faces = nrbextract (nrb);
    face_out = nrb_faces(face_index);
end