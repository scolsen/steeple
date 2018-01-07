# Guard Syntax

Because guards are used for function definition, they require special syntax:

```common-lisp
(guard (predicate-forms) (body-forms) (default form))
(guard ((evenp 2) (oddp 1)) ((+ 1 2) (* 8 9)) (* 3 4))
```

## Example Function

The following example uses guard to define a function:

```common-lisp
(defun test-guard (x y) 
    (guard ((evenp x)) ((+ x y)) (* 8 8)))

(test-guard 2) => 3
(test-guard 5) => 64
```
