;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex141) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design

; all-true, which consumes a list of Boolean values and determines whether all of
; them are #t. In other words, if there is any #f on the list, the function produces
; #false; otherwise it produces #t.

; one-true, which consumes a list of Boolean values and determines whether at least
; one item on the list is #t.

; Follow the design recipe: start with a data definition for lists of Boolean values
; and don't forget to make up examples. You may also employ the table-based
; guessing approach; it tends to help understand the answer needed for the base case.

; Use DrRacket's stepper to see how these functions process the lists (cons #t '()),
; (cons #f '()), and (cons #t #f).


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; A List-of-Booleans is one of:
; - '()
; - (cons Boolean List-of-Booleans)
; interpretations: represents a list of Boolean values.

(define ex1 '())
(define ex2 (cons #t '()))
(define ex3 (cons #f '()))
(define ex4 (cons #f (cons #t '())))
(define ex5 (cons #t (cons #f '())))


; List-of-Booleans -> Boolean
; determines whether all of the values in alob are #t

(check-expect (all-true ex1) #t)
(check-expect (all-true ex2) #t)
(check-expect (all-true ex3) #f)
(check-expect (all-true ex4) #f)
(check-expect (all-true ex4) #f)

(define (all-true alob)
  (cond
    [(empty? alob) #t]
    [else (and (first alob)
               (all-true (rest alob)))]))


; List-of-Booleans -> Boolean
; determines whether at least one item on alob is #t

(check-expect (one-true ex1) #f)
(check-expect (one-true ex2) #t)
(check-expect (one-true ex3) #f)
(check-expect (one-true ex4) #t)
(check-expect (one-true ex5) #t)

(define (one-true alob)
  (cond
    [(empty? alob) #f]
    [else (or (first alob)
              (one-true (rest alob)))]))

