;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex38) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design the function image-area, which counts the number of pixels
; in a given image.

(require 2htdp/image)

; We use plain numbers to represent the number of pixels.
; Image -> Number
; counts the number of pixels in a given image img
; given: (square 5 "solid" "red"), expect: 25
; given: (rectangle 30 40 "outline" "blue"), expect: 1200
(define (image-area img)
  (* (image-height img) (image-width img)))

;> (image-area (square 5 "solid" "red"))
;25
;> (image-area (rectangle 30 40 "outline" "blue"))
;1200