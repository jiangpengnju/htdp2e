;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex227) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Compare and contrast the data definitions for NEList-of-temperatures and NeList-of-Booleans.
; Then formulate an abstract data definition NEList-of.


; A [NEList-of ITEM] is one of:
; - (cons ITEM '())
; - (cons ITEM [NEList-of ITEM])


; A NEList-of-temperature is a [NEList-of Temperature]
; A NEList-of-Booleans is a [NEList-of Boolean]