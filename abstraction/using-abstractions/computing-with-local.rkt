;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname computing-with-local) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Nelon -> Number
; determines the smallest number on l
(define (inf l)
  (cond
    [(empty? (rest l)) (first l)]
    [else
     (local ((define smallest-in-rest (inf (rest l))))
       (cond
         [(< (first l) smallest-in-rest) (first l)]
         [else smallest-in-rest]))]))



((local ((define (f x) (+ (* 4 (sqr x)) 3))) f)
 1)