;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex221) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Use contains? to define functions that search for "atom", "basic", and "zoo", respectively.
;------------------------------------------------------

; String Los -> Boolean
; determine whether l contains the string s
(define (contains? s l)
  (cond
    [(empty? l) #f]
    [else
     (or (string=? (first l) s)
         (contains? s (rest l)))]))

; Los -> Boolean
; does l contain "dog"
(define (contains-dog? l)
  (contains? "dog" l))

; Los -> Boolean
; does l contain "cat"
(define (contains-cat? l)
  (contains? "cat" l))



; Los -> Boolean
; does l contain "atom"
(define (contains-atom? l)
  (contains? "atom" l))

; Los -> Boolean
; does l contain "basic"
(define (contains-basic? l)
  (contains? "basic" l))

; Los -> Boolean
; does l contain "zoo"
(define (contains-zoo? l)
  (contains? "zoo" l))