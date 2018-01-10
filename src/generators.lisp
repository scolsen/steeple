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

(defun generator (name fn initial-value priors &key (init nil init?)) 
    (declare (ignore init))
    (setf (symbol-function name) 
          (let ((x (if init? (steeple.applicators:chain-l priors initial-value) initial-value))) 
               (lambda (&rest y) 
                       (if (steeple.predicates:non-empty-list? y)
                           (setf x (apply fn (append (list x) (steeple.mappers:smap priors y))))
                           x)))))


