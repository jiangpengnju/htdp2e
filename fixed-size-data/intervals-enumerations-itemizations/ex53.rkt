;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex53) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design a big-bang program that simulates a traffic light for a given duration.
; The program renders the state of a traffic light as a solid circle of the
; appropriate color, and it changes state on every clock tick.
; What is the most appropriate initial state? Ask your engineering friends.

(require 2htdp/universe)
(require 2htdp/image)

; constants
(define BACKGROUND (empty-scene 100 100))
(define LIGHT-RADIUS 40)


; A TrafficLight shows one of these three colors:
; - "red"
; - "green"
; - "yellow"
; interpretation: each element of TrafficLight represents which colored bulb
;                   is currently turned on


; TrafficLight -> Image
; render a traffic light with the given color s

(check-expect (render "red")
              (overlay (circle LIGHT-RADIUS "solid" "red") BACKGROUND))

(define (render s)
  (overlay (circle LIGHT-RADIUS "solid" s) BACKGROUND))


; TrafficLight -> TrafficLight
; determines the next state of the traffic light from the given s

(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "green") "yellow")
(check-expect (traffic-light-next "yellow") "red")

(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))


; TrafficLight -> TrafficLight
; main function to launch the program
(define (traffic-light-prog s)
  (big-bang s
            [on-tick traffic-light-next]
            [to-draw render]))


(traffic-light-prog "red")