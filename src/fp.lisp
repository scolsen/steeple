(defpackage :steeple.fp
    (:use :cl)
    (:export :partial-l
             :partial-r
             :gate
             :deep-map))

(defun partial-l (fn &rest arguments)
    (lambda (&rest args2) (apply fn (append arguments args2))))

(defun partial-r (fn &rest arguments)
    (lambda (&rest arguments2) (apply fn (append arguments2 arguments))))

(defun gate (predicate function1 function2) 
    (lambda (x) 
        (if (funcall predicate x) 
            (funcall function1 x) 
            (funcall function2 x))))

(defun is-non-empty-list? (x) 
    (and (listp x) (not (null x))))

(defun gate-map (predicate function1 function2 arguments)
    (mapcar (gate predicate function1 function2) arguments))

(defun deep-map (fn arguments)
    (mapcar (gate #'is-non-empty-list? (partial-l #'deep-map fn) fn) arguments)) 
