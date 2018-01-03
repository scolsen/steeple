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

(setf (symbol-function :>>) #'steeple.fp:partial-l 
      (symbol-function :<<) #'steeple.fp:partial-r
      (symbol-function :>*) #'mapcar
      (symbol-function :->) #'apply)
