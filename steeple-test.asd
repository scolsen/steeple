#| 
  Tests for the steeple system. 
|#

(defsystem "steeple-test"
    :description "Unit tests for the steeple system."
    :defsystem-depends-on (:steeple :prove)
    :pathname "t/")
