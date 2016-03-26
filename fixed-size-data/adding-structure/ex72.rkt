;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex72) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Formulates a data definition for the above phone structure type definition
; that accommodates the given examples.

;; A: 
(define-struct phone [area number])
; A Phone is a structure: (make-phone Number Number)
; interpretation: a phone's area code, and its number
;;

; Next formulate a data definition for phone numbers using this structure type
; definition:

(define-struct phone# [area swith num])

; Historically, the first three digits makes up the area code, the next three
; the code for the phone switch(exchange) of your neighborhood, and the last four
; represent the phone with respect to the neighborhood.
; Describe the content of three fields as precisely as possible with intervals.

; A Phone# is a structure: (make Number Number Number)
; interpretation: a phone's area code is a 3-digit number that is between 000 and
; 999, switch number is a 3-digit number that is between 000 and 999, number is a
; 4-digit number that is between 0000 and 9999