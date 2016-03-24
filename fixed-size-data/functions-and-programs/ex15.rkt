;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex15) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; Define the function string-first, which extracts the first 1String from a
; non-empty string. Don't worry about empty strings.

(define (string-first str)
  (string-ith str 0))


;> (string-first "abcd")
;"a"