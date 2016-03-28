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

; physical constants
(define MIN-HAPPY 0)
(define MAX-HAPPY 100)
(define DELTA-TICK 0.1)
(define INC-RATE-FOR-DOWN 1/5)
(define INC-RATE-FOR-UP 1/3)

(define WIDTH 300)
(define HEIGHT 200)
(define FRAME-WIDTH 200)
(define FRAME-HEIGHT 10)

; visual constants
(define MT (empty-scene WIDTH HEIGHT))
(define FRAME (rectangle FRAME-WIDTH FRAME-HEIGHT "outline" "black"))

(define X-FRAME (/ FRAME-WIDTH 2))
(define Y-FRAME 30)


; WorldState is a Number
; interperation: current happiness level.


; WorldState -> Image
; displays current level.
(check-expect (render 100) (place-image
                            (overlay/align "left" "middle"
                                           (rectangle (* FRAME-WIDTH (/ 100 MAX-HAPPY)) FRAME-HEIGHT
                                                      "solid" "red")
                                           FRAME)
                            X-FRAME Y-FRAME
                            MT))

(define (render ws)
  (place-image
   (overlay/align "left" "middle"
                  (rectangle (* FRAME-WIDTH (/ ws MAX-HAPPY)) FRAME-HEIGHT
                             "solid" "red")
                  FRAME)
   X-FRAME Y-FRAME
   MT))


; WorldState -> WorldState
; with each clock tick, happiness decreases by a fixed number.
(check-expect (tock 0.05) 0)
(check-expect (tock 3.3) 3.2)

(define (tock ws)
  (cond
    [(> (- ws DELTA-TICK) MIN-HAPPY) (- ws DELTA-TICK)]
    [(<= (- ws DELTA-TICK) MIN-HAPPY) MIN-HAPPY]))


; WorldState ke -> WorldState
; every time the up or down key expressed, the score increase by some percent.
(check-expect (ke-handler 15 "down") 18)
(check-expect (ke-handler 15 "up") 20)
(check-expect (ke-handler 12 "left") 12)
(check-expect (ke-handler 90 "up") 100)
(check-expect (ke-handler 90 "down") 100)

(define (ke-handler ws ke)
  (cond
    [(string=? "down" ke)
     (if (>= (+ ws (* ws INC-RATE-FOR-DOWN)) MAX-HAPPY)
         MAX-HAPPY
         (+ ws (* ws INC-RATE-FOR-DOWN)))]
    [(string=? "up" ke)
     (if (>= (+ ws (* ws INC-RATE-FOR-UP)) MAX-HAPPY)
         MAX-HAPPY
         (+ ws (* ws INC-RATE-FOR-UP)))]
    [else ws]))


; WorldState -> WorldState
; launches the programs with given score ws
(define (gauge-prog ws)
  (big-bang ws
            [to-draw render]
            [on-tick tock]
            [on-key ke-handler]))