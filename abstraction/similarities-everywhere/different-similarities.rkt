;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname different-similarities) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Lon Number -> Lon
; select those numbers on l that are below t
(define (small l t)
  (cond
    [(empty? l) '()]
    [else
     (cond
       [(< (first l) t)
        (cons (first l)
              (small (rest l) t))]
       [else
        (small (rest l) t)])]))


; Lon Number -> Lon
; select those numbers on l that are above t
(define (large l t)
  (cond
    [(empty? l) '()]
    [else
     (cond
       [(> (first l) t)
        (cons (first l)
              (large (rest l) t))]
       [else
        (large (rest l) t)])]))


(define (extract R l t)
  (cond
    [(empty? l) '()]
    [else
     (cond
       [(R (first l) t)
        (cons (first l)
              (extract R (rest l) t))]
       [else
        (extract R (rest l) t)])]))

(check-expect (extract < '() 5) (small '() 5))
(check-expect (extract < '(3) 5) (small '(3) 5))
(check-expect (extract < '(1 6 4) 5) (small '(1 6 4) 5))


; Lon Number -> Lon
(define (small-1 l t)
  (extract < l t))

; Lon Number -> Lon
(define (large-1 l t)
  (extract > l t))


; Number Number -> Boolean
; is the area of a square with side x larger than c
(define (squared>? x c)
  (> (* x x) c))


;;;;;;; -- single-point-of-control .;;;;;;;;;;

; Nelon -> Number
; determines the smallest number on l
(define (inf l)
  (cond
    [(empty? (rest l))
     (first l)]
    [else
     (cond
       [(< (first l) (inf (rest l)))
        (first l)]
       [else
        (inf (rest l))])]))

; Nelon -> Number
; determines the largest number on l
(define (sup l)
  (cond
    [(empty? (rest l))
     (first l)]
    [else
     (cond
       [(> (first l) (sup (rest l)))
        (first l)]
       [else
        (sup (rest l))])]))
