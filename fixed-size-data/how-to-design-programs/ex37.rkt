;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex37) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Design the function string-last, which extracts the last character from a
; non-empty string.


; String -> 1String
; extracts the last character from a non-empty string str
; given: "hello", expect: "o"
; given: "world", expect: "d"
(define (string-last str)
  (string-ith str (sub1 (string-length str))))


;> (string-last "hello")
;"o"
;> (string-last "world")
;"d"