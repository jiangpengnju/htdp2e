;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname intervals_sample_UFO.v2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Sample Problem: Design a program that simulates the descent of a UFO.
; Add a status line that say "descending" when the UFO's height is above
; one third of the height of the canvas.
; It swithes to "closing in" below that.
; And finally, when the UFO has reached the bottom of the canvas, the status
; notifies the player that the UFO has "landed".
; You are free to use appropriate colors for the status line.

(require 2htdp/universe)
(require 2htdp/image)


; constants:
(define WIDTH 300)
(define HEIGHT 300)

(define CLOSE (/ HEIGHT 3))

; visual constants:
(define MT (empty-scene WIDTH HEIGHT))
(define UFO
  (overlay (circle 10 "solid" "green")
           (rectangle 40 2 "solid" "green")))


; A WorldState falls into one of three intervals:
; - between 0 and CLOSE
; - between CLOSE and HEIGHT
; - below HEIGHT
; interpretation: height of UFO (from top)


; WorldState -> WorldState
; computes next location of UFO

(check-expect (nxt 11) 14)

(define (nxt y)
  (+ y 3))


; WorldState -> Image
; place UFO at given height into the center of MT

(check-expect (render 30) (place-image UFO (/ WIDTH 2) 30 MT))

(define (render y)
  (place-image UFO (/ WIDTH 2) y MT))


; WorldState -> Image
; adds a status line to the scene created by render

(check-expect (render/status 13)
              (place-image (text "descending" 11 "green")
                           10 10
                           (render 13)))

(define (render/status y)
  (cond
    [(<= 0 y CLOSE)
     (place-image (text "descending" 11 "green")
                           10 10
                           (render y))]
    [(and (< CLOSE y) (<= y HEIGHT))
     (place-image (text "closing in" 11 "orange")
                           10 10
                           (render y))]
    [(> y HEIGHT)
     (place-image (text "landed" 11 "red")
                           10 10
                           (render y))]))

; WorldState -> WorldState
(define (main y0)
  (big-bang y0
            [on-tick nxt]
            [to-draw render/status]))