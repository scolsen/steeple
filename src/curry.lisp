(defpackage steeple.curry
    (:use :cl)
    (:export :partial-l
             :partial-r
             :chain-l))

(in-package steeple.curry)

(defun partial-l (fn &rest arguments)
    (lambda (&rest args2) (apply fn (append arguments args2))))

(defun partial-r (fn &rest arguments)
    (lambda (&rest arguments2) (apply fn (append arguments2 arguments))))

(defun chain-l (fns &rest args) 
    (if (null fns) 
        args 
        (chain-l (cdr fns) (apply (car fns) args))))

