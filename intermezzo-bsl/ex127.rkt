;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex127) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Identify which of the following expressions are values:

(define-struct point [x y z])

; 1.
(make-point 1 2 3)

; 2,
(make-point (make-point 1 2 3) 4 5)

; 3.
(make-point (+ 1 2) 3 4)


;; A: all three.