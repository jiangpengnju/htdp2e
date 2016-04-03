;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex132) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Provide a data definition for representing lists of Boolean values.
; The class contains all arbitrarily long lists of Booleans.


; A List-of-Booleans is one of:
; - '()
; - (cons Boolean List-of-Booleans)
; interpretation: a List-of-Booleans represents a list of Boolean values.


'()

(cons #t '())
(cons #f '())

(cons #t
      (cons #f '()))

(cons #f
      (cons #t
            (cons #t '())))