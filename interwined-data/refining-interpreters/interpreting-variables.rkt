;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname interpreting-variables) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define-struct add [left right])
; An Add is a structure:
;     (make-add BSL-var-expr BSL-var-expr)

(define-struct mul [left right])
; A Mul is a structure:
;     (make-add BSL-var-expr BSL-var-expr)

; A BSL-var-expr is one of:
; - Number
; - Symbol
; - Add
; - Mul


(define x 5)
(define y 3)

x
; 'x

(+ x 3)
; (make-add 'x 3)

(* 1/2 (* x 3))
; (make-mul 1/2 (make-mul 'x 3))

(+ (* x x) (* y y))
; (make-add (make-mul x x) (make-mul y y))

