;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex69) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Here is an alternative to the nested data representation of balls:

(define-struct ballf [x y deltax deltay])

; Programmers often call this a flat representation. Create an instance of ballf
; that has the same interpretation as ball1.

; A:
(define ball2 (make-ballf 30 40 -10 50))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-struct ball [location velocity])

(make-ball 10 -3)
; represents a ball that is 10 pixels from the top and moves up at 3 pixels
; per clock tick.


(define-struct vel [deltax deltay])

; a ball that is 30 pixels from the left, 40 pixels from the top.
; It moves 10 pixels toward the left per clock tick, and drops at 5 pixels
; per clock tick.
(define ball1 (make-ball (make-posn 30 40) (make-vel -10 5)))

