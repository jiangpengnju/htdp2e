;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex239) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;Exercise 239. Design fold1, which is the abstraction of the following two functions:

; [List-of Number] -> Number
; computes the sum of 
; the numbers on l

(check-expect (sum '(1 2 3 4)) 10)

(define (sum l)
  (cond
    [(empty? l) 0]
    [else
     (+ (first l)
        (sum (rest l)))]))


; [List-of Number] -> Number
; computes the product of 
; the numbers on l

(check-expect (product '(1 2 3 4)) 24)

(define (product l)
  (cond
    [(empty? l) 1]
    [else
     (* (first l)
        (product (rest l)))]))



(define (fold1 l f i)
  (cond
    [(empty? l) i]
    [else
     (f (first l)
        (fold1 (rest l) f i))]))


; [List-of Number] -> Number
; computes the sum of 
; the numbers on l

(check-expect (sum-from-accu '(1 2 3 4)) 10)

(define (sum-from-accu l)
  (fold1 l + 0))


; [List-of Number] -> Number
; computes the product of 
; the numbers on l

(check-expect (product-from-accu '(1 2 3 4)) 24)

(define (product-from-accu l)
  (fold1 l * 1))

