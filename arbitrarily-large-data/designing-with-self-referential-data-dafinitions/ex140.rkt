;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex140) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Now take a look at this data definition:

; A List-of-numbers is one of:
; - '()
; - (cons Number List-of-numbers)

; Some elements of this class of data are appropriate inputs for sum from ex139
; and some aren't.

; Design the function pos?, which consumes a List-of-numbers and determines whether
; all numbers are positive numbers. In other words, if (pos? l) yields #true, then
; l is an element of List-of-amounts.
; Use DrRacket's stepper to understand how pos? works for (cons 5 '())
;   and (cons -1 '()).

; Also design checked-sum. The function consumes a List-of-numbers. It produces
; their sum if the input also belongs to List-of-amounts; otherwise it signals
; an error.
; Hint: Recall to use check-error.

; What does sum compute for an element of List-of-numbers?

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; A List-of-amouts is one of:
; - '()
; - (cond PositiveNumber List-of-amounts)
; interpretation: a List-of-amounts represents some amount of money


; List-of-amounts -> Number
; calculates the sum of the amounts in a given alos

(define (sum alos)
  (cond
    [(empty? alos) 0]
    [else (+ (first alos)
             (sum (rest alos)))]))


;;;;;;;;;;;;;;;;;;;

(define ex1 '())
(define ex2 (cons 1 '()))
(define ex3 (cons 2 (cons 1 '())))
(define ex4 (cons -1 '()))
(define ex5 (cons 3 (cons -1 '())))
(define ex6 (cons 0 '()))


; List-of-numbers -> Boolean
; checks whether all numbers in alon are positive numbers.

(check-expect (pos? ex1) #t)
(check-expect (pos? ex2) #t)
(check-expect (pos? ex3) #t)
(check-expect (pos? ex4) #f)
(check-expect (pos? ex5) #f)
(check-expect (pos? ex6) #f)

(define (pos? alon)
  (cond
    [(empty? alon) #t]
    [else (and (> (first alon) 0)
               (pos? (rest alon)))]))



; List-of-numbers -> Number
; computes the sum of elements in alon,
; if alon is a List-of-amounts

(check-expect (checked-sum ex1) 0)
(check-expect (checked-sum ex2) 1)
(check-expect (checked-sum ex3) 3)
(check-error (checked-sum ex4))
(check-error (checked-sum ex5))
(check-error (checked-sum ex6))

(define (checked-sum alon)
  (cond
    [(pos? alon) (sum alon)]
    [else (error "sum: list-of-amounts expected")]))


;; A: sum computes the sum of all numbers in an element of List-of-numbers.
