;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname space_invader_game_diff.v1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Data representations are rarely unique. For example, we could use a single
; structure type to represent the states of a space invader game -- if we
; are willing to change the representations of missiles:

;; See below  Data definition ;;


(require 2htdp/image)
(require 2htdp/universe)

; physical constants
(define WIDTH 200)
(define HEIGHT 200)

(define HALF-WIDTH (/ WIDTH 2))

(define TANK-WIDTH 80)
(define TANK-HEIGHT 20)

(define MISSILE-SIZE 10)

(define TANK-SPEED-X 3)
(define UFO-SPEED-Y 3)
(define MISSILE-SPEED-Y -7)

(define DELTA-X 10)

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

(define HALF-UFO-HEIGHT (/ (image-height UFO) 2))
(define HALF-UFO-WIDTH (/ (image-width UFO) 2))
(define HALF-MISSILE-HEIGHT (/ (image-height MISSILE) 2))
(define HALF-MISSILE-WIDTH (/ (image-width MISSILE) 2))

;; Data Definition

; A UFO is Posn.
; interpretation: (make-posn x y) is the UFO's current location


(define-struct tank [loc vel])
; A Tank is a structure: (make-tank Number Number)
; interpretation: (make-tank x dx) means the tank is at position (x, TANK-Y)
; and it moves dx pixels per clock tick


; A MissileOrNot is one of:
; - #false
; - Posn
; interpretation: #false means the missile hasn't been fired yet;
; Posn says the missile has been fired and is at the specified location.


(define-struct sigs [ufo tank missile])
; SIGS.v2 (short for version 2)
; is a structure: (make-sigs UFO Tank MissileOrNot)
; interpretation: represents the state of the space invader game

(define ex1 (make-sigs (make-posn 50 10) (make-tank 28 -3) #false))

(define ex2 (make-sigs (make-posn 50 10)
                        (make-tank 28 -3)
                        (make-posn 28 UNFIRED-MISSILE-Y)))

(define ex3 (make-sigs (make-posn 20 100)
                        (make-tank 100 3)
                        (make-posn 22 103)))

(define ex4 (make-sigs (make-posn 20 100)
                       (make-tank 100 3)
                       (make-posn 32
                                  (- HEIGHT
                                     TANK-HEIGHT
                                     10))))


; SIGS.v2 -> Image
; renders the given game state and added it to MT
(define (si-render.v2 s)
  (tank-render (sigs-tank s)
               (ufo-render (sigs-ufo s)
                           (missile-render.v2 (sigs-missile s)
                                              MT))))


; MissileOrNot Image -> Image
; adds the missile image to sc for m
(define (missile-render.v2 m sc)
  (cond
    [(false? m) sc]
    [(posn? m) (place-image MISSILE
                            (posn-x m) (posn-y m)
                            sc)]))



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

