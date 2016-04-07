;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex157) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; If you run main, press the space bar (fire a shot), and wait for a good amount of
; time, the shot disappears from the canvas. When you shut down the world canvas,
; however, the result is a world that still contains this invisible shot.

; Desing an alternative tock function, which not just moves shots one pixel per
; clock tick but also eliminates those coordinates places them above the canvas.

; Hint: you may wish to consider the disign of an auxiliary function for the
; recursive cond clause.


(require 2htdp/image)
(require 2htdp/universe)


;;;; 1. define constants ;;;;
; phisical constants
(define HEIGHT 80)
(define WIDTH 100)
(define XSHOTS (/ WIDTH 2))

; graphical constants
(define BACKGROUND (empty-scene WIDTH HEIGHT))
(define SHOT (triangle 3 "solid" "red"))


;;;; 2. data definitions ;;;;

; A List-of-numbers is one of:
; - '()
; - (cons Number List-of-numbers)

; A ShotWorld is List-of-numbers.
; interpretation: each number represents the y-coordinate of a shot.


;;;; 3. event handlers ;;;;

; ShotWorld -> Image
; adds each y on w at (MID, y) to the background image

(check-expect (to-image (cons 10 '()))
              (place-image SHOT XSHOTS 10 BACKGROUND))

(define (to-image w)
  (cond
    [(empty? w) BACKGROUND]
    [else (place-image SHOT XSHOTS
                       (first w)
                       (to-image (rest w)))]))


; ShotWorld -> ShotWorld
; moves each shot up by one pixel

(check-expect (tock (cons 30 (cons 20 (cons 12 '()))))
              (cons 29 (cons 19 (cons 11 '()))))

(define (tock w)
  (cond
    [(empty? w) '()]
    [else (cons (sub1 (first w))
                (eliminate-invisibles (tock (rest w))))]))


; ShotWorld KeyEvent -> ShotWorld
; adds a shot to the world if the space bar is hit

(check-expect (keyh (cons 10 '()) " ")
              (cons HEIGHT (cons 10 '())))
(check-expect (keyh (cons 10 '()) "o")
              (cons 10 '()))

(define (keyh w ke)
  (cond
    [(key=? " " ke) (cons HEIGHT w)]
    [else w]))



; ShotWorld -> ShotWorld
; eliminate invisible shots from given w

(check-expect (eliminate-invisibles '()) '())
(check-expect (eliminate-invisibles (cons 10 '()))
              (cons 10 '()))
(check-expect (eliminate-invisibles (cons 10 (cons -3 '())))
              (cons 10 '()))
(check-expect (eliminate-invisibles (cons -5 '()))
              '())

(define (eliminate-invisibles w)
  (cond
    [(empty? w) '()]
    [else
     (if (< (first w) 0)
         '()
         (cons (first w) (eliminate-invisibles (rest w))))]))
     


;;;; 4. Main ;;;;
; ShotWorld -> ShotWorld
(define (main w0)
  (big-bang w0
            [on-tick tock]
            [on-key keyh]
            [to-draw to-image]))