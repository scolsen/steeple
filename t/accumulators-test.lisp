(in-package :cl-user)
(defpackage accumulators-test
    (:use :cl 
          :prove
          :steeple.accumulators))
(in-package :accumulators-test)

(subtest "Basic accumulator"
    (steeple.accumulators:accumulator 'testacc #'+ 0)
    (is-type #'testacc 'compiled-function))
