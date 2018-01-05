(defpackage steeple.operators
    (:use :cl)
    (:import-from :steeple.applicators
                  :partial-l
                  :partial-r)
    (:export :>>
             :<<
             :>*
             :->))

(in-package :steeple.operators)

(setf (symbol-function :>>) #'steeple.applicators:partial-l 
      (symbol-function :<<) #'steeple.applicators:partial-r
      (symbol-function :>*) #'mapcar
      (symbol-function :->) #'apply)
