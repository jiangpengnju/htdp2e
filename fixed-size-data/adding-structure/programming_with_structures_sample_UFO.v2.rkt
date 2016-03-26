;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname programming_with_structures_sample_UFO.v2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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
  (make-ufo (posn+ (ufo-loc u) (ufo-vel u))
            (ufo-vel u)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Doing so obviously makes the sketch look quite complex, however. For truly
;; realistic programs, following this idea to its logical end would create
;; incredibly complex program outlines. More generally,

;   If a function deals with NESTED STRUCTURES, DEVELOP ONE FUNCTION per LEVEL.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Pson Vel -> Posn
; adds v to p

(check-expect (posn+ p1 v1) p2)
(check-expect (posn+ p1 v2) (make-posn 17 77))

(define (posn+ p v)
  (make-posn (+ (posn-x p) (vel-deltax v))
             (+ (posn-y p) (vel-deltay v))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Writing down the signature, purpose, and header like this is a legitimate way
; of programming. It is called "making a wish" and is a part of "making a wish
;  list".

; The KEY is to MAKE WISHES in such a way that we can complete the function that
; we are working on. In this manner, we can SPLIT difficult programming task
; into DIFFERENT TASKS, a technique that help us solve problems in reasonably
; SMALL steps.

; Now, we can get a complete definition for ufo-move-1: (see above)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Then, it is time to FOCUS ON posn+.  (see above)