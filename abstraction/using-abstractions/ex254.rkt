;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname ex254) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Use DrRacket’s stepper to find out how it evaluates this expression

((local ((define (f x) (+ x 3))
         (define (g x) (* x 4)))
   (if (odd? (f (g 1)))
       f
       g))
 2)