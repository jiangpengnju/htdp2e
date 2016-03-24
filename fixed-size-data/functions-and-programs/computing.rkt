;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname computing) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define (f x) 1)

(define (g x y) (+ 1 1))

(define (h x y z) (+ (* 2 2) 3))

(define (ff a)
  (* 10 a))


(f (+ 1 1))

(+ (ff (+ 1 2)) 2)
(* (ff 4) (+ (ff 3) 2))


(define (opening first-name last-name)
  (string-append "Dear " first-name ","))

(opening "Matthew" "Fisler")

