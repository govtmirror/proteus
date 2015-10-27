# distutils: language = c++

from cpython.ref cimport PyObject
cimport numpy as np
import numpy as np

cdef extern from "mesh.h":
    struct Mesh:
       pass

cdef extern from "cmeshToolsModule.h":
    ctypedef struct CMesh:
        Mesh mesh


cdef extern from "MeshAdaptPUMI/MeshAdaptPUMI.h":
    cdef cppclass MeshAdaptPUMIDrvr:
        MeshAdaptPUMIDrvr(double, double, int)
        int numIter, numAdaptSteps
        int loadModelAndMesh(char *, char*)
        int ConstructFromSerialPUMIMesh(Mesh&)
        int ConstructFromParallelPUMIMesh(Mesh&, Mesh&)
        int UpdateMaterialArrays(Mesh&, int, int)
        int TransferSolutionToPUMI(double*, int, int)
        int TransferSolutionToProteus(double*, int, int)
        int TransferPropertiesToPUMI(double*, double*)
        int TransferBCtagsToProteus(int*, int, int*, int*)
        int TransferBCsToProteus()
        int AdaptPUMIMesh()
        int dumpMesh(Mesh&)
        int getERMSizeField(double)
        double getMinimumQuality()

cdef class MeshAdaptPUMI:
    cdef MeshAdaptPUMIDrvr *thisptr
    cdef double hmax, hmin
    cdef int numIter, numAdaptSteps
    def __cinit__(self, hmax=100.0, hmin=1e-8, numIter=10):
        print hmax,hmin,numIter
        self.thisptr = new MeshAdaptPUMIDrvr(hmax, hmin, numIter)
    def __dealloc__(self):
        del self.thisptr
    def loadModelAndMesh(self, geomName, meshName):
        return self.thisptr.loadModelAndMesh(geomName, meshName)
    def ConstructFromSerialPUMIMesh(self, cmesh):
        cdef CMesh* cmesh_ptr = <CMesh*>cmesh
        return self.thisptr.ConstructFromSerialPUMIMesh(cmesh_ptr.mesh)
    def ConstructFromParallelPUMIMesh(self, cmesh, subdomain_cmesh):
        cdef CMesh* cmesh_ptr = <CMesh*>cmesh
        cdef CMesh* subdomain_cmesh_ptr = <CMesh*>subdomain_cmesh
        return self.thisptr.ConstructFromParallelPUMIMesh(cmesh_ptr.mesh, subdomain_cmesh_ptr.mesh)
    def UpdateMaterialArrays(self, cmesh, bdryId, geomTag):
        cdef CMesh* cmesh_ptr = <CMesh*>cmesh
        return self.thisptr.UpdateMaterialArrays(cmesh_ptr.mesh, bdryId, geomTag)
    def TransferSolutionToPUMI(self, np.ndarray[np.double_t,ndim=2,mode="c"] inArray):
        inArray = np.ascontiguousarray(inArray)
        return self.thisptr.TransferSolutionToPUMI(&inArray[0,0], inArray.shape[0], inArray.shape[1])
    def TransferSolutionToProteus(self, np.ndarray[np.double_t,ndim=2,mode="c"] outArray):
        outArray = np.ascontiguousarray(outArray)
        return self.thisptr.TransferSolutionToProteus(&outArray[0,0], outArray.shape[0], outArray.shape[1])
    def TransferPropertiesToPUMI(self, np.ndarray[np.double_t,ndim=1,mode="c"] rho, np.ndarray[np.double_t,ndim=1,mode="c"] nu):
        rho = np.ascontiguousarray(rho)
        nu = np.ascontiguousarray(nu)
        return self.thisptr.TransferPropertiesToPUMI(&rho[0],&nu[0])
    def TransferBCtagsToProteus(self, np.ndarray[int,ndim=2,mode="c"] tagArray, int idx, np.ndarray[int,ndim=1,mode="c"] ebN, np.ndarray[int, ndim=2, mode="c"] eN_global):
        tagArray = np.ascontiguousarray(tagArray)
        ebN = np.ascontiguousarray(ebN)
        eN_global = np.ascontiguousarray(eN_global)
        return self.thisptr.TransferBCtagsToProteus(&tagArray[0,0],idx,&ebN[0],&eN_global[0,0])
    def TransferBCsToProteus(self):
        return self.thisptr.TransferBCsToProteus()
    def AdaptPUMIMesh(self):
        return self.thisptr.AdaptPUMIMesh()
    def dumpMesh(self, cmesh):
        cdef CMesh* cmesh_ptr = <CMesh*>cmesh
        return self.thisptr.dumpMesh(cmesh_ptr.mesh)
    def getERMSizeField(self, err_total):
        return self.thisptr.getERMSizeField(err_total);