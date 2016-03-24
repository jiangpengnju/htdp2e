;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex49) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design a world program that maintains and displays a "happiness gauge".
; Let's call it gauge-prog, and let's agree that the program consumes the
; maximun level of happiness.
; The gauge display starts with the maximun score, and with each clock tick,
; happiness decreases by -0.1; it never falls below 0, the minimum happiness score.
; Every time the down arrow key is pressed, happiness increase by 1/5;
; every time the up arrow is pressed, happiness jumps by 1/3.

(require 2htdp/image)
(require 2htdp/universe)

(define DECREASE_WITH_EACH_TICK 0.1)
(define MINIMUM_HAPPINESS 0)
(define INCREASE_RATE_WITH_DOWN_KEY 1/5)
(define INCREASE_RATE_WITH_UP_KEY 1/3)

(define BACKGROUND (empty-scene 100 100))
(define MID-WIDTH-OF-WORLD (/ (image-width BACKGROUND) 2))
(define MID-HEIGHT-OF-WORLD (/ (image-height BACKGROUND) 2))
(define TEXT-FONT 36)
(define TEXT-COLOR "indigo")
; WorldState is a Number
; interperation: current happiness score.


; WorldState -> Image
; displays current score
(check-expect (render 100) (place-image
                            (text "100" TEXT-FONT TEXT-COLOR)
                            50 50
                            BACKGROUND))

(define (render ws)
  (place-image (text (number->string ws) TEXT-FONT TEXT-COLOR)
               MID-WIDTH-OF-WORLD MID-HEIGHT-OF-WORLD
               BACKGROUND))

; WorldState -> WorldState
; with each clock tick, happiness decreases by a fixed number.
(check-expect (tock 0.05) 0)
(check-expect (tock 3.3) 3.2)

(define (tock ws)
  (cond
    [(> (- ws DECREASE_WITH_EACH_TICK) MINIMUM_HAPPINESS) (- ws DECREASE_WITH_EACH_TICK)]
    [(<= (- ws DECREASE_WITH_EACH_TICK) MINIMUM_HAPPINESS) MINIMUM_HAPPINESS]))

; WorldState ke -> WorldState
; every time the up or down key expressed, the score increase by some percent.
(check-expect (ke-handler 15 "down") 18)
(check-expect (ke-handler 15 "up") 20)
(check-expect (ke-handler 12 "left") 12)

(define (ke-handler ws ke)
  (cond
    [(string=? "down" ke) (+ ws (* ws INCREASE_RATE_WITH_DOWN_KEY))]
    [(string=? "up" ke) (+ ws (* ws INCREASE_RATE_WITH_UP_KEY))]
    [else ws]))


; WorldState -> WorldState
; launches the programs with given score ws
(define (gauge-prog ws)
  (big-bang ws
            [to-draw render]
            [on-tick tock]
            [on-key ke-handler]))