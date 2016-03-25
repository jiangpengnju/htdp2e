;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex60) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Introduce constant definitions that separate the intervals for low prices
; and luxury prices from the others so that the legislator in Tax Land can
; easily raise the taxes even more.

; constants:
(define CHEAP 1000)
(define LUXURY 10000)
(define MEDIUM-RATE 0.05)
(define LUXURY-RATE 0.08)

; A Price falls into one of three intervals:
; - 0 through CHEAP;
; - CHEAP through LUXURY;
; - LUXURY and above.
; interpretation: the price of an item


; Price -> Number
; computes the amount of tax charge for price p

(check-expect (sales-tax 0) 0)
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax CHEAP) (* MEDIUM-RATE CHEAP))
(check-expect (sales-tax 1282) (* MEDIUM-RATE 1282))
(check-expect (sales-tax LUXURY) (* LUXURY-RATE LUXURY))
(check-expect (sales-tax 12017) (* LUXURY-RATE 12017))

(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p CHEAP)) 0]
    [(and (<= CHEAP p) (< p LUXURY)) (* MEDIUM-RATE p)]
    [(>= p LUXURY) (* LUXURY-RATE p)]))
