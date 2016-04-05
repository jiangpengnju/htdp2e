;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex155) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design the function colors. It consumes a Russian doll and produces a string
; of all colors, sperate by a comma and a space.
; Thus our example should produce "yellow, green, red".

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


; RD -> String
; computes a string of all colors of a given an-rd

(check-expect (colors ex1) "red")
(check-expect (colors ex2) "yellow, green, red")

(define (colors an-rd)
  (cond
    [(string? an-rd) an-rd]
    [(layer? an-rd)
     (string-append (layer-color an-rd)
                    ", "
                    (colors (layer-doll an-rd)))]))