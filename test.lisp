#-quicklisp (print "This script requires quicklisp. Please install quicklisp.")
(load "init.lisp")

(defun test-all () 
    (progn (prove:run #P"t/accumulators-test.lisp")))

(defun test (x) 
    (cond ((= x "accumulators") (prove:run #P"t/accumulators-test.lisp")) 
          (t (format t "Could not find test for: ~a" x))))
