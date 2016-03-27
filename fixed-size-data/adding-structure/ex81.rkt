;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex81) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design the function time->seconds, which consumes instances of time structures
; (see ex77)
; and produces the number of seconds that have passed since midnight.
; For example, if you are representing 12 hours, 30 minutes, and 2 seconds with
; one of these structures and if you then apply time->seconds to this instance,
; the correct result is 45002.


(define-struct time [hour minute second])
; A Time is a structure: (make-time Number Number Number)
; interpretation: (make-time h m s) is a time point that is h hours,
;  m minutes and s seconds since midnight.

(define ex1 (make-time 12 30 2))
(define ex2 (make-time 1 10 3))


; Time -> Number
; computes the number of seconds that t hava passed since midnight

(check-expect (time->seconds ex1) 45002)
(check-expect (time->seconds ex2) (+ (* 1 3600) (* 10 60) 3))

(define (time->seconds t)
  (+ (* (time-hour t) 3600) (* (time-minute t) 60) (time-second t)))