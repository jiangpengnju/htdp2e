;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex126) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Pick the legal from the illegal sentences in the following list:

; 1.
(define-struct oops [])

; 2.
(define-struct child [parents dob date])

; 3.
;(define-struct (child person) [dob date])


;; A: 2 ok
;      1 OK!
; > (oops? (make-oops))
; #true