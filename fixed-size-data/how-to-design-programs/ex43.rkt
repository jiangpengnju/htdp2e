;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex43) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Finish the sample problem and get the program to run.
; Then assemble all the function definitions, including their tests.
; When your program runs to your satisfaction, add a tree to scenery.
; Also add a clause to the big-bang expression that stops the animation
; when the car has disappeared on the right side of the canvas.

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
(define Y-CAR (- HEIGHT-OF-WORLD (/ (image-height CAR) 2)))
(define WIDTH-OF-CAR (image-width CAR))

;; 2. Data Definition of the state of the world
; WorldState is a Number
; interpretation: the number of pixels between the left border and the conter-point
;                 of the car.

;; 3. Design functions for big-bang expression

; WorldState -> Image
; place the image of the car x pixels from the left margin of the BACKGROUND image
(check-expect (render 50) (place-image CAR 50 Y-CAR BACKGROUND))
(check-expect (render 200) (place-image CAR 200 Y-CAR BACKGROUND))

(define (render x)
  (place-image CAR x Y-CAR BACKGROUND))

; WorldState -> WorldState
; adds 3 to x to move the car right
(check-expect (tock 20) 23)
(check-expect (tock 55) 58)

(define (tock x)
  (+ x 3))


; WorldState -> Boolean
; find whether the car has disappeared on the right side of the canvas
(check-expect (end? (- WIDTH-OF-WORLD 1)) #false)
(check-expect (end? (+ WIDTH-OF-WORLD WIDTH-OF-CAR)) #true)
(check-expect (end? (+ WIDTH-OF-WORLD (/ WIDTH-OF-CAR 2))) #true)

(define (end? x)
  (>= x (+ WIDTH-OF-WORLD (/ WIDTH-OF-CAR 2))))

;; 4. Define main function
; WorldState -> WorldState
; launches the program from some initial state ws
(define (main ws)
  (big-bang ws
            [on-tick tock]
            [to-draw render]
            [stop-when end?]))
