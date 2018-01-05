(defpackage steeple.reducers
    (:use :cl)
    (:import-from :steeple.applicators
                  :partial-l)
    (:export :summarize))

(in-package :steeple.reducers)

(defun summarize (accum predicate arguments)
    (cond ((funcall predicate (funcall accum)) (funcall accum)) 
          (t (funcall accum (car arguments)) (summarize accum predicate (cdr arguments)))))
