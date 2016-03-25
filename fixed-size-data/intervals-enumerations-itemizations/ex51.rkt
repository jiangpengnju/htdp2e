;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex51) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A cond expression is really just an expression and may therefore show up
; in the middle of another expression:

;(define y 100)

(define y 210)

(- 200 (cond
         [(> y 200) 0]
         [else y]))

; Use the stepper to evaluate the expression for two distinct values of y: 100
; and 210.
