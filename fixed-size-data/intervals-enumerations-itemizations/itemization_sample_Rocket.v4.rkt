;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname itemization_sample_Rocket.v4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Let's move on to the second function, which deals with the key event to launch
; the rocket. 

(require 2htdp/image)
(require 2htdp/universe)

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
     (place-rocket HEIGHT)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                           X-ROCKET (* 3/4 HEIGHT)
                           (place-rocket HEIGHT))]
    [(>= x 0)
     (place-rocket x)]))


; LRCD KeyEvent -> LRCD
; starts the count-down when space bar is pressed,
; if the rocket is still resting

(check-expect (launch "resting" " ") -3)
(check-expect (launch "resting" "a") "resting")
(check-expect (launch -3 " ") -3)
(check-expect (launch -1 " ") -1)
(check-expect (launch 33 " ") 33)
(check-expect (launch 33 "a") 33)

(define (launch x ke)
  (cond
    [(and (string? x) (string=? "resting" x))
     (if (string=? " " ke) -3 x)]
    [(<= -3 x -1) x]
    [(>= x 0) x]))


; LRCD -> LRCD
; raises the rocket by YDELTA,
; if it is moving already

(check-expect (fly "resting") "resting")
(check-expect (fly -3) -2)
(check-expect (fly -2) -1)
(check-expect (fly -1) HEIGHT)
(check-expect (fly 10) (- 10 YDELTA))
(check-expect (fly 50) (- 50 YDELTA))

(define (fly x)
  (cond
    [(and (string? x) (string=? "resting" x)) x]
    [(<= -3 x -1) (if (= x -1) HEIGHT (+ x 1))]
    [(>= x 0) (- x YDELTA)]))

; Number -> Image
; place the rocket image to the background image, with the bottom of rocket at
; height y.

(check-expect (place-rocket HEIGHT)
              (place-image ROCKET X-ROCKET (- HEIGHT ROCKET-CENTER) BACKG))

(define (place-rocket y)
  (place-image ROCKET X-ROCKET (- y ROCKET-CENTER) BACKG))


; LRCD -> LRCD
(define (main1 s)
  (big-bang s
            [to-draw show]
            [on-key launch]))