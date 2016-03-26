;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname programming_with_structures_sample_UFO.v1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Sample Problem: Your team is designing a game program that keeps track of an
; object that moves across the canvas at changing speed. The chosen data
; representation requires two data definitions:

(define-struct vel [deltax deltay])
; A Vel is a structure: (make-vel Number Number)
; interpretation: (make-vel dx dy) means a velocity of dx pixels [per tick]
;    along the horizontal and dy along the vertical direction.

(define-struct ufo [loc vel])
; A UFO is a structure: (make-ufo Pson Vel)
; interpretation: (make-ufo p v) is at location p moving at velocity v.
; For Vel, see above.


(define v1 (make-vel 8 -3))
(define v2 (make-vel -5 -3))

(define p1 (make-posn 22 80))
(define p2 (make-posn 30 77))

(define u1 (make-ufo p1 v1))
(define u2 (make-ufo p1 v2))
(define u3 (make-ufo p2 v1))
(define u4 (make-ufo p2 v2))


; UFO -> UFO
; determines where u moves in one clock tick;
; leaves the velocity as it

(check-expect (ufo-move-1 u1) u3)
(check-expect (ufo-move-1 u2) (make-ufo (make-posn 17 77) v2))

(define (ufo-move-1 u)
  (... (posn-x (ufo-loc u)) ... (vel-deltax (ufo-vel u)) ...
   ... (posn-y (ufo-loc u)) ... (vel-deltay (ufo-vel u)) ...    ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Doing so obviously makes the sketch look quite complex, however. For truly
;; realistic programs, following this idea to its logical end would create
;; incredibly complex program outlines. More generally,

;   If a function deals with NESTED STRUCTURES, DEVELOP ONE FUNCTION per LEVEL.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;