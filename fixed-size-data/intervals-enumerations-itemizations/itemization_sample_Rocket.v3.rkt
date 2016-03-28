;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname itemization_sample_Rocket.v3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Do you notice all occurences of 10 in the code? It always refer to the x-coordinate
; of the rocket. So go ahead, create a constant definition for this 10.

(require 2htdp/image)

; physical constants:
(define HEIGHT 300)
(define WIDTH 100)
(define YDELTA 3)
(define X-ROCKET 10)

; graphical constants
(define BACKG (empty-scene WIDTH HEIGHT))
(define ROCKET (rectangle 5 30 "solid" "red"))
(define ROCKET-CENTER (/ (image-height ROCKET) 2))


; A LRCD (short for: launching rocket count down) is one of:
; - "resting"
; - a number in [-3, -1]
; - non-negative number
; interpretation: a rocket resting on the ground, in count-down mode, or the
; number of pixels from the top of the world and bottom of rocket, i.e. its height


; LRCD -> Image
; renders the state as a resting or flying rocket

(check-expect (show "resting")
              (place-image ROCKET
                           X-ROCKET (- HEIGHT ROCKET-CENTER)
                           BACKG))

(check-expect (show -2)
              (place-image (text "-2" 20 "red")
                           X-ROCKET (* 3/4 HEIGHT)
                           (place-image ROCKET
                                        X-ROCKET (- HEIGHT ROCKET-CENTER)
                                        BACKG)))

(check-expect (show 66)
              (place-image ROCKET X-ROCKET (- 66 ROCKET-CENTER) BACKG))

(check-expect (show HEIGHT)
              (place-image ROCKET X-ROCKET (- HEIGHT ROCKET-CENTER) BACKG))

(check-expect (show 0)
              (place-image ROCKET X-ROCKET (- 0 ROCKET-CENTER) BACKG))

(define (show x)
  (cond
    [(and (string? x) (string=? "resting" x))
     (place-image ROCKET X-ROCKET (- HEIGHT ROCKET-CENTER) BACKG)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                           X-ROCKET (* 3/4 HEIGHT)
                           (place-image ROCKET
                                        X-ROCKET (- HEIGHT ROCKET-CENTER)
                                        BACKG))]
    [(>= x 0)
     (place-image ROCKET X-ROCKET (- x ROCKET-CENTER) BACKG)]))


; LRCD KeyEvent -> LRCD
; starts the count-down when space bar is pressed,
; if the rocket is still resting
(define (launch x ke)
  x)


; LRCD -> LRCD
; raises the rocket by YDELTA,
; if it is moving already
(define (fly x)
  x)