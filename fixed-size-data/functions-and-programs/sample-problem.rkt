;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname sample-problem) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Image the owner of a monopolistic movie theater. He has complete freedom in
; setting ticket prices. The more he charges, the fewer the people who can
; afford tickets. The less he charges, the more it costs to run a show
; because attendance goes up. In a recent experiment the owner determined a
; relationship between the price of a ticket and average attendance.

; At price of $5.00 per ticket, 120 people attend a perfomance. For each
; 10-cent change in the ticket price, the average attendance changes by 15 people.
; That is, if the owner charges $5.10, some 105 people attend on the average;
; if the price goes down to $4.90, average attendance increases to 135. Let us
; translate this idea into a mathematical formula.

;            avg attendance = 120 - (chang in price / 0.10) * 15 people

; Unfortunately, the increased attendance also comes at an increased cost.
; Every performance comes at a fixed costs of $180 to the owner plus a variable
; cost of $0.04 per attendee.

; The owner would like to know the exact relationship between profit and ticket
; price so that he can maximize his profit.

(define (attendees ticket-price)
  (- 120 (* (- ticket-price 5.0) (/ 15 0.1))))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ 180 (* 0.04 (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))
