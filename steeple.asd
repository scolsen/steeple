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
                       (:file "guards")
                       (:file "applicators")
                       (:file "accumulators")
                       (:file "reducers")
                       (:file "mappers")
                       (:file "fp")
                       (:file "operators")))))
