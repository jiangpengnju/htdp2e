;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex36) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design the function string-first, which extracts the first character
; from a non-empty string. Don't worry about empty strings.


; String -> 1String
; extracts the first character from a non-empty str
; given: "hello", expect: "h"
; given: "world", expect: "w" 
(define (string-first str)
  (string-ith str 0))

;> (string-first "hello")
;"h"
;> (string-first "world")
;"w"