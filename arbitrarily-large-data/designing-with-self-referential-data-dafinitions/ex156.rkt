;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex156) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design the function inner, which consumes an RD and produces the (color of
; the)

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
(define ex3 (make-layer "black" (make-layer "blue" "purple")))

; RD -> String
; conputes the innermost doll's color for given an-rd.

(check-expect (inner ex1) "red")
(check-expect (inner ex2) "red")
(check-expect (inner ex3) "purple")

(define (inner an-rd)
  (cond
    [(string? an-rd) an-rd]
    [(layer? an-rd) (inner (layer-doll an-rd))]))