;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex11) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require 2htdp/image)
; Add the following line to the definitions area of DrRacket:

(define in "hello")
;(define in (rectangle 100 200 "solid" "red"))
;(define in 123)
;(define in 0)
;(define in -2)
;(define in #true)
;(define in #false)
;(define in sqr)

; Then create an expression that converts whatever in represents to a number.
; For a string, it determins how long the string is; for an image, it uses the area;
; for a number, it decrements the number, unless it is already 0 or negative;
; for #true it uses 10 and for #false 20.

(if (string? in)
    (string-length in)
    (if (image? in)
        (* (image-height in)
           (image-width in))
        (if (number? in)
            (if (> in 0)
                (- in 1)
                in)
            (if (boolean? in)
                (if in
                    10
                    20)
                "other case"))))