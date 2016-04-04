;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname non-empty-lists) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; the simple-looking problen of computing the average of a list of temperatures.

; A List-of-temperatures is one of:
; - '()
; - (cons CTemperature List-of-temperatures)

; A CTemperature is a Number greater or equal to -273.

(define ex1 '())
(define ex2 (cons 1 '()))
(define ex3 (cons 1 (cons 2 (cons 3 '()))))


; List-of-temperatures -> Number
; computes the average temperature

(check-expect (average ex3) 2)

(define (average alot)
  (/ (sum alot)
     (how-many alot)))


; List-of-temperatures -> Number
; computes the temperatures on the given list

(check-expect (sum ex1) 0)
(check-expect (sum ex3) 6)

(define (sum alot)
  (cond
    [(empty? alot) 0]
    [else (+ (first alot)
             (sum (rest alot)))]))


; List-of-temperatures -> Number
; counts the temperatures on the given list

(check-expect (how-many ex1) 0)
(check-expect (how-many ex3) 3)

(define (how-many alot)
  (cond
    [(empty? alot) 0]
    [else (add1 (how-many (rest alot)))]))