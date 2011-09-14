include ${PROTEUS_PREFIX}/conf/variables

ARCHIVE_SUFFIX = .a

#setup options/compilers using petsc configuration

INCLUDES = -I${DAETK_DIR} -I${DAETK_DIR}/pete/pete-2.1.0/src -I${DAETK_DIR}/pdetk ${PETSC_INCLUDE}

CXX      = CC -fPIC
CXXFLAGS = -DF77_POST_UNDERSCORE -DUSE_BLAS -DCMRVEC_BOUNDS_CHECK -DMV_VECTOR_BOUNDS_CHECK -DPETSCVEC_BOUNDS_CHECK ${PETSC_CCPPFLAGS}

CC      = cc -fPIC
CCFLAGS = ${PETSC_CCPPFLAGS}

FC = ftn -fPIC
FCFLAGS = ${PETSC_FCPPFLAGS}

LD = CC -fPIC
LDFLAGS = ${PCC_LINKER_FLAGS} 
LDLIBS  = ${PETSC_LIB}

ARFLAGS = -cru
AR = ar
RANLIB = ranlib

RM = /bin/rm -f
FILESTOCLEAN = *~ *.o *.I *.bak *.old *.ii core

MAKEDEPEND = makedepend
MAKEDEPENDFLAGS =

MV = mv -f
CP = cp -f

PREFIX = ${PROTEUS_PREFIX}













