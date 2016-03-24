;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex20) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; Define the function string-join, which consumes two strings and append them
; with "_" in between. See excercise 2 for ideas.

(define (string-join prefix suffix)
  (string-append prefix "_" suffix))


;> (string-join "hello" "world")
;"hello_world"