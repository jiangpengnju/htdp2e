;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname ex22) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; Define the function string-delete, which consumes a string and a number i and
; which deletes the ith position from str. Assume i is a number between 0(inclusive)
; and the length of the given string(exclusive). See excercise 4 for ideas.
; Can string-delete deal with empty strings?

(define (string-delete str i)
  (string-append (substring str 0 i) (substring str (add1 i))))


;> (string-delete "helloworld" 5)
;"helloorld"