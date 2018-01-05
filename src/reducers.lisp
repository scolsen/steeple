(defpackage steeple.reducers
    (:use :cl)
    (:import-from :steeple.applicators
                  :partial-l
                  :chain-l)
    (:import-from :steeple.accumulators
                  :accumulator)
    (:import-from :steeple.mappers
                  :smap)
    (:export :summarize
             :flatten))

(in-package :steeple.reducers)

(defun summarize (accum predicate arguments)
    (cond ((funcall predicate (funcall accum)) (funcall accum)) 
          (t (funcall accum (car arguments)) (summarize accum predicate (cdr arguments)))))

(defun flatten (items)
	(labels ((rec (items acc)
		(cond ((null items) acc)
			((atom items) (cons items acc))
			(t (rec (car items) (rec (cdr items) acc))))))
		(rec items nil)))
