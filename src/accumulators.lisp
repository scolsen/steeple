(defpackage steeple.accumulators
    (:use :cl)
    (:import-from :steeple.predicates
                  :non-empty-list?)
    (:import-from :steeple.applicators
                  :partial-l
                  :chain-l)
    (:import-from :steeple.mappers
                  :smap)
    (:export :accumulator
             :list-accumulator
             :accumulate-n))

(in-package steeple.accumulators)

(defun accumulator (name binary-fn initial-value) 
    (setf (symbol-function name) 
          (let ((x initial-value)) 
               (lambda (&rest y) 
                       (if (steeple.predicates:non-empty-list? y) 
                           (setf x (apply binary-fn (append (list x) y))) 
                           x)))))

(defun accumulate-n (accum n &rest arguments) 
    (let ((fn)) (if (steeple.predicates:non-empty-list? arguments) 
          (setf fn (apply #'steeple.applicators:partial-l accum arguments)) 
          (setf fn accum))
      (dotimes (num n) 
          (funcall fn))) (funcall accum))

