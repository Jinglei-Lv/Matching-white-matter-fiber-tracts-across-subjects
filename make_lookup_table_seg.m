% Note that .nii.gz files need to by non-compressed (i.e. .nii files) for this to work

% Read in .nii of voxel ids
VoxIDs = niftiread('idmap.nii');

% Read in .nii of voxel segmentation types
SegMap = niftiread('MNI_diff_GM_WM_CSF_Seg.nii');

% Convert to a vector of values. This should just be the numbers 1 to 
% size(VoxIDs,1)*size(VoxIDs,2)*size(VoxIDs,3), or 1 to length(VoxIDs(:)).
VoxIDsVec = VoxIDs(:);

% Can potentially simplify to IND = VoxIDsVec if the above comment is true
IND = 1:length(VoxIDsVec);

% Convert the indices to voxel coordinates
[X,Y,Z] = ind2sub(size(V),IND);

% Get the segmentation value for each index
SegMap_ind = double(SegMap(IND));

% Make the new look up table
LUP_TABLE = [X' Y' Z' VoxIDsVec(IND)' SegMap_ind'];

% Write out the look up table

format long

writematrix(LUP_TABLE,'loopup_table_seg.txt','Delimiter','tab')
