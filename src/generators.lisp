(defpackage steeple.generators
    (:use :cl)
    (:import-from :steeple.applicators
                  :chain-l)
    (:import-from :steeple.predicates
                  :non-empty-list?)
    (:import-from :steeple.mappers
                  :smap)
    (:export :generator))

(in-package :steeple.generators)

(defun generator (name fn initial-value priors &key (apply-init nil apply-init?)) 
    (setf (symbol-function name) 
          (let ((x (if apply-init? (steeple.applicators:chain-l priors initial-value) initial-value))) 
               (lambda (&rest y) 
                       (if (steeple.predicates:non-empty-list? y)
                           (setf x (apply fn (append (list x) (steeple.mappers:smap priors y))))
                           x)))))


