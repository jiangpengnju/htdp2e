;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex302) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; ex 302. Define the atom? function.

; X -> Boolean
; determines if given x is atom.
(define (atom? x)
  (or (number? x) (string? x) (symbol? x)))