;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname abstractions-from-examples) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; List-of-numbers -> List-of-numbers
; converts a list of Celsius 
; temperatures to Fahrenheit

(check-expect
 (cf*
  (list 100 0 -40))
 (list 212 32 -40))

(define (cf* l)
  (cond
    [(empty? l) '()]
    [else
     (cons (C2F (first l))
           (cf* (rest l)))]))


; Number -> Number
; converts one Celsius 
; temperature to Fahrenheit 
(define (C2F c)
  (+ (* 9/5 c) 32))


; Inventory -> List-of-strings
; extracts the names of toys 
; from an inventory

(check-expect
 (names
  (list
   (make-IR "doll" 21.0)
   (make-IR "bear" 13.0)))
 (list "doll" "bear"))

(define (names i)
  (cond
    [(empty? i) '()]
    [else
     (cons (IR-name (first i))
           (names (rest i)))]))


(define-struct IR [name price])
; An IR is (make-IR String Number)
; An Inventory is one of: 
; – '()
; – (cons IR Inventory)



(define (map1 k g)
  (cond
    [(empty? k) '()]
    [else
     (cons (g (first k))
           (map1 (rest k) g))]))


; List-of-numbers -> List-of-numbers

(check-expect
 (cf*-from-map1
  (list 100 0 -40))
 (list 212 32 -40))

(define (cf*-from-map1 l)
  (map1 l C2F))


; Inventory -> List-of-strings

(check-expect
 (names-from-map1
  (list
   (make-IR "doll" 21.0)
   (make-IR "bear" 13.0)))
 (list "doll" "bear"))

(define (names-from-map1 l)
  (map1 l IR-name))



; List-of-numbers -> List-of-numbers
(define (add1-to-each l)
  (map1 l add1))