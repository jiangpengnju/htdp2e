;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; Define the function bool-imply. It consumes two Boolean values, call them
; sunny and friday. The answer of the function is #true if sunny is false or
; friday is true.

(define (bool-imply sunny friday)
  (or (not sunny) friday))


;> (bool-imply #false #true)
;#true
;> (bool-imply #false #false)
;#true
;> (bool-imply #true #true)
;#true
;> (bool-imply #true #false)
;#false