;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Some eveday problems are expressible as a Boolean expression:
; Sample Problem: Suppose you want to decide whether today is an apporiate day
;      to go to the mall. You go to the mall if it is either not sunny or if
;      today is Friday(because that is when stores post new sales items).

; Here is how you could go about it using you new knowledge about Booleans.
; First add the following two lines to the definitions area of DrRacket:

(define sunny #true)
(define friday #false)

; Now create an expression that computes whether sunny is false or friday is true.
; So in this paticular case, the answer is #false.

(or (not sunny) friday)