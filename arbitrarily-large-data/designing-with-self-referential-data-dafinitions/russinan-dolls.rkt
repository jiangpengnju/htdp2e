;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname russinan-dolls) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Russian doll -- "a set of dolls of decreasing size placed one inside the other.


(define-struct layer [color doll])
; A Layer is a structure: (make-layer String RD)
; interpretation: (make-layer "red" inside-doll) represents a layer of the Russian
; doll that its color is "red" and the doll inside is inside-doll.


; An RD (russian doll) is one of:
; - String
; - (make-layer String RD)
; interpretation: the first clause represents the innermost doll's color;
;      the second clause is for adding a layer around some given Russian doll.

(define ex1 "red")
(define ex2 (make-layer "yellow" (make-layer "green" "red")))


; RD -> Number
; how many dolls are part of an-rd

(check-expect (depth ex1) 1)
(check-expect (depth ex2) 3)

(define (depth an-rd)
  (cond
    [(string? an-rd) 1 ]
    [(layer? an-rd)
     (add1 (depth (layer-doll an-rd)))]))