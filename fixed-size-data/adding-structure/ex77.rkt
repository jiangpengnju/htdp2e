;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex77) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Provide a structure type definition and a data definition for representing
; points in time since midnight. A point in time consists of three numbers:
; hours, minutes, and seconds.


(define-struct time [hour minute second])
; A Time is a structure: (make-time Number Number Number)
; interpretation: (make-time h m s) is a time point that is h hours,
;  m minutes and s seconds since midnight.