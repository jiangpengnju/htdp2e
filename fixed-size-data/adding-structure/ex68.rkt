;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex68) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; There are other ways to represent bouncing balls. Here is one:

(define SPEED 3)
(define-struct balld [location direction])
(make-balld 10 "up")

; Interpret this program fragment and then create other instances of balld.

; A: it describes a ball's location and moving direction; and the ball's speed
;     is fixed at 3.    Then makes a ball that is 10 pixels from the top and
;     moving towards top.

;    some other instances
(make-balld 23 "down")
(make-balld 0 "down")