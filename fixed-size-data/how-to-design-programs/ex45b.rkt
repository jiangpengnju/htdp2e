;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex45b) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Use the data definition to design a program that moves the car according to a
; sine wave. Don't drive like that.

(require 2htdp/universe)
(require 2htdp/image)

;; 1. Define Constants
;; a. "Physical" constants
(define WIDTH-OF-WORLD 400)
(define HEIGHT-OF-WORLD 40)

(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

;; b. Graphical constants
(define TREE
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))
(define BACKGROUND
  (place-image TREE
               100 (- HEIGHT-OF-WORLD (/ (image-height TREE) 2))
               (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD)))
(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define SPACE (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "white"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))

(define CAR-BODY (above (rectangle (* WHEEL-RADIUS 7) WHEEL-RADIUS "solid" "red")
         (rectangle (* WHEEL-RADIUS 11) (* WHEEL-RADIUS 2) "solid" "red")))
(define CAR (overlay/align/offset "middle" "bottom"
                        BOTH-WHEELS
                        0 (- WHEEL-RADIUS)
                        CAR-BODY))
(define HEIGHT-OF-CAR (image-height CAR))
(define MID-HEIGHT-OF-CAR (/ HEIGHT-OF-CAR 2))
(define Y-MIN MID-HEIGHT-OF-CAR)
(define Y-MAX (- HEIGHT-OF-WORLD MID-HEIGHT-OF-CAR))
(define Y-INTERVAL (- Y-MAX Y-MIN))
(define WIDTH-OF-CAR (image-width CAR))
(define MID-HEIGHT-OF-WORLD (/ HEIGHT-OF-WORLD 2))

(define V 3)


;; 2. Data Definition of the state of the world
; AnimationState is a Number
; interpretation: the number of clock ticks since the animation started.

;; 3. Design functions for big-bang expression

; AnimationState -> Image
; place the image of the car the BACKGROUND image after x ticks.
(check-expect (render 50) (place-image CAR (distance 50) (y-car 50) BACKGROUND))
(check-expect (render 200) (place-image CAR (distance 200) (y-car 50) BACKGROUND))

(define (render x)
  (place-image CAR (distance x) (y-car x) BACKGROUND))

; AnimationState -> AnimationState
; adds 1 tick to x
(check-expect (tock 20) 21)
(check-expect (tock 55) 56)

(define (tock x)
  (+ x 1))


; AnimationState -> Boolean
; find whether the car has disappeared on the right side of the canvas
(check-expect (end? (/ (- WIDTH-OF-WORLD 1) V)) #false)
(check-expect (end? (/ (+ WIDTH-OF-WORLD WIDTH-OF-CAR) V)) #true)
(check-expect (end? (/ (+ WIDTH-OF-WORLD (/ WIDTH-OF-CAR 2)) V)) #true)

(define (end? x)
  (>= (distance x) (+ WIDTH-OF-WORLD (/ WIDTH-OF-CAR 2))))


; Number -> Number
; calculate distance after x ticks
(define (distance x)
  (* V x))

; Number -> Number
; calculate y-coordinate of the car after x ticks
(check-expect (y-car 0) MID-HEIGHT-OF-WORLD)
(check-expect (inexact->exact (y-car (/ pi 2))) Y-MAX)
(check-expect (inexact->exact (y-car (* pi 3/2))) Y-MIN)

(define (y-car x)
  (+ MID-HEIGHT-OF-WORLD (* (/ Y-INTERVAL 2) (sin x))))

;; 4. Define main function
; WorldState -> WorldState
; launches the program from some initial state ws
(define (main ws)
  (big-bang ws
            [on-tick tock]
            [to-draw render]
            [stop-when end?]))
