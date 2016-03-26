;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex79) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Create examples for the following data definitions:

; A Color is one of:
; — "white"
; — "yellow"
; — "orange"
; — "green"
; — "red"
; — "blue"
; — "black"

"white"
"orange"
"green"
"red"
"black"


; H (a "happiness scale value") is a number in [0, 100],
; i.e., a number between 0 and 100

0
1
2
55
99
100


(define-struct person [fstname lstname male?])
; Person is (make-person String String Boolean)

(make-person "John" "Doe" #t)
(make-person "Fiona" "King" #f)


(define-struct dog [owner name age happiness])
; Dog is (make-dog Person String String Boolean)
; interpretation: describes a dog's owner, its name, age, and whether it's happy.
(make-dog (make-person "John" "Doe" #t)
          "Tiger"
          "2"
          #t)
(make-dog (make-person "Fiona" "King" #f)
          "Cuty"
          "4"
          #f)


; Weapon is one of:
; - #false
; - Posn
; interpretation: #false means the missile hasn't been fired yet;
; an instance of Posn means the missile is in flight

#false
(make-posn 12 23)