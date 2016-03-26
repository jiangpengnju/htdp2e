;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname computing_with_structures) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define-struct ball [location velocity])

(define l0 111)
(define v0 10)

(check-expect (ball-location (make-ball l0 v0)) l0)
(check-expect (ball-velocity (make-ball l0 v0)) v0)


;; In general, a predicate recognizes exactly those values constructed with
;  a constuctor of the same name.