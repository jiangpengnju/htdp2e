;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex148) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Develop a data definition for NEList-of-Booleans, a representation of
; non-empty lists of Boolean balues.
; Then redesign the functions all-true and one-true from ex141.


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; A NEList-of-Booleans is one of:
; - (cons Boolean '())
; - (cons Boolean List-of-Booleans)
; interpretations: represents a non-empty list of Boolean values.

(define ex2 (cons #t '()))
(define ex3 (cons #f '()))
(define ex4 (cons #f (cons #t '())))
(define ex5 (cons #t (cons #f '())))


; List-of-Booleans -> Boolean
; determines whether all of the values in anelob are #t

(check-expect (all-true ex2) #t)
(check-expect (all-true ex3) #f)
(check-expect (all-true ex4) #f)
(check-expect (all-true ex5) #f)

(define (all-true anelob)
  (cond
    [(empty? (rest anelob)) (first anelob)]
    [(cons? (rest anelob))
     (and (first anelob)
          (all-true (rest anelob)))]))


; List-of-Booleans -> Boolean
; determines whether at least one item on anelob is #t

(check-expect (one-true ex2) #t)
(check-expect (one-true ex3) #f)
(check-expect (one-true ex4) #t)
(check-expect (one-true ex5) #t)

(define (one-true anelob)
  (cond
    [(empty? (rest anelob)) (first anelob)]
    [(cons? (rest anelob))
     (or (first anelob)
         (one-true (rest anelob)))]))

