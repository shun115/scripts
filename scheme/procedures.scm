(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))
    ))

(define lat?
  (lambda (x)
    (cond
     ((null? x) #t)
     ((atom? (car x)) (lat? (cdr x)))
     (else #f))))

(define member?
  (lambda (x lat)
    (cond
     ((null? lat) #f)
     (else (or (eq? (car lat) x)
	       (member? x (cdr lat))
	       )))))

(define rember
  (lambda (x lat)
    (cond 
     ((null? lat) '())
     ((eq? x (car lat)) (cdr lat))
     (else (cons (car lat) (rember x (cdr lat))))
     )))

(define firsts
  (lambda (x)
    (cond
     ((null? x) '())
     (else (cons (car (car x)) (firsts (cdr x))))
     )))

(define insertR
  (lambda (n o l)
    (cond
     ((null? l) '())
     (else
      (cond
       ((eq? (car l) o) (cons o (cons n (cdr l))))
       (else (cons (car l) (insertR n o (cdr l))))
       )))))

(define insertL
  (lambda (n o l)
    (cond
     ((null? l) '())
     (else
      (cond
       ((eq? (car l) o) (cons n  l))
       (else (cons (car l) (insertR n o (cdr l))))
       )))))

(define subst
  (lambda (new old lat)
    (cond ((null? lat) '())
	  (else (cond
		 ((eq? (car lat) old) (cons new (cdr lat)))
		 (else (cons (car lat) (subst new old (cdr lat))))
		 )))))
