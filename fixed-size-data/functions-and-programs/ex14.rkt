;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex14) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; Define the function cube-volume, which accepts the length of a side of a
; equilateral cube and computes its volume. If you have time, consider
; defining cube-surface, too

(define (cube-volume x)
  (* x x x))

(define (cube-surface x)
  (* 6 x x))