;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex62) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; An alternative data representation for a traffic light program may use the
; numbers instead of strings: 


; A N-TrafficLight shows one of three colors:
; – 0
; – 1
; – 2
; interpretation 0 means the traffic light shows red,
; 1 green, and 2 yellow


; Re-draw the transition diagram from figure 18 for N-TrafficLight.

;Study the following variant of tl-next:

; N-TrafficLight -> N-TrafficLight
; determines the next state of the traffic light, given current-state

(check-expect (tl-next-numeric 1) 2)
(check-expect (tl-next-numeric 2) 0)
(check-expect (tl-next-numeric 0) 1)

(define (tl-next-numeric current-state)
  (modulo (+ current-state 1) 3))

;Re-formulate the test cases for tl-next for tl-next-numeric.
; Does the tl-next function convey its intention more clearly than the
; tl-next-numeric function? If so, why? If not, why not?

;; A: less clearly. because you have to interprete the numbers to what they
; represents.

