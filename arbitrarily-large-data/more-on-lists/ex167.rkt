;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex167) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design the function sum, which consumes a list of Posns and prouces the sum
; of all of its x-coordinates.



; List-of-posns -> Number
; computes the sum of all of alop's x-coordinates

(check-expect (sum '()) 0)
(check-expect (sum (cons (make-posn 10 22) '())) 10)
(check-expect (sum (cons (make-posn 13 23)
                         (cons (make-posn 40 88) '()))) 53)


(define (sum alop)
  (cond
    [(empty? alop) 0]
    [else (+ (posn-x (first alop))
               (sum (rest alop)))]))