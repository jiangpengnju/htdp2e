;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex74) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Run the program and use the mouse to place the red dot.


; Design the function posn-up-x, which consumes a Posn p and a Number n.
; It produces a Pson like p with n in the x field.
; NOTE: Functions such as posn-up-x are called updaters functinal setters. They
;       are extremely useful when you write large programs.


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
            [on-tick x+]
            [on-mouse reset-dot]
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
  (posn-up-x p (+ 3 (posn-x p))))


; Posn Number -> Posn
; produces a Posn like p with n in the x field (updater, functional setter)

(check-expect (posn-up-x (make-posn 0 0) 23) (make-posn 23 0))

(define (posn-up-x p n)
  (make-posn n (posn-y p)))


; Posn Number Number MouseEvt -> Posn
; for mouse clicks, (make-posn x y); otherwise p

(check-expect (reset-dot (make-posn 10 20) 33 55 "button-down")
              (make-posn 33 55))
(check-expect (reset-dot (make-posn 10 20) 33 55 "button-up")
              (make-posn 10 20))

(define (reset-dot p x y me)
  (cond
    [(mouse=? "button-down" me) (make-posn x y)]
    [else p]))