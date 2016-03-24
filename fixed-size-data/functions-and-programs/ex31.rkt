;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex31) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; After studying the costs of a show, the owner discovered several ways of
; lowering the cost. As a result of his improvements, he no longer has a fixed
; cost. He now simply pays $1.50 per attendee.

; Modify both programs(good and bad solution) to reflect this change. When
; the programs are modified, test them again with ticket prices of $3, $4,
; and $5 and compare the results.

(define BASE_PEOPLE 120)
(define BASE_PRICE 5.0)
(define DECREASING_RATE (/ 15 0.1))
(define VARIABLE_COST_PER_PEOPLE 1.50)

(define (attendees ticket-price)
  (- BASE_PEOPLE (* (- ticket-price BASE_PRICE) DECREASING_RATE)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (* VARIABLE_COST_PER_PEOPLE (attendees ticket-price)))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))

(profit 3.0)
(profit 4.0)
(profit 5.0)

(define (profit1 price)
  (- (* (+ 120
           (* (/ 15 0.1)
              (- 5.0 price)))
        price)
     
        (* 1.50
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price))))))
(profit1 3.0)
(profit1 4.0)
(profit1 5.0)