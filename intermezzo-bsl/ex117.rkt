;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex117) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Explain why the following sentences are syntactically legal expressions.


; 1. x
; 2. (= y z)
; 3. (= (= y z) 0


; A:
; 1.  x is a variable
; 2. (= y x) is of this shape:   (primitive expr expr)
; 3. (= (= y z) 0) is of this shape: (primitive expr expr)