(defpackage steeple.fp
    (:use :cl)
    (:import-from :steeple.predicates
                  :non-empty-list?)
    (:export :partial-l
             :partial-r
             :thunk
             :gate
             :deep-map
             :sequence-map
             :deep-seq
             :accumulator
             :summarize))

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

(defun sequence-map (fns arguments) 
    (if (null fns) 
        arguments 
        (sequence-map (cdr fns) (mapcar (lambda (x) (funcall (car fns) x)) arguments))))    

(defun deep-seq (fns arguments)
    (if (null fns) 
        arguments 
        (deep-seq (cdr fns) (deep-map (car fns) arguments))))

(defun andf (t-val-one t-val-two) 
    "Common lisp's and is a control structure. andf is a function and can thus be passed to map or reduce."  
    (if (and t-val-one t-val-two)
        t
        nil))
 
(defun orf (t-one t-two) 
    "Common lisp's or is a control structure. orf is a function and can thus be passed to map or reduce."  
    (if (or t-one t-two)
        t
        nil))

(defun accumulator (name binary-fn initial-value) 
    "Define a new accumlator function. A binary function that memorizes and accumulates some value."
    (setf (symbol-function name) 
          (let ((x initial-value)) 
               (lambda (&rest y) (setf x (apply binary-fn (append (list x) y)))))))

(defun summarize (accum predicate arguments) 
    (let ((self (partial-l #'summarize accum predicate))) 
         (if (funcall predicate (funcall accum)) 
             (funcall accum)
             (progn (funcall accum (car arguments)) (summarize accum predicate (cdr arguments))))))
