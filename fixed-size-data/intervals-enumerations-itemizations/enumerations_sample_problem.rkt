;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname enumerations_sample_problem) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Sample Problem: Design a key-event handler that moves a red dot left or right
; on a horizontal line in response to pressing the left and right arrow keys.

(require 2htdp/universe)
(require 2htdp/image)

; constants
(define WIDTH-OF-WORLD 100)
(define HEIGHT-OF-WORLD 100)
(define MID-HEIGHT-OF-WORLD (/ HEIGHT-OF-WORLD 2))
(define DOT-RADIUS 10)

(define BACKGROUND (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD))
(define RED-DOT (circle DOT-RADIUS "solid" "red"))


; Position is a Number.
; interpretation: distance between the left margin and ball


; Position -> Image
; render a red dot p pixels to the left margin of the background.

(check-expect (render 30)
              (place-image RED-DOT 30 MID-HEIGHT-OF-WORLD BACKGROUND))

(define (render p)
  (place-image RED-DOT p MID-HEIGHT-OF-WORLD BACKGROUND))


; Position KeyEvent -> Position
; computes the next location of the ball

(check-expect (keh 13 "left") 8)
(check-expect (keh 13 "right") 18)
(check-expect (keh 13 "a") 13)

(define (keh p k)
  (cond
    [(string=? "left" k) (- p 5)]
    [(string=? "right" k) (+ p 5)]
    [else p]))


; Position -> Position
; main function to launch the program
(define (keh-prog p)
  (big-bang p
            [on-key keh]
            [to-draw render]))


(keh-prog 40)