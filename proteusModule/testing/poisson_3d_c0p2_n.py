from proteus import *
from proteus.default_n import *
from poisson_3d_p import *
hex=None
#steady-state so no time integration
timeIntegration = NoIntegration
#number of output timesteps
nDTout = 1

#finite element spaces
femSpaces = {0:C0_AffineQuadraticOnSimplexWithNodalBasis}
#numerical quadrature choices
elementQuadrature = SimplexGaussQuadrature(nd,4)
elementBoundaryQuadrature = SimplexGaussQuadrature(nd-1,4)

#number of nodes in x,y,z
nnx = 11
nny = 11
nnz = 11
#if unstructured would need triangleOptions flag to be set


#number of levels in mesh
nLevels = 1

#no stabilization or shock capturing    
subgridError = None

shockCapturing = None

#nonlinear solver choices
multilevelNonlinearSolver  = Newton
levelNonlinearSolver = Newton
#linear problem so force 1 iteration allowed
maxNonlinearIts = 1
maxLineSearches = 1
fullNewtonFlag = True
#absolute nonlinear solver residual tolerance
nl_atol_res = 1.0e-8
#relative nonlinear solver convergence tolerance as a function of h
#(i.e., tighten relative convergence test as we refine)
tolFac = 0.0

#matrix type
matrix = SparseMatrix

#convenience flag 
parallel = False

if parallel:
    multilevelLinearSolver = KSP_petsc4py#o rPETSc
    #for petsc do things lie
    #"-ksp_type cg -pc_type asm -pc_asm_type basic -ksp_atol  1.0e-10 -ksp_rtol 1.0e-10 -ksp_monitor_draw" or
    #-pc_type lu -pc_factor_mat_solver_package
    #can also set -pc_asm_overlap 2 with default asm type (restrict)
    levelLinearSolver = KSP_petsc4py#PETSc#
    #pick number of layers to use in overlap 
    nLayersOfOverlapForParallel = 1
    #type of partition
    #parallelPartitioningType = MeshParallelPartitioningTypes.node
    parallelPartitioningType = MeshParallelPartitioningTypes.element
    #have to have a numerical flux in parallel
    numericalFluxType = Advection_DiagonalUpwind_Diffusion_IIPG_exterior
    #for true residual test
    #linearSolverConvergenceTest = 'r-true'
    #to allow multiple models to set different ksp options
    #linear_solver_options_prefix = 'poisson_'
    linearSmoother = None
else:
    multilevelLinearSolver = LU
    levelLinearSolver = LU
    numericalFluxType = Advection_DiagonalUpwind_Diffusion_IIPG_exterior

#linear solver relative convergence test
linTolFac = 0.0
#linear solver absolute convergence test
l_atol_res = 1.0e-10

conservativeFlux =  {0:'pwl'}

