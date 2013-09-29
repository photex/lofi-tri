;;;; lofi-tri.asd

(asdf:defsystem #:lofi.tri
  :serial t
  :description "Simple system to provide graphs of various kinds. Useful for certain purposes."
  :author "photex@lofidelitygames.com"
  :license "MIT"
  :depends-on (#:cl-graph
               #:sb-cga
               #:alexandria)
  :components ((:file "package")
               (:file "lofi.tri")))

