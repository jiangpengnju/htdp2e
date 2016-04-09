;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname recursive-auxiliary-functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; Sample Problem: Design a function that sorts a list of (real) numbers.


; List-of-numbers -> List-of-numbers
; produces a sorted version of alon

(check-expect (sort> '()) '())
(check-expect (sort> (cons 12 (cons 20 (cons -5 '()))))
              (cons 20 (cons 12 (cons -5 '()))))
(check-expect (sort> (list 3 2 1))
              (list 3 2 1))
(check-expect (sort> (list 1 2 3))
              (list 3 2 1))

(define (sort> alon)
  (cond
    [(empty? alon) '()]
    [else
     (insert (first alon) (sort> (rest alon)))]))


; Number List-of-numbers -> List-of-numbers
; insert n into the sorted list of numbers alon

(check-expect (insert 12 (list 20 -5)) (list 20 12 -5))
(check-expect (insert 1 '()) (list 1))
(check-expect (insert 3 (list 2 1)) (list 3 2 1))
(check-expect (insert 1 (list 3 2)) (list 3 2 1))

(define (insert n alon)
  (cond
    [(empty? alon) (list n)]
    [else
     (if (>= n (first alon))
         (cons n alon)
         (cons (first alon) (insert n (rest alon))))]))