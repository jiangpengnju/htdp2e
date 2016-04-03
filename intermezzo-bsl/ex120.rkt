;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex120) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Explain why the following sentences are syntactically illegal

; 1. (define (f "x") x)
; 2. (define (f x y z) (x))
; 3. (define (f) 10)


; A:
; 1. "x" is not a legal variable, but a constant
; 2. (x) is not a legal expression
; 3. (f) there should at least two variables within the parenthesis.