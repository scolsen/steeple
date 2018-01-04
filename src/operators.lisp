(defpackage steeple.operators
    (:use :cl)
    (:import-from :steeple.curry
                  :partial-l
                  :partial-r)
    (:export :>>
             :<<
             :>*
             :->))

(in-package :steeple.operators)

(setf (symbol-function :>>) #'steeple.curry:partial-l 
      (symbol-function :<<) #'steeple.curry:partial-r
      (symbol-function :>*) #'mapcar
      (symbol-function :->) #'apply)
