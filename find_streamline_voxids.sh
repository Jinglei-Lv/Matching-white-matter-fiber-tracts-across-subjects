#!/usr/bin/env bash

# -nthreads is set to 0 because with multithreading it reorders streamlines

# The step size of each tract
STEPSIZE=.1

tckresample -nthreads 0 -step_size $STEPSIZE template_tracks_sift_100k_7ROI.tck template_tracks_sift_100k_7ROI_${STEPSIZE}mm.tck

# -nointerp is needed because interpolating between unqiue voxel IDs doesn't make any sense

tcksample template_tracks_sift_100k_7ROI_${STEPSIZE}mm.tck -nointerp -nthreads 0 idmap.nii.gz template_tracks_sift_100k_7ROI_${STEPSIZE}mm_idmapped.txt
