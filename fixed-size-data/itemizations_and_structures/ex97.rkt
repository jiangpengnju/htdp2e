;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex97) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A pragrammer has chosen to represent locations on the Cartesian plane as
; pairs(x, y) or as single number if the point lies on one of the axes:

; Location is one of:
; - Posn
; - Number
; interpretation: Posn are positons on the Cartesian plane,
; Numbers are positions on either the x- or y-axis.


; Design the function in-reach?, which determines whether a given location's
; distance to the origin is strictly less than some constant R.


(define loc1 8)
(define loc2 (make-posn 3 4))


; Location Number -> Boolean
; determines the given location's distance to the origin is strictly less than
; some constant R.

(check-expect (in-reach? loc1 6) #f)
(check-expect (in-reach? loc2 6) #t)

(define (in-reach? loc R)
  (cond
    [(posn? loc) (< (sqrt (+ (sqr (posn-x loc))
                             (sqr (posn-y loc))))
                    R)]
    [(number? loc) (< loc R)]))