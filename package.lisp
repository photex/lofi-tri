;;;; package.lisp

(defpackage #:lofi-tri
  (:use #:cl #:sb-cga)
  (:import-from #:alexandria #:curry)
  (:export #:circle
           #:triangle
           #:random-point
           #:random-point-array
           #:sort-by-x
           #:sort-by-y
           #:sort-by-z
           #:distance
           #:midpoint
           #:circumcircle
           #:in-circumcircle?
           #:has-shared-verts?
           #:triangulate))



