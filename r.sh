#!/usr/bin/bash

echo "Giving required permissions"
sudo chmod -R a+rw .

echo "# Removing old polyMesh"
[ -d $(pwd)/constant/polyMesh ] && rm -r $(pwd)/constant/polyMesh
[ -d $(pwd)/0/polyMesh ] && rm -r $(pwd)/0/polyMesh

echo "Clearing old junks"
./d.sh

echo "Generating blockMesh"
blockMesh

echo "Creating snappyHexMesh"
snappyHexMesh -overwrite

echo ""
echo "Refining Process Starting"
n=3
for ((i=1; i<=n; i++)); do
	echo "=== Refinement Step $i of $n ==="
	topoSet
	refineMesh -overwrite
done
echo "Refinement Complete"

echo ""
echo "Splitting the Processes"
decomposePar

echo "Starting Solver"
mpirun -np $(nproc) pimpleFoam -parallel

echo ""
echo "Combining the Processes"
reconstructPar

find . -mindepth 1 -name ".*" -exec rm -rfv {} +
echo "All dotfiles are removed"
echo ""

foamToVTK
echo ""
echo "Required VTK was generated"


sudo chmod -R a+rw .
echo "Permissions to modify all directories are given"

echo ""
echo "--- End ---"


