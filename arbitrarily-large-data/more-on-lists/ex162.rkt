;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex162) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; No employee could possibly work more than 100 hours per week. To protect
; the company against fraud, the function should check that no item of
; the input list of wage* exceeds 100. If one of them does, the function
; should immediately signal an error.
; How do we have to change the function if we want to perform this basic
; reality check.


(define HOUR_SALARY 14)
(define HOURS_LIMIT 100)

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
(check-error (wage* (cons 110 '())))

(define (wage* alon)
  (cond
    [(empty? alon) '()]
    [else
     (if (<= (first alon) HOURS_LIMIT)
         (cons (wage (first alon))
                (wage* (rest alon)))
         (error "someone worked over 100 hour??"))]))