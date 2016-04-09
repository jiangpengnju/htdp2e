;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname ex185) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; You know about first and rest from BSL, but BSL+ comes with even more
; selectors than that.
; Determine the values of the following expressions:

; 1.
(first (list 1 2 3))

; 2.
(rest (list 1 2 3))

; 3.
(second (list 1 2 3))

; Find out from the documentation whether third, fourth, and fifth exist.



(check-expect (first (list 1 2 3))
              1)

(check-expect (rest (list 1 2 3))
              (list 2 3))

(check-expect (second (list 1 2 3))
              2)