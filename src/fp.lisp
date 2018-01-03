(defpackage steeple.fp
    (:use :cl)
    (:import-from :steeple.predicates
                  :non-empty-list?)
    (:export :partial-l
             :partial-r
             :thunk
             :gate
             :deep-map))

(in-package :steeple.fp)

(defun partial-l (fn &rest arguments)
    (lambda (&rest args2) (apply fn (append arguments args2))))

(defun partial-r (fn &rest arguments)
    (lambda (&rest arguments2) (apply fn (append arguments2 arguments))))

(defun thunk (x) 
    (lambda () x))

(defun gate (predicate function1 function2) 
    (lambda (x) 
        (if (funcall predicate x) 
            (funcall function1 x) 
            (funcall function2 x))))

(defun gate-map (predicate function1 function2 arguments)
    (mapcar (gate predicate function1 function2) arguments))

(defun deep-map (fn arguments)
    (mapcar (gate #'steeple.predicates:non-empty-list? (partial-l #'deep-map fn) fn) arguments)) 
