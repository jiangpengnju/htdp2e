;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname similarities-in-functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Two similar functions


; Los -> Boolean
; does l contain "dog"
(define (contains-dog? l)
  (cond
    [(empty? l) #f]
    [else
     (or
      (string=? (first l) "dog")
      (contains-dog? (rest l)))]))


; Los -> Boolean
; does l contain "cat"
(define (contains-cat? l)
  (cond
    [(empty? l) #f]
    [else
     (or
      (string=? (first l) "cat")
      (contains-cat? (rest l)))]))

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