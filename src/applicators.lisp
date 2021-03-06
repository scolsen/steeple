(defpackage steeple.applicators
    (:use :cl)
    (:import-from :steeple.core
                  :flatten)
    (:export :partial-l
             :partial-r
             :chain-l))

(in-package steeple.applicators)

(defun partial-l (fn &rest arguments)
    (lambda (&rest args2) (apply fn (append arguments args2))))

(defun partial-r (fn &rest arguments)
    (lambda (&rest arguments2) (apply fn (append arguments2 arguments))))

(defun chain-l (fns &rest args) 
    (if (null fns) 
        (steeple.core:flatten args) ;we need to flatten here.
        (chain-l (cdr fns) (apply (car fns) args))))

