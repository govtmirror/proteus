./config/configure.py --prefix=${PROTEUS_PREFIX} --with-pic \
--with-mpi-dir="/opt/cray/mpt/5.1.2/xt/gemini/mpich2-gnu/" \
--with-shared --with-dynamic \
--with-blas-lapack-lib=\[/opt/acml/4.4.0/gnu64/lib/libacml.so\] \
--with-clanguage=C \
--download-parmetis=ifneeded \
--download-blacs=ifneeded \
--download-scalapack=ifneeded \
--download-mumps=ifneeded \
--download-superlu=ifneeded \
--download-superlu_dist=ifneeded \
--download-hypre=ifneeded
