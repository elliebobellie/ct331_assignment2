#lang racket

(provide left_node)
(provide right_node)
(provide val)

(provide sort)
(provide check)
(provide insert)
(provide insert_list)

;For testing
(define bst '(((() 5 ()) 15 (() 10 ())) 30 ((() 50 ()) 25 (() 1 ()))))

;Helper functions
(define (left_node tree) 
  (car tree) 
)

(define (right_node tree)
  (caddr tree) 
)

(define (val tree)
  (cadr tree) 
)

;(A) 
(define (sort tree)
 (begin 
   (cond ((not (empty?(left_node tree))) (sort (left_node tree))))
   (printf "~a " (val tree));
   (cond ((not (empty?(right_node tree))) (sort (right_node tree))))
  ) 
)

;(B)
(define (check item tree)
  (cond
    ((null? tree) #f)
    ((equal? item (val tree)) #t)
    ((< item (val tree)) (check item (left_node tree)))
    ((> item (val tree)) (check item (right_node tree)))
  )
)

;(C)
(define (insert item tree)
  (cond
    ((null? tree) (list '() item '()))
    ((equal? item (cadr tree)) tree)
    ((< item (cadr tree)) (list (insert item (car tree)) (cadr tree) (caddr tree)))
    (else (list (car tree) (cadr tree) (insert item (caddr tree))))
  )
)

;(D)
(define (insert_list list tree)
  (cond ((null? tree))
       ((empty? list) tree)
       (else (insert_list (cdr list) (insert (car list) tree))))
)

;not too sure how to do E and F

;Tests
;(A)
(display "bst tree:\n")
(sort bst)

;(B)
(display "\nChecking the tree for 7 and 15\n")
(check 7 bst) ;f
(check 15 bst) ;t

;(C)
(display "\nInserting 7 into bst\n")
(insert 7 bst)

;(D)
(display "Inserting the list (16 4 9) into bst\n")
(insert_list '(16 4 9) bst)

