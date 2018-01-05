(defpackage steeple.guards 
    (:use :cl)
    (:export :guard))

(in-package :steeple.guards)

;(defmacro guard (pred-bodies default) 
;    (let ((forms))
;        (cond ((null pred-bodies) `(cond ,@forms (t ,default))) 
;              (t (setf forms (append forms `(((,(car pred-bodies)) (,(car (cdr(pred-bodies)))))))))
;      ))
;
;(defmacro guard (pred-bodies defualt) 
;    (let ((forms)) 
;        (lambda () ())))
