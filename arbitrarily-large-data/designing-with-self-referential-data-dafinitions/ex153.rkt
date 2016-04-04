;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex153) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design two functions: col and row.

; The function col consumes a natural number n and an image img. It produces
; a column -- a vertical arrangement -- of n copies of img.

; The function row consumes a natural number n and an image img. It produces
; a row -- a horizontal arrangement -- of n copies of img.


(require 2htdp/image)

; constant
(define IMG (circle 10 "solid" "red"))


; N Image -> Image
; generates a column of n copies of img

(check-expect (column 3 IMG) (above IMG
                                    (above IMG
                                           (above IMG
                                                  empty-image))))
(check-expect (column 0 IMG) empty-image)

(define (column n img)
  (cond
    [(zero? n) empty-image]
    [(positive? n) (above img (column (sub1 n) img))]))


; N Image -> Image
; generates a row of n copies of image

(check-expect (row 0 IMG) empty-image)
(check-expect (row 3 IMG) (beside IMG IMG IMG))

(define (row n img)
  (cond
    [(zero? n) empty-image]
    [(positive? n) (beside img (row (sub1 n) img))]))