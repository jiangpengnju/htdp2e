;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex40) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design the function string-remove-last, which produces a string like the
; given one with the last character removed.


; String -> String
; produces a string like the given string str with the last character removed.
; given: "hello", expect: "hell"
; given: "world", expect: "worl"
(define (string-remove-last str)
  (substring str 0 (sub1 (string-length str))))


;> (string-remove-last "hello")
;"hell"
;> (string-remove-last "world")
;"worl"