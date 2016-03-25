;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname itemization) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; A NorF is one of:
; - #false
; - a number

; String -> NorF
; converts the given string into a number;
; produces #false if impossible
(define (sting->number s) (... s ...))


; NorF -> Number
; adds 3 to the given number; 3 otherwise

(check-expect (add3 #false) 3)
(check-expect (add3 1.1) 4.1)

(define (add3 x)
  (cond
    [(false? x) 3]
    [else (+ x 3)]))