;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname functions-that-produce-lists) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

; Number -> Number
; computes the wage for h hours of work

(check-expect (wage 28) 336)
(check-expect (wage 40) 480)

(define (wage h)
  (* 12 h))


; wage* 's task is to process all employee work hours and to determine the wages
; due to each of them.

; List-of-number -> List-of-numbers
; computes the weekly wages for all given weekly hours

(check-expect (wage* '()) '())
(check-expect (wage* (cons 28 '())) (cons 336 '()))
(check-expect (wage* (cons 40 (cons 28 '())))
              (cons 480 (cons 336 '())))

(define (wage* alon)
  (cond
    [(empty? alon) '()]
    [else (cons (wage (first alon))
                (wage* (rest alon)))]))