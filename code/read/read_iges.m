filename = 'anode_ring.igs';
fid = fopen(filename, 'r');

% read Start and Global
header = 1;
str    = fgetl(fid);
while (header==1)
   if (strcmp(str(73),'S') || strcmp(str(73),'G'))
      str = fgetl(fid);
   else
      header = 0;
   end
end

% read Data Entry
entry = 1;
n_obj = 0;
while (entry==1)
   % if entry is one of 100, 110 find corresponding parameter entry and transformation matrix
   ent_type = str2double(str(6:8));
   ent_id   = str2double(str(72));
   if ((ent_type==100 || ent_type==110) && ent_id==1)
      n_obj += 1;
      obj(n_obj).pd_ptr = str2double(str(14:16));
      obj(n_obj).tfm_ptr = str2double(str(53:56));
   end
   if (strcmp(str(73),'D'))
      str = fgetl(fid);
   else
      entry = 0;
   end
end

% read Parameter Data
