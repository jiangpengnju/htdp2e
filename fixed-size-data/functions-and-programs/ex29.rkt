;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex29) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Our solution to the sample problem contains several constants in the middle of
; functions. It is best to give names to such constants so that the future
; readers understand where these numbers come from. Collect all definitions
; in DrRacket's definitions area and change them so that all magic numbers are
; refactored into constant definitions.

(define BASE_PEOPLE 120)
(define BASE_PRICE 5.0)
(define DECREASING_RATE (/ 15 0.1))
(define FIXED_COST 180)
(define VARIABLE_COST_PER_PEOPLE 0.04)

(define (attendees ticket-price)
  (- BASE_PEOPLE (* (- ticket-price BASE_PRICE) DECREASING_RATE)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED_COST (* VARIABLE_COST_PER_PEOPLE (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))
