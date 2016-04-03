;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex128) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Suppose the program contains

(define-struct ball [x y speed-x speed-y])

; Predict the results of evaluating the following expression:

; 1.
;(number? (make-ball 1 2 3 4))

; 2.
(ball-speed-y (make-ball (+ 1 2) (+ 3 3) 2 3))

; 3.
(ball-y (make-ball (+ 1 2) (+ 3 3) 2 3))

; 4.
(ball-x (make-posn 1 2))

; 5.
(ball-speed-y 5)

; Check your predictions in DrRacket's interactions area.
; Use the stepper to see how DrRacket produces this result.


;; A:
; 1. #false
; 2. 3
; 3. 6
; 4. error
; 5. error