(defpackage steeple.mappers
    (:use :cl)
    (:import-from :steeple.predicates
                  :non-empty-list?)
    (:export :dmap
             :smap
             :pmap))

(in-package :steeple.mappers)

;deep-map
(defun dmap (fn arguments) 
    (mapcar (lambda (x) 
        (cond ((steeple.predicates:non-empty-list? x) (dmap fn x)) 
              (t (funcall fn x)))) arguments))
;sequence-map
(defun smap (fns arguments &key (shallow nil shallow?)) 
    (declare (ignore shallow))
    (cond ((null fns) arguments) 
          (shallow? (smap (cdr fns) (mapcar (lambda (x) (funcall (car fns) x)) arguments)))
          (t (smap (cdr fns) (dmap (car fns) arguments)))))
;pattern-map
(defun pmap (fn predicate arguments &key (shallow nil shallow?)) 
    (declare (ignore shallow))
    (cond (shallow? (mapcar (lambda (x) 
        (if (funcall predicate x) (funcall fn x) (identity x))) arguments)) 
          (t (dmap (lambda (x) 
              (if (funcall predicate x) (funcall fn x) (identity x))) arguments))))
