# Guard Syntax

Because guards are defined as a macro used for function definition, they require special syntax:

```common-lisp
(guard (predicate-forms) (body-forms) (default-form))
(guard ((evenp 2) (oddp 1)) ((+ 1 2) (* 8 9)) (* 3 4))
```
The preceding invocation results in the following form:
```common-lisp
(lambda () 
    (cond ((evenp 2) (+ 1 2)) 
          ((oddp 1) (* 8 9)) 
          (t (* 3 4))))
```


## Example Function

The following example shows how to use guard to define a function.

Notice the lambda closure provided by guard grants access to the function's arguments:
```common-lisp
(defun test-guard (x y) 
    (guard ((evenp x)) ((+ x y)) (* 8 8)))

(test-guard 2 1) => 3
(test-guard 5 1) => 64
```
