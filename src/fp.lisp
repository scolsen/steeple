(defpackage steeple.fp
    (:use :cl)
    (:import-from :steeple.predicates
                  :non-empty-list?)
    (:export :thunk
             :gate
             :deep-seq
             :accumulator
             :accumulate-n
             :summarize))

(in-package :steeple.fp)

(defun thunk (x) 
    (lambda () x))

(defun gate (predicate function1 function2) 
    (lambda (x) 
        (if (funcall predicate x) 
            (funcall function1 x) 
            (funcall function2 x))))

(defun gate-map (predicate function1 function2 arguments)
    (mapcar (gate predicate function1 function2) arguments))

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

;;; A generator is one or more accumulators with some rules attached on how to combine them (perform a merge of accumulations).

;(defun generator (name binary-fn initial-value &key predicate handler)
;  (setf (symbol-function name) 
;        (let ((x initial-value)) 
;              (cond (predicate handler) 
;                    () 
;                    (t t))))

;(defun flatten (items) 
;    (let ((result nil)) 
;         (lambda () 
;                 (cond ((#'steeple.predicates:non-empty-list? (car items)) t) 
;                       ((atom (car items)) (cons x result))
;                       (t t))))
