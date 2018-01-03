(defpackage :steeple.operators
    (:use :cl)
    (:import-from :steeple.fp
                  :partial-l
                  :partial-r)
    (:export :>>
             :<<
             :>*
             :->))

(setf >> #'partial-l 
      << #'partial-r
      >* #'mapcar
      -> #'apply)
