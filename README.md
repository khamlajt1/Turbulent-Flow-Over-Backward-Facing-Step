# Turbulent-Flow-Over-Backward-Facing-Step

The file backward-facing-step.geo contains the source file of the grid. To create the grid, open the backward-facing-step.geo file then type in the terminal, gmsh backward-facing-step.geo and create 3D mesh and then save the file as .msh.

Go to the directory where you saved the case file and Type gmshToFoam backward-facing-step.msh in the terminal. Then ./Allprepare in the terminal to adjust the boundary conditions. Finally, on the same terminal type mpirun -np 24 simpleFoam -parallel > log.simpleFoam. Note the number 24 corresponds to the number of cores I have! You can also plot the residual on the fly by opening a new terminal and typing gnuplot Residual in the directory where you saved youe case file.
