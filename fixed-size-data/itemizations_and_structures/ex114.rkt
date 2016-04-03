;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex114) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design predicates for the following data definitions from the preceding section.

; SIGS, Coordinate (ex 107), and VAnimal.


; A SIGS is one of: 
; – (make-aim UFO Tank)
; – (make-fired UFO Tank Missile)
; interpretation represents the state of the space invader game


; Any -> Boolean
; determine if the given param s is sigs
(define (sigs? s)
  (cond
    [(aim? s) #t]
    [(fired? s) #t]
    [else #f]))




; A Coordinate is one of: 
; – a negative number 
;    interpretation a point on the Y axis, distance from top
; – a positive number 
;    interpretation a point on the X axis, distance from left
; – a Posn
;    interpretation a point in a scene, usual interpretation

; Any -> Boolean
; determines if v is a coordinate
(define (coordinate? v)
  (cond
    [(and (number? v) (< v 0)) #t]
    [(and (number? v) (> v 0)) #t]
    [(posn? v) #t]
    [else #f]))






; A VAnimal is either
; – a VCat
; – a VCham

; Any -> Boolean
; determines if v is a VAnimal
(define (vanimal? v)
  (cond
    [(vcat? v) #t]
    [(vcham? v) #t]
    [else #f]))