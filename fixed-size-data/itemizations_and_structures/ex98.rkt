;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex98) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design the functions tank-render, ufo-render, and missile-render.


(require 2htdp/image)

; physical constants
(define WIDTH 200)
(define HEIGHT 200)

(define HALF-WIDTH (/ WIDTH 2))

(define TANK-WIDTH 80)
(define TANK-HEIGHT 20)

(define MISSILE-SIZE 10)

(define TANK-SPEED-X 5)
(define UFO-SPEED-Y 3)
(define MISSILE-SPEED-Y 7)

; visual constants
(define MT (empty-scene WIDTH HEIGHT))
(define UFO
  (overlay (circle 5 "solid" "green")
           (rectangle 20 2 "solid" "green")))
(define TANK
  (rectangle TANK-WIDTH TANK-HEIGHT "solid" "blue"))
(define MISSILE
  (triangle MISSILE-SIZE "outline" "red"))

(define TANK-Y (- HEIGHT (/ TANK-HEIGHT 2)))
(define UNFIRED-MISSILE-Y (- HEIGHT (+ TANK-HEIGHT (/ (image-height MISSILE) 2))))



;; Data Definition

; A UFO is Posn.
; interpretation: (make-posn x y) is the UFO's current location


(define-struct tank [loc vel])
; A Tank is a structure: (make-tank Number Number)
; interpretation: (make-tank x dx) means the tank is at position (x, TANK-Y)
; and it moves dx pixels per clock tick


; A Missile is Posn.
; interpretation: (make-posn x y) is the missile's current location


(define-struct aim [ufo tank])
; An Aim is a structure: (make-aim UFO Tank)
; interpretation: (make-aim u t) represents the time period when the player is
; tring to get the tank in position for a shot


(define-struct fired [ufo tank missile])
; A Fired is a structure: (make-fired UFO Tank Missile)
; interpretation: (make-fired u t m) represents the states of the UFO, the tank,
; and the missile after the missile is fired


; A SIGS is one of:
; - (make-aim UFO Tank)
; - (make-fired UFO Tank Missile)
; interpretation: represents the state of the space invader game

(define ex1 (make-aim (make-posn 20 10) (make-tank 28 -3)))

(define ex2 (make-fired (make-posn 20 10)
                        (make-tank 28 -3)
                        (make-posn 28 UNFIRED-MISSILE-Y)))

(define ex3 (make-fired (make-posn 20 100)
                        (make-tank 100 3)
                        (make-posn 22 103)))



; SGIS -> Image
; add TANK, UFO, and possibly the MISSILE to MT

(check-expect (si-render ex1) (place-image UFO
                                           20 10
                                           (place-image TANK
                                                        28 TANK-Y
                                                        MT)))
(check-expect (si-render ex2) (place-image MISSILE
                                           28 UNFIRED-MISSILE-Y
                                           (place-image UFO
                                                        20 10
                                                        (place-image TANK
                                                                     28 TANK-Y
                                                                     MT))))
(check-expect (si-render ex3) (place-image MISSILE
                                           22 103             
                                           (place-image UFO
                                                        20 100
                                                        (place-image TANK
                                                                     100 TANK-Y
                                                                     MT))))

(define (si-render s)
  (cond
    [(aim? s) (tank-render (aim-tank s)
                           (ufo-render (aim-ufo s) MT))]
    [(fired? s) (missile-render (fired-missile s)
                                (tank-render (fired-tank s)
                                             (ufo-render (fired-ufo s) MT)))]))


; Tank Image -> Image
; adds t to the given image im

(check-expect (tank-render (make-tank 40 -3) MT)
              (place-image TANK
                           40 TANK-Y
                           MT))

(define (tank-render t im)
  (place-image TANK
               (tank-loc t) TANK-Y
               im))


; UFO Image -> Image
; add u to the given image im

(check-expect (ufo-render (make-posn 30 50) MT)
              (place-image UFO
                           30 50
                           MT))

(define (ufo-render u im)
  (place-image UFO
               (posn-x u) (posn-y u)
               im))


; MISSILE Image -> Image
; add m to the given image im

(check-expect (missile-render (make-posn 100 50) MT)
              (place-image MISSILE
                           100 50
                           MT))

(define (missile-render m im)
  (place-image MISSILE
               (posn-x m) (posn-y m)
               im))