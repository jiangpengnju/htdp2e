;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname arithmetic_of_booleans) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; or checks whether any of the given Boolean values is #true:
(or #true #true)
(or #true #false)
(or #false #true)
(or #false #false)

; and checks whether all of the given Boolean values is #true:
(and #true #true)
(and #true #false)
(and #false #true)
(and #false #false)

; not always picks the Boolean that isn't given:
(not #true)
(not #false)