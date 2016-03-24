;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex39) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design the function string-rest, which prodcuce a string like the given one
; with the first character removed.


; String -> String
; produce a string like the given string str with the first character removed.
; given: "hello", expect: "ello"
; given: "world", expect: "orld"
(define (string-rest str)
  (substring str 1))



;> (string-rest "hello")
;"ello"
;> (string-rest "world")
;"orld"