;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex78) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Provide a structure type definition and a data definition for representing
; lower-case three-letter words. A word consists of letters, represented with
; the one-letter strings "a" through "z" plus #false.


; A Letter is one of:
; "a" through "z"
; #false


(define-struct word [l1 l2 l3])
; A Word is a structure: (make-word Letter Letter Letter)
; interpretation: (make-word l1 l2 l3) represents a word consists of three Letters
; l1, l2, l3 (orderly)