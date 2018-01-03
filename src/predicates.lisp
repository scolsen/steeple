(defpackage steeple.predicates
    (:use :cl)
    (:export :non-empty-list?))

(in-package :steeple.predicates)

(defun non-empty-list? (x) 
    (and (listp x) (not (null x))))
