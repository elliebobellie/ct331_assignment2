#lang racket

(provide ins_beg)
(provide ins_end)
(provide count_top_level)
(provide count_instances)
(provide count_instances_tr_helper)
(provide count_instances_tr)
(provide count_instances_deep)

;(A)
(define (ins_beg el lst)
  (cons el lst))

;Test for (A)
(ins_beg 'a '(b c d))
(ins_beg '(a b) '(b c d))

;(B)
(define (ins_end el lst)
  (append lst (list el)))

;Test for (B)
(ins_end 'a '(b c d))
(ins_end '(a b) '(b c d))

;(C)
(define (count_top_level list)
  (cond ((null? list) 0)

        (else(+ 1 (count_top_level (cdr list))))
        )
 )

;(D)
(define (count_instances at list)
  (cond ((null? list) 0)

        ((= at (car list)) (+ 1 (count_instances at (cdr list))))

        ((count_instances at (cdr list)))
   )
 )

;(E)
(define (count_instances_tr_helper at list)
  (count_instances_tr at list 0)
 )

(define (count_instances_tr at list total)
  (cond ((null? list) total)

        ((= at (car list)) (count_instances_tr at (cdr list) (+ total 1)))

        (else (count_instances_tr at (cdr list) total) )
        )
 )

;(F)
(define (count_instances_deep at list)
  (cond ((empty? list) 0)
        
        ((list? (car list)) (+ (count_instances_deep at (car list)) (count_instances_deep at (cdr list))))
     
        ((equal? at (car list)) (+  1 (count_instances_deep at (cdr list))))
        
        (else (count_instances_deep at (cdr list)))
        )
  )


