(defpackage steeple.asd
    (:use :cl :asdf))

(defsystem steeple
    :version "1.0"
    :author "Scott Olsen"
    :license "MIT"
    :serial t
    :components ((:module "src"
                  :components 
                      ((:file "predicates")
                       (:file "fp")
                       (:file "operators")))))
