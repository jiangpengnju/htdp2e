;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex139) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Here is a data definition for representing amounts of money:

; A List-of-amouts is one of:
; - '()
; - (cond PositiveNumber List-of-amounts)
; interpretation: a List-of-amounts represents some amount of money


; Create some examples to make sure you understand the data definition. Also add an
; arrow for the self-reference.


; Design the sum function, which consumes a List-of-amounts and computes the sum of
; the amounts. Use Drracket's stepper to see how (sum l) works for a short list l
; in List-of-amounts.


;;;;;;;;;;;;;;;;;;;;;;

(define ex1 '())
(define ex2 (cons 10 '()))
(define ex3 (cons 22 (cons 10 '())))
(define l (cons 5 (cons 22 (cons 10 '()))))


; List-of-amounts -> Number
; calculates the sum of the amounts in a given alos

(check-expect (sum ex1) 0)
(check-expect (sum ex2) 10)
(check-expect (sum ex3) 32)
(check-expect (sum l) 37)

(define (sum alos)
  (cond
    [(empty? alos) 0]
    [else (+ (first alos)
             (sum (rest alos)))]))

