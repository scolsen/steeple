(defpackage steeple.operators
    (:use :cl)
    (:import-from :steeple.fp
                  :partial-l
                  :partial-r)
    (:export :>>
             :<<
             :>*
             :->))

(in-package :steeple.operators)

(setf >> #'steeple.fp:partial-l 
      << #'steeple.fp:partial-r
      >* #'mapcar
      -> #'apply)
