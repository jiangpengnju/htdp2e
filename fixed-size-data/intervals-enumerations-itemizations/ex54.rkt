;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex54) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Determine the integers that each of the four intervals contains.

; [3, 5] -- 3, 4, 5
; (3, 5] -- 4, 5
; [3, 5) -- 3, 4
; (3, 5) -- 4