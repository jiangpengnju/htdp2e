;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex123) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Suppose the program contains these definitions:

(define (f x y)
  (+ (* 3 x) (* y y)))

; Show how DrRacket evaluates the following expressions, step by step:

; 1.
(+ (f 1 2) (f 2 1))

; 2.
(f 1 (* 2 3))

; 3.
(f (f 1 (* 2 3)) 19)



; Note:  'Substuition Model' with 'Applicative Order'