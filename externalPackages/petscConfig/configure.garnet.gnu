${PROTEUS_PYTHON} ./config/configure.py --prefix=${PROTEUS_PREFIX} \
--useThreads=0 \
--PETSC_ARCH=${PROTEUS_ARCH} \
--PETSC_DIR=${PROTEUS}/externalPackages/petsc \
--with-clanguage=C \
--with-cc="cc" \
--with-cxx="CC" \
--with-fc="ftn" \
--with-shared-libraries=0 \
--with-pic=1 \
--with-blas-lapack-lib=[/opt/acml/4.4.0/gnu64/lib/libacml.so] \
--download-cmake=1 \
--download-metis=1 \
--download-parmetis=1 

#\
#--download-blacs=1 \
#--download-scalapack=1 \
#--download-mumps=1 \
#--download-superlu=1 \
#--download-superlu_dist=1 \
#--download-hypre=1
