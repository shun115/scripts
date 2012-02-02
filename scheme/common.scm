(use slib)
(require 'trace)

(define true #t)
(define false #f)

(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
    (+ (* a 1000000) b)))
