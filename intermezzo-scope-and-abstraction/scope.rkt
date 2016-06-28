;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname scope) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (f y)
  (+ (* y y) 25))

(define (g x)
  (+ (f (+ x 1)) (f (- x 1))))

(define (h x)
  (f (* 2 x)))

;; The scope of local definitions is the local expression.
(local ((define (e z) (f (* z z)))
        (define (f x) (+ (* x x) 25))
        (define (g y) (+ (f (+ y 1)) (f (- y 1)))))
  (e (g (f ...))))



(lambda (x-1 x-2 x-n) exp)

(local ((define (a-new-name x-1 x-2 x-n) exp))
  a-new-name)           ; if a-new-name does not occur in exp.


(define l
  (lambda (x)
    (+ (* x x) 25)))