(defpackage steeple.asd
    (:use :cl :asdf))

(defsystem steeple
    :version "1.0"
    :author "Scott Olsen"
    :license "MIT"
    :components ((:module "src"
                  :serial t
                  :components 
                      ((:file "predicates")
                       (:file "core")
                       (:file "guards")
                       (:file "applicators")
                       (:file "mappers")
                       (:file "accumulators")
                       (:file "generators")
                       (:file "reducers")
                       (:file "operators")))))
