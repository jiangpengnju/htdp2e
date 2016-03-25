;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex52) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; If you copy and paste the above function definition into the definitions area
; of DrRacket and click RUN, DrRacket highlights two of the three cond lines.
; This coloring tells your that your test cases do not cover the full conditional.
; Add enough tests to make DrRacket happy.


; A TrafficLight shows one of these three colors:
; - "red"
; - "green"
; - "yellow"
; interpretation: each element of TrafficLight represents which colored bulb
;                   is currently turned on


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