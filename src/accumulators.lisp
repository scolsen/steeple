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
             :accumulate-n
             :generator))

(in-package steeple.accumulators)

(defun accumulator (name binary-fn initial-value) 
    (setf (symbol-function name) 
          (let ((x initial-value)) 
               (lambda (&rest y) 
                       (if (steeple.predicates:non-empty-list? y) 
                           (setf x (apply binary-fn (append (list x) y))) 
                           x)))))

(defun generator (name fn initial-value priors &key (apply-init nil apply-init?)) 
    (setf (symbol-function name) 
          (let ((x (if apply-init? (chain-l priors initial-value) initial-value))) 
               (lambda (&rest y) 
                       (if (steeple.predicates:non-empty-list? y)
                           (setf x (apply fn (append (list x) (smap priors y))))
                           x)))))

(defun accumulate-n (accum n &rest arguments) 
    (let ((fn)) (if (steeple.predicates:non-empty-list? arguments) 
          (setf fn (apply #'steeple.applicators:partial-l accum arguments)) 
          (setf fn accum))
      (dotimes (num n) 
          (funcall fn))) (funcall accum))

