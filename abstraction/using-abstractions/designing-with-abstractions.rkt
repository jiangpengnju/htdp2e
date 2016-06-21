;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname designing-with-abstractions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; defining a function that places small red circles on a 200 by 200 canvas
; for a given list of Posns.


(require 2htdp/image)


; [List-of Posn] -> Image
; adds the Posns on lop to the empty scene

(check-expect (dots (list (make-posn 12 31)))
              (place-image DOT 12 31 BACKGROUND))
(check-expect (dots (list (make-posn 12 31) (make-posn 56 78)))
              (place-image DOT 12 31
                           (place-image DOT 56 78 BACKGROUND)))

(define (dots lop)
  (local (; Posn Image -> Image
          (define (add-one-dot p scene)
            (place-image DOT (posn-x p) (posn-y p) scene)))
    (foldr add-one-dot BACKGROUND lop)))

(define BACKGROUND (empty-scene 200 200))
(define DOT (circle 5 "solid" "red"))