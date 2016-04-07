;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex161) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Translate the examples into tests and make sure they all succeed.
; Then change the function so that everyone gets $14 per hour. Now
; revise the entire program and not several.


(define HOUR_SALARY 14)

; Number -> Number
; computes the wage for h hours of work

(check-expect (wage 28) (* HOUR_SALARY 28))
(check-expect (wage 40) (* HOUR_SALARY 40))

(define (wage h)
  (* HOUR_SALARY h))


; wage* 's task is to process all employee work hours and to determine the wages
; due to each of them.

; List-of-number -> List-of-numbers
; computes the weekly wages for all given weekly hours

(check-expect (wage* '()) '())
(check-expect (wage* (cons 28 '())) (cons (* HOUR_SALARY 28) '()))
(check-expect (wage* (cons 40 (cons 28 '())))
              (cons (* HOUR_SALARY 40) (cons (* HOUR_SALARY 28) '())))

(define (wage* alon)
  (cond
    [(empty? alon) '()]
    [else (cons (wage (first alon))
                (wage* (rest alon)))]))