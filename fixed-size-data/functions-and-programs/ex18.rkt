;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex18) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; Define the function image-area, which counts the number of pixels in a given
; image.

(require 2htdp/image)

(define (image-area img)
  (* (image-height img) (image-width img)))


;> (image-area (rectangle 122 100 "solid" "blue"))
;12200