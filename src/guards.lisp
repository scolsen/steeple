(defpackage steeple.guards 
    (:use :cl)
    (:export :guard))

(in-package :steeple.guards)

(defmacro guard (predicates bodies default) 
    (labels ((recur (p b forms carp carb) 
                    (cond ((null p) `(lambda () (cond ,@forms (t ,default)))) 
                          (t (recur (cdr p) 
                                    (cdr b) 
                                    (append forms (list `(,carp ,carb)))
                                    (car (cdr p))
                                    (car (cdr b))))))) 
            (recur predicates bodies nil (car predicates) (car bodies))))

