#!/bin/bash


temp_dir='[set/path/.arc_temp]'
scratch_workspace=$(mktemp -d -p $temp_dir)

function cleanup {
	rm -rf "$scratch_workspace"
}

trap cleanup EXIT

module load apptainer 

## Create Overlay
overlay_size=10000  ## MB
overlay=${scratch_workspace}/overlay

apptainer overlay create --size $overlay_size --sparse $overlay

arc_img='[set/path/arcgis_hpc_rockylinux_username.sif]'

## Create log file so Xvfb will work
log_file=${scratch_workspace}/log.txt

## container command
## changes file and dir arguements to full path.
all_args=( )
for argv in "$@"
do
	if [[ -f ${argv} ]] || [[ -d ${argv} ]]; then
		argv=$(realpath "${argv}")
	fi
	all_args+=(${argv})
done

set -- "${all_args[@]}"
echo $@

(cd $scratch_workspace && exec apptianer run --overlay ${overlay} $arc_img "$@" 2>&1 | tee $log_file)


