;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex66) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; The Manhattan distance of a point to the origin considers a path that follows
; the rectangular grid of streets found in Manhattan.

; computes the Manhattan distance of a point to the orign

(check-expect (manhattan-distance (make-posn 0 5)) 5)
(check-expect (manhattan-distance (make-posn 3 4)) 7)

(define (manhattan-distance a-posn)
  (+ (posn-x a-posn)
     (posn-y a-posn)))
