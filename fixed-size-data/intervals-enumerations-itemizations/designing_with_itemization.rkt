;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname designing_with_itemization) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Demonstrating the six design steps for problems concerning functions that
; consume itemizations, including enumerations and intervals.

; Sample Problem: The state of Tax Land has created a three-stage sales tax
; to cope with its budget defict.
; Inexpensive items, those costing less than $1,000, are not taxed.
; Luxury items, with a price of more than $10,000, are taxed at the rate of
; eight percent (8.00%).
; Everything in between comes with a five percent (5%) mark up.

; Design a function for a cash register that given the price of an item,
; computes the sales tax.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 1. When the problem statement distinguishes different classes of input information,
;    you need carefully formulated data definitions.

; A Price falls into one of three intervals:
; - 0 through 1000;
; - 1000 through 10000;
; - 10000 and above.
; interpretation: the price of an item


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 2. As far as the signature, purpose statement, and function header are concerned,
;    you proceed as before.

; Price -> Number
; computes the amount of tax charge for price p
(define (sales-tax p) 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 3. For functional examples, however, it is imperative that you pick at least
;    one example from each subclass in the data definition.
;    Also, if a subclass is a finite range, be sure to pick examples from the
;    boundaries of the range and from its interior.

; Since our sample data definition involves three distinct intervals, let us pick
; all boundary examples and one price from inside each interval and determine the
; amount of tax for each: 0, 537, 1000, 1282, 10000, 12017.

; turn examples into test cases:
(check-expect (sales-tax 0) 0)
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 1000) (* 0.05 1000))
(check-expect (sales-tax 1282) (* 0.05 1282))
(check-expect (sales-tax 10000) (* 0.08 10000))
(check-expect (sales-tax 12017) (* 0.08 12017))

;; Instead of just writing down the expected result, we write down
;; HOW to compute the expected result.
;; This makes it easier later to formulate the function definition.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 4. Conditional template.
;     "the template mirrors the organization of subclasses with a cond."

; Price -> Number
; computes the amount of tax charge for price p
(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p 1000)) ...]
    [(and (<= 1000 p) (< p 10000)) ...]
    [(>= p 10000) ...]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 5. Define the function

; Price -> Number
; computes the amount of tax charged for price p
(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p 1000)) 0]
    [(and (<= 1000 p) (< p 10000)) (* 0.05 p)]
    [(>= p 10000) (* 0.08 p)]))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 6. Run tests and make sure that the tests cover all cond clauses.