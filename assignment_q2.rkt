#lang racket

;This is an example implementation of ins_beg,
;It obviously doesn't do what it should, so you
;can edit this function to get started.
;
;Please note the provide function is necessary
;for the unit tests to work. Please include a
;(provide) for each function you write in your
;submitted assignment.
;
;You may delete these comments!

(provide ins_beg)
(provide ins_end)
(provide count_top_level)

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


