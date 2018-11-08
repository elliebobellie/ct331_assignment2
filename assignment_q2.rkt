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

;(B)
(define (ins_end el lst)
  (append lst (list el)))

;(C)
(define (count_top_level list)
  (cond ((null? list) 0)
        (else(+ 1 (count_top_level (cdr list)))))
 )

;(D)
(define (count_instances item list)
  (cond ((null? list) 0)
        ((= item (car list)) (+ 1 (count_instances item (cdr list))))
        ((count_instances item (cdr list))))
 )

;(E)
(define (count_instances_tr_helper item list)
  (count_instances_tr item list 0)
 )

(define (count_instances_tr item list total)
  (cond ((null? list) total)
        ((= item (car list)) (count_instances_tr item (cdr list) (+ total 1)))
        (else (count_instances_tr item (cdr list) total) ))
 )

;(F)
(define (count_instances_deep item list)
  (cond ((empty? list) 0)
        ((list? (car list)) (+ (count_instances_deep item (car list)) (count_instances_deep item (cdr list))))
        ((equal? item (car list)) (+  1 (count_instances_deep item (cdr list))))
        (else (count_instances_deep item (cdr list))))
 )

;Tests
(display "Part A:\n")
(ins_beg 'a '(b c d))
(ins_beg '(a b) '(b c d))

(display "\nPart B:\n")
(ins_end 'a '(b c d))
(ins_end '(a b) '(b c d))

(display "\nPart C:\n")
(count_top_level '(1 2 3 4 (5 6)))

(display "\nPart D:\n")
(count_instances 3 '(1 3 3 3 3 4 4 5 3 5 5))

(display "\nPart E:\n")
(count_instances_tr_helper 3 '(1 3 3 3 4))

(display "\nPart F:\n")
(count_instances_deep '3 '((1 1 2) 2 (2 3) 3 (3 3 4)))

