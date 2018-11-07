#lang racket

(provide ins_beg)
(provide ins_end)
(provide count_top_level)
(provide count_instances)

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
        (else(+1 (count_top_level (cdr list))))
        )
 )

;(D)
(define (count_instances at list)
  (cond ((null? list) 0)
        ((= at (car list)) (+1 (count_instances at (cdr list))))
        ((count_instances at (cdr list)))
   )
 )

;(E)


