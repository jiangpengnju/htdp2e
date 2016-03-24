;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(require 2htdp/image)

(define (f x) 1)

(define (g x y) (+ 1 1))

(define (h x y z) (+ (* 2 2) 3))


(f 1)
(f 2)
(f "hello world")
(f #true)
(f (circle 4 "solid" "red"))


;(f)
;(f 1 2 3 4 5)


(define (ff a)
  (* 10 a))

(+ (ff 3) 2)
(* (ff 4) (+ (ff 3) 2))
(ff (ff 1))