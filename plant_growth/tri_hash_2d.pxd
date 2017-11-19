from cymem.cymem cimport Pool

ctypedef unsigned int uint

cdef struct Entry:
    int key
    Entry *next

cdef class TriHash2D:
    cdef Pool mem
    cdef double cell_size
    cdef int world_size, l, size, dim_size
    cdef Entry **bins

    # cdef void initialize(self)
    cdef uint tri_bucket(self, double a[2], double b[2], double c[2])
    cdef void add_tri(self, int key, double a[2], double b[2], double c[2]) except *
    cdef int neighbors(self, double a[2], int[:] results)  except *

