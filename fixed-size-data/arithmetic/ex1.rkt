;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;The direct goal of this excercise is to create an expression that
;computes the distance of some specific Cartesian point (x,y) from the origin
;(0, 0). The indirect goal is to introduce some basic programming habits,
;especially the use of the interaction area to develop expressions.

(define x 3)
(define y 4)

(define (distance-to-origin x y)
  (sqrt (+ (sqr x) (sqr y))))


(distance-to-origin 3 4)     ; 5
(distance-to-origin 5 12)    ; 13