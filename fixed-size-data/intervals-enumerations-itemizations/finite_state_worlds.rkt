;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname finite_state_worlds) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Designing a traffic light.


; TrafficLight is a string which falls in:
; - "red"
; - "green"
; - "yellow"
; interpretation: represents current color of the light


; TrafficLight -> TrafficLight
; determines the next state of the traffic light, given current-state
(define (tl-next current-state) current-state)

; TrafficLight -> Image
; renders the current state of the traffic light as an image
(define (tl-render current-state) (empty-scene 100 30))


; TrafficLight -> TrafficLight
; simulates a traffic light that changes with each clock tick
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
            [to-draw tl-render]
            [on-tick tl-next] 1))