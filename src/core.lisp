(defpackage steeple.core
    (:use :cl)
    (:import-from :steeple.predicates
                  :non-empty-list?)
    (:export :thunk
             :flatten
             :gate))

(in-package :steeple.core)

(defun thunk (x) 
    (lambda () x))

(defun gate (predicate function1 function2) 
    (lambda (x) 
        (if (funcall predicate x) 
            (funcall function1 x) 
            (funcall function2 x))))

(defun gate-map (predicate function1 function2 arguments)
    (mapcar (gate predicate function1 function2) arguments))

(defun andf (t-one t-two) 
    "Common lisp's and is a control structure. andf is a function and can thus be passed to map or reduce."  
    (if (and t-one t-two)
        t
        nil))
 
(defun orf (t-one t-two) 
    "Common lisp's or is a control structure. orf is a function and can thus be passed to map or reduce."  
    (if (or t-one t-two)
        t
        nil))

(defun flatten (items)
	(labels ((rec (items acc)
		(cond ((null items) acc)
			((atom items) (cons items acc))
			(t (rec (car items) (rec (cdr items) acc))))))
		(rec items nil)))
