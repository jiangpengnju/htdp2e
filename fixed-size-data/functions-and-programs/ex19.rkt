;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex19) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; Define the function image-classify, which comsumes an image and produces "tall"
; if the image is taller than it is wide, "wide" if it is wider than it is taller,
; or "square" if its width and height are the same. see excercise 10 for ideas.

(require 2htdp/image)

(define (image-classify img)
  (if (> (image-height img) (image-width img))
      "tall"
      (if (< (image-height img) (image-width img))
          "wide"
          "square")))


;> (image-classify (rectangle 100 200 "solid" "red"))
;"tall"
;> (image-classify (rectangle 300 200 "solid" "red"))
;"wide"
;> (image-classify (rectangle 100 100 "solid" "red"))
;"square"