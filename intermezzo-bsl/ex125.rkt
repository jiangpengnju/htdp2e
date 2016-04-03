;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex125) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Evaluate the following program, step by step:

(define PRICE 5)
(define SALES-TAX (* 0.08 PRICE))
(define TOTAL (+ PRICE SALES-TAX))

; Does the evaluation of the following program signal an error?

(define COLD-F 32)
;(define COLD-C (fahrenheit->celsius COLD-F))
;(define (fahrenheit->celsius f)
; (* 5/9 (- f 32)))

; How about the next one?

(define LEFT -100)
(define RIGHT 100)
(define (f x) (+ (* 5 (expt x 2)) 10))
(define f@LEFT (f LEFT))
(define f@RIGHT (f RIGHT))

; Check your computations with DrRacket's stepper.


;;A:
; 1. ok
; 2. call function before its definition
; 3. ok.  Note: '@' within variable name is ok.