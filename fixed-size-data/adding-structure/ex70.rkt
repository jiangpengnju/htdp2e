;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex70) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Spell out the laws that the following structure type definitions introduce:

(define-struct centry [name home office cell])

(define-struct phone [area number])

; Use these laws to explain how DrRacket arrives at 101 as the value of this
; expression:

(phone-area
 (centry-office
  (make-centry
    "Shriram Fisler"
    (make-phone 207 "363-2421")
    (make-phone 101 "776-1099")
    (make-phone 208 "112-9981"))))
;== ; uses the law for centry-office
;(phone-area
; (make-phone 101 "776-1099"))
;== ; uses the law for phone-area
;101

; Confirm them with DrRacket's stepper.
