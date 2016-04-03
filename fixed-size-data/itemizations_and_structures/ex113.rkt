;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex113) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Take a look at these structure type definitions and their data definitions:


(define-struct vec [x y])
; A Vec is
; (make-vec PositiveNumber PositiveNumber)
; interpretation: represents a velocity vector


; Develop the function checked-make-vec, which is to be understood as a checked
; version of the primitive operation make-vec. It ensures that the arguments to
; make-vec are positive numbers, and not just arbitrary numbers. In other words,
; check-make-vec enforces our informal data definition.


; Any Any -> Vec
; make a velocity vector with given x y, if both x and y are positive numbers.
(define (checked-make-vec x y)
  (cond
    [(and (number? x)
          (number? y)
          (> x 0)
          (> y 0))
     (make-vec x y)]
    [else (error "make-vec: two positive numbers expected")]))