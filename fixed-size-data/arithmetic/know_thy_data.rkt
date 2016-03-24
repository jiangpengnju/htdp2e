;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname know_thy_data) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; predicate, which is a function that consumes a value and determines whether
; or not it belongs to some class of data.
(number? 5)
(number? pi)
(number? #true)
(number? "fortytwo")

(define in "123")
(if (string? in) (string-length in) "what you input is not string")

(rational? pi)
(real? e)
(exact? pi)