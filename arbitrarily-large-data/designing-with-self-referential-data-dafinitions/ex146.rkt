;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex146) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design sorted>?. The function consumes a NEList-of-temperatures. It produces #t
; if the temperatures are sorted in descending order, that is, if the second is
; smaller than the first, the third smaller than the second, and so on.
; Otherwise it produces #f.


; A NEList-of-temperatures is one of:
; - (cons CTemperature '())
; - (cons CTemperature NEList-of-temperatures)
; interpretation: non-empty lists of measured temperatures.

; A CTemperature is a Number greater or equal to -273.

(define ex2 (cons 1 '()))
(define ex3 (cons 1 (cons 2 (cons 3 '()))))
(define ex4 (cons 3 (cons 2 (cons 1 '()))))


; NEList-of-temperatures -> Boolean
; are the items of anelot sorted in descending order

(check-expect (sorted>? ex2) #t)
(check-expect (sorted>? ex3) #f)
(check-expect (sorted>? ex4) #t)

(define (sorted>? anelot)
  (cond
    [(empty? (rest anelot)) #t]
    [(cons? (rest anelot))
     (and (> (first anelot) (first (rest anelot)))
          (sorted>? (rest anelot)))]))