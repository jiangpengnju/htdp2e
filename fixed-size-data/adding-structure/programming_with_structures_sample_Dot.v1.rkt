;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname programming_with_structures_sample_Dot) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Sample problem: Your team is designing an interactive game program that moves
; a red dot across a 100 x 100 canvas and allows players to use the mouse to
; place the dot. Together you chose Posn as the data representation for the
; game state. Here is how far you got:

(require 2htdp/image)
(require 2htdp/universe)

; visual constants
(define MTS (empty-scene 100 100))
(define DOT (circle 3 "solid" "red"))


; The state of the world is represented by a Posn.


; Posn -> Posn
(define (main p0)
  (big-bang p0
;            [on-tick x+]
;            [on-mouse reset-dot]
            [to-draw scene+dot]))


; Posn -> Image
; adds a red spot to MTS at p

(check-expect (scene+dot (make-posn 10 20))
              (place-image DOT 10 20 MTS))
(check-expect (scene+dot (make-posn 89 77))
              (place-image DOT 89 77 MTS))

(define (scene+dot p)
  (place-image DOT (posn-x p) (posn-y p) MTS))


; Posn -> Posn
; increases the x-coordinate of p by 3

(check-expect (x+ (make-posn 20 10)) (make-posn 23 10))

(define (x+ p)
  (make-posn (+ 3 (posn-x p)) (posn-y p)))
