;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex152) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design the function multiply. It consumes a natural number n and
; multiplies it with some arbitrary number x withou using *.



; Number N -> Number
; multiplies n with x without using *.

(check-expect (multiply 100 3) (* 100 3))
(check-expect (multiply 100 0) 0)

(define (multiply x n)
  (cond
    [(zero? n) 0]
    [(positive? n) (+ x (multiply x (sub1 n)))]))