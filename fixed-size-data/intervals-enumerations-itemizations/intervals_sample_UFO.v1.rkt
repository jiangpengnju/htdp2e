;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname intervals_sample_UFO.v1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Sample Problem: Design a program that simulates the descent of a UFO.

(require 2htdp/universe)
(require 2htdp/image)

; WorldState is a Number
; interpretation: heiht of UFO (from top)


; constants:
(define WIDTH 300)
(define HEIGHT 100)
(define CLOSE (/ HEIGHT 3))

; visual constants:
(define MT (empty-scene WIDTH HEIGHT))
(define UFO
  (overlay (circle 10 "solid" "green")
           (rectangle 40 2 "solid" "green")))


; WorldState -> WorldState
(define (main y0)
  (big-bang y0
            [on-tick nxt]
            [to-draw render]))


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