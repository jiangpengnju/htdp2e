;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex77) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Provide a structure type definition and a data definition for representing
; points in time since midnight. A point in time consists of three numbers:
; hours, minutes, and seconds.


(define-struct TimePoint [hour minute second])
; A TimePoint is a structure: (make Number Number Number)
; interpretation: (make-TimePoint h m s) is a point in time that is h hours,
;  m minutes and s seconds since midnight.