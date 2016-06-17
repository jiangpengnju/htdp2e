;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex225) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A list of two items is another, frequently used form of data in ISL programming.
; Here is data definition with two parameters:

; A [List X Y] is a structure:
;   (cons X (cons Y '()))


;Instantiate this definition to retrieve
;pairs of Numbers,

;pairs of Numbers and 1Strings, and

;pairs of Strings and Booleans.

;Also make one concrete example for each of these three data definitions.


; A [List Number Number] is a pair of Numbers
; A [List Number 1String] is a pair of Number and 1String
; A [List String Boolean] is a pair of String and Boolean


(cons 2 (cons 3 '()))
(cons 3 (cons "a" '()))
(cons "abc" (cons #f '()))