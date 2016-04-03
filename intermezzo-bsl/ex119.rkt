;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex119) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Explain why the following sentences are syntactically legal definitions

; 1. (define (f x) x)
; 2. (deinfe (f x) y)
; 3. (define (f x y) 3)


; A:  definition = (define (variable variable variable ...) expr)
; 1. '(define (' ok; 'f' 'x' fit 'variable variable...' part
;    then ')' fits ok', and lastly, x is a legal expression, then ')'
;     so it is a legal definition

; 2.3. omitted.