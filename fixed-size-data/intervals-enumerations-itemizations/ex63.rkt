;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex63) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; As 'From Functions to Programs' says, programs must define (unusual) constants
; and use names instead of actual constants. In this spirit, a proper data
; representation for traffic lights introduces three constant definitions
; and uses the constant's names:

(define RED 0)
(define GREEN 1)
(define YELLOW 2)

; A S-TrafficLight shows one of three colors:
; – RED
; – GREEN
; – YELLOW


; If the names are chosen propeely, such a data definition does not need an
; interpretation statement.

; Given this specific data definition, you might define two different functions
; that switch the state of a traffic light in a simulation program:

; S-TrafficLight -> S-TrafficLight
; determines the next state of the traffic light, given cs
(define (tl-next-symbolic cs)
  (modulo (+ cs 1) 3))
   
(define (tl-next-symbolic cs)
  (cond
    [(equal? cs RED) GREEN]
    [(equal? cs GREEN) YELLOW]
    [(equal? cs YELLOW) RED]))

; Which of the two is properly designed using the recipe for itemization?

; Which of the two continues to work if you change the constants to

(define RED "red")
(define GREEN "green")
(define YELLOW "yellow")


;; A: The latter one is much properly designed using the recipe for itemization!