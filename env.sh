  export PROTEUS=$PWD #or wherever you put it
  export PROTEUS_ARCH=linux2-scorec
  export PROTEUS_PREFIX=${PROTEUS}/$PROTEUS_ARCH
  export PROTEUS_PYTHON=$PWD/linux2-scorec/bin/python2.7
  export LD_LIBRARY_PATH=$PROTEUS/linux2-scorec/lib:$LD_LIBRARY_PATH
  export LD_LIBRARY_PATH=$PROTEUS/build/lib.linux-x86_64-2.7/proteus:$LD_LIBRARY_PATH
  export PROTEUS_MPRANS=$PWD/proteus-mprans
  export SCOREC_INSTALL=/fasttmp/chitak/ProtoScorec/proteus/SCOREC/install-acis
  export LD_LIBRARY_PATH=$SCOREC_INSTALL/lib:$LD_LIBRARY_PATH
  export MPI_DIR=/usr/local/openmpi/latest
  export PATH=$PROTEUS_MPRANS/scripts:$PATH
  export PATH=$PROTEUS/custom_installs/python/Python-2.7.6:$PATH
  export LD_LIBRARY_PATH=$PROTEUS/custom_installs/python/Python-2.7.6:$LD_LIBRARY_PATH
  export PATH=$PROTEUS/scripts:$PATH
  export PYTHONPATH=$PROTEUS/linux2-scorec/lib/python2.7:$PYTHONPATH
  export PYTHONPATH=$PROTEUS/linux2-scorec/lib/python2.7/site-packages:$PYTHONPATH
  export PYTHONPATH=$PROTEUS_MPRANS/build/lib.linux-x86_64-2.7/proteus/mprans:$PYTHONPATH
  export PYTHONPATH=$PROTEUS/custom_installs/memprof/memory_profiler-0.31/build/lib:$PYTHONPATH
 # export PYTHONPATH=$PROTEUS/heapy/guppy-0.1.10/build/lib.linux-x86_64-2.7/guppy:$PYTHONPATH
