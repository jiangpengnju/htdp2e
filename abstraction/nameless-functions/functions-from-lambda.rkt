;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname functions-from-lambda) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define-struct ir [name price])

; [List-of IR] Number -> Boolean
(define (find aloir threshold)
  (filter (lambda (ir) (<= (ir-price ir) threshold)) aloir))


(lambda (x) (* 10 x))

(local ((define some-random-name (lambda (x) (* 10 x))))
  some-random-name)


(lambda (name) (string-append "hello, " name ", how are you?"))

(lambda (ir) (<= (ir-price ir) 100))


((lambda (x) (* 10 x)) 2)

((lambda (name rst) (string-append name ", " rst)) "Robby" "etc.")

((lambda (ir) (<= (ir-price ir) 100)) (make-ir "bear" 10))


(map (lambda (x) (* 10 x)) '(1 2 3))

(foldl (lambda (name rst) (string-append name ", " rst)) "etc."
       '("Matthew" "Jack" "John"))

