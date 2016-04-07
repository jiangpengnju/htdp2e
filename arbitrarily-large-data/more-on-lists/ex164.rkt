;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex164) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Define the function convert-euro, which converts a list of US$ amounts into
; a list of € amounts. Look up the current exchang rate on the web.

; Generalize convert-euro to the function convert-euro*, which consumes an
; exchange rate and a list of US$ amounts and converts the latter into a list
; of € amounts.


;; 1.00 USD	=	0.879650 EUR     Mid-market rates: 2016-04-07 12:34 UTC
;; http://www.xe.com/currencyconverter/convert/?From=USD&To=EUR


(define CURRENT-RATE 0.0879650)


; List-of-N -> List-of-N
; converts alous into a list of euro amounts.

(check-within (convert-euro '()) '() 0.01)
(check-within (convert-euro (cons 10 '()))
              (cons 0.879650 '())
              0.000001)

(define (convert-euro alous)
  (convert-euro* alous CURRENT-RATE))



; List-of-N Number -> List-of-N
; converts alous into a list of euro amounts with given change rate.

(check-expect (convert-euro* '() 1.1) '())
(check-within (convert-euro* (cons 10 '()) 1.1)
              (cons 11 '())
              0.01)

(define (convert-euro* alous rate)
  (cond
    [(empty? alous) '()]
    [else (cons (us2euro (first alous) rate)
                (convert-euro* (rest alous) rate))]))


; Number -> Number
; convert from amount in US to amount in euro.

(check-expect (us2euro 10 1) 10)
(check-expect (us2euro 20 2) 40)

(define (us2euro amount rate)
  (* amount rate))